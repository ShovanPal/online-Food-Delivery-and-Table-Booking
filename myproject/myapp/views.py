import razorpay
from django.http import JsonResponse
from django.shortcuts import render, redirect
from . models import Menu,Item,CartItem, CustomUser,Order
from . forms import RegistrationForm,MyLogFrm
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.core.mail import EmailMessage, send_mail
from myproject import settings
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.utils.encoding import force_bytes, force_str
from . tokens import generate_token

# Create your views here.

def index(request):
    allMenu=Menu.objects.all().order_by('menu_name')
    menu_items = {}
    for menu in allMenu:
        items = Item.objects.filter(menu=menu)
        menu_items[menu] = items
    return render(request, 'myapp/index.html', {'allMenu':allMenu, 'menu_items': menu_items})

def add_to_cart(request, p_id):
    if request.user.is_authenticated:
        product = Item.objects.get(id=p_id)
        # print(product)
        cart_item, created = CartItem.objects.get_or_create(item=product, user=request.user)
        cart_item.quantity += 1
        cart_item.save()
        return redirect('/cart')
    else:
        return redirect('/login')

def cart(request):
    if request.user.is_authenticated:
        cart_items = CartItem.objects.filter(user=request.user)
        total_price = sum(i.item.price * i.quantity for i in cart_items)
        total_price = int(total_price)
        return render(request, 'myapp/viewCart.html', {'cart_items': cart_items, 'total_price': total_price})
    else:
        return redirect('/login')
    
def remove_cart(request, id):
    if request.user.is_authenticated:
        cart_item = CartItem.objects.get(id=id, user=request.user)
        cart_item.delete()
        return redirect('/cart')
    else:
        return redirect('/login')

def menu(request):
    allMenu=Menu.objects.all().order_by('menu_name')
    menu_items = {}
    for menu in allMenu:
        items = Item.objects.filter(menu=menu)
        menu_items[menu] = items
    return render (request, 'myapp/menu.html', {'allMenu':allMenu , 'menu_items': menu_items})

def book(request):
    return render (request, 'myapp/book.html')

def user_login(request):
    if request.method == 'POST':
        form = MyLogFrm(request=request, data=request.POST)
        if form.is_valid():
            uname = form.cleaned_data['username']
            upass = form.cleaned_data['password']
            user = authenticate(username=uname, password=upass)
            if user is not None:
                login(request, user)
                return redirect('home-page')
    else:
        form = MyLogFrm()
    return render(request, 'myapp/login.html', {'form': form})

def user_logout(request):
    logout(request)
    return redirect('login-page')


def userReg(request):
    if request.method == "POST":
        username = request.POST["username"]
        first_name = request.POST["fname"]
        last_name = request.POST["lname"]
        email = request.POST["email"]
        mobile = request.POST['mobile']
        pass1 = request.POST["pass1"]
        pass2 = request.POST["pass2"]

        if CustomUser.objects.filter(username=username):
            messages.error(request, "Username already exist! Please try some other username.")
            return redirect('/register')
        
        if CustomUser.objects.filter(email=email).exists():
            messages.error(request, "Email Already Registered!!")
            return redirect('/register')
        
        if len(username)>20:
            messages.error(request, "Username must be under 20 charcters!!")
            return redirect('/register')
        
        if pass1 != pass2:
            messages.error(request, "Passwords didn't matched!!")
            return redirect('/register')
        
        if not username.isalnum():
            messages.error(request, "Username must be Alpha-Numeric!!")
            return redirect('/register')
        
        myuser = CustomUser.objects.create_user(username, email, pass1)
        myuser.first_name = first_name
        myuser.last_name = last_name
        # myuser.is_active = False
        myuser.is_active = False
        myuser.save()
        messages.success(request, "Your Account has been created succesfully!! Please check your email to confirm your email address in order to activate your account.")
        
        # Welcome Email
        subject = "Welcome to Our Feane"
        message = "Hello " + myuser.first_name + "!! \n" + "Welcome to Our Feane!! \nThank you for visiting our website\n. We have also sent you a confirmation email, please confirm your email address. \n\nThanking You"        
        from_email = settings.EMAIL_HOST_USER
        to_list = [myuser.email]
        send_mail(subject, message, from_email, to_list, fail_silently=True)
        
        # Email Address Confirmation Email
        current_site = get_current_site(request)
        email_subject = "Confirm your Email"
        message2 = render_to_string('email_confirmation.html',{
            
            'name': myuser.first_name,
            'domain': current_site.domain,
            'uid': urlsafe_base64_encode(force_bytes(myuser.pk)),
            'token': generate_token.make_token(myuser)
        })
        email = EmailMessage(
        email_subject,
        message2,
        settings.EMAIL_HOST_USER,
        [myuser.email],
        )
        send_mail(email_subject, message2, from_email, to_list, fail_silently=True)
        
        return redirect('/login')
        
        
    # return render(request, "authentication/signup.html")
    return render(request, 'myapp/register.html')

def activate(request,uidb64,token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        myuser = CustomUser.objects.get(pk=uid)
    except (TypeError,ValueError,OverflowError,User.DoesNotExist):
        myuser = None

    if myuser is not None and generate_token.check_token(myuser,token):
        myuser.is_active = True
        # user.profile.signup_confirmation = True
        myuser.save()
        login(request,myuser)
        messages.success(request, "Your Account has been activated!!")
        return redirect('/login')
    else:
        return render(request,'activation_failed.html')

def about(request):
    return render (request, 'myapp/about.html')

def initiate_payment(request):
    if request.method == "POST":
        amount = int(request.POST["amount"]) * 100  # Amount in paise
        address=request.POST['address']
        client = razorpay.Client(auth=(settings.RAZORPAY_API_KEY, settings.RAZORPAY_API_SECRET))

        payment_data = {
            "amount": amount,
            "currency": "INR",
            "receipt": "order_receipt",
            "notes": {
                "email": "user_email@example.com",
            },
        }

        order = client.order.create(data=payment_data)
        
        # Include key, name, description, and image in the JSON response
        response_data = {
            "id": order["id"],
            "amount": order["amount"],
            "currency": order["currency"],
            "key": settings.RAZORPAY_API_KEY,
            "name": "Feane",
            "description": "Payment for Your Product",
            "image": "",
        }
        cart_items=CartItem.objects.filter(user=request.user)
        # payment_id=response_data.id
        for cart in cart_items:
            Order.objects.get_or_create(user=request.user, product= cart.item, quantity=cart.quantity, payment_status='success', address=address)
        
        CartItem.objects.filter(user=request.user).delete()

        return JsonResponse(response_data)
    return redirect('myapp:viewCart.html')

def payment_success(request):
    return render(request, "myapp/payment_success.html")

def payment_failed(request):
    return render(request, "myapp/payment_failed.html")


def viewOrders(request):
    if request.user.is_authenticated:
        cart_items=Order.objects.filter(user=request.user)
        return render(request, 'myapp/viewOrders.html', {'cart_items': cart_items})
    else:
        return redirect('/login')

from .forms import BookingForm

def book_table(request):
    if request.method == 'POST':
        form = BookingForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('booking_success')  # Redirect to a success page
    else:
        form = BookingForm()
    return render(request, 'book', {'form': form})

def booking_success(request):
    return render(request, 'myapp/booking_success.html')


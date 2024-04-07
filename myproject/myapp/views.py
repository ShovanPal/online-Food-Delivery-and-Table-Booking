from django.shortcuts import render, redirect
from . models import Menu,Item
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

def cart(request):
    return render (request, 'myapp/cart.html')

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
        fname = request.POST["fname"]
        lname = request.POST["lname"]
        email = request.POST["email"]
        pass1 = request.POST["pass1"]
        pass2 = request.POST["pass2"]

        if User.objects.filter(username=username):
            messages.error(request, "Username already exist! Please try some other username.")
            return redirect('/register')
        
        if User.objects.filter(email=email).exists():
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
        
        myuser = User.objects.create_user(username, email, pass1)
        myuser.fname = fname
        myuser.lname = lname
        # myuser.is_active = False
        myuser.is_active = False
        myuser.save()
        messages.success(request, "Your Account has been created succesfully!! Please check your email to confirm your email address in order to activate your account.")
        
        # Welcome Email
        subject = "Welcome to Saumitra's Django Website Login!!"
        message = "Hello " + myuser.first_name + "!! \n" + "Welcome to Saumitra's Django Website!! \nThank you for visiting our website\n. We have also sent you a confirmation email, please confirm your email address. \n\nThanking You"        
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
        myuser = User.objects.get(pk=uid)
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
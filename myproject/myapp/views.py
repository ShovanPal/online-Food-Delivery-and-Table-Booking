from django.shortcuts import render, redirect
from . models import Menu,Item
from . forms import RegistrationForm,MyLogFrm
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout


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
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Registration is successful')
            return redirect('home-page')
        else:
            messages.error(request, 'Registration is unsuccessful')
    else:
        form = RegistrationForm()
    return render(request, 'myapp/register.html', {'form': form})

def about(request):
    return render (request, 'myapp/about.html')
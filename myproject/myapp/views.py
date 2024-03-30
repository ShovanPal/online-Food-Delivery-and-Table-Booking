from django.shortcuts import render
# Create your views here.

def index(request):
    return render(request, 'myapp/index.html')

def cart(request):
    return render (request, 'myapp/cart.html')

def menu(request):
    return render (request, 'myapp/menu.html')

def book(request):
    return render (request, 'myapp/book.html')

def login(request):
    return render (request, 'myapp/login.html')

def register(request):
    return render (request, 'myapp/register.html')

def about(request):
    return render (request, 'myapp/about.html')
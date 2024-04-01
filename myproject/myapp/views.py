from django.shortcuts import render
from . models import Menu,Item
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

def login(request):
    return render (request, 'myapp/login.html')

def register(request):
    return render (request, 'myapp/register.html')
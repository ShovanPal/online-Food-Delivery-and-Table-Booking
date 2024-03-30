from django.urls import path
from . import views

urlpatterns = [
    path('', views.index,name='home-page'),
    path('cart', views.cart,name='cart-page'),
    path('login', views.login,name='login-page'),
    path('register',views.register,name='register-page'),
    path('book',views.book,name='book-page'),
    path('menu',views.menu,name='menu-page'),
    path('menu',views.about,name='about-page'),


]
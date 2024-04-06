from django.urls import path
from . import views

urlpatterns = [
    path('', views.index,name='home-page'),
    path('cart', views.cart,name='cart-page'),
    path('login', views.user_login,name='login-page'),
    path('register',views.userReg,name='register-page'),
    path('book',views.book,name='book-page'),
    path('menu',views.menu,name='menu-page'),
    path('about',views.about,name='about-page'),
    path('logout/', views.user_logout, name='logout-page'),

]
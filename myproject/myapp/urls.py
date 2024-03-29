from django.urls import path
from . import views

urlpatterns = [
    path('',views.index,name='home-page'),
    path('cart',views.cart,name='cart-page'),
]
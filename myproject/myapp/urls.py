from django.urls import path
from . import views
from .views import book_table, booking_success

urlpatterns = [
    path('', views.index,name='home-page'),
    path('cart', views.cart,name='cart-page'),
    path('login', views.user_login,name='login-page'),
    path('register',views.userReg,name='register-page'),
    path('activate/<uidb64>/<token>', views.activate, name='activate'),
    path('book',views.book,name='book-page'),
    path('menu',views.menu,name='menu-page'),
    path('about',views.about,name='about-page'),
    path('logout/', views.user_logout, name='logout-page'),
    path('add_to_cart/<int:p_id>/', views.add_to_cart, name='adddcart-page'),
    path('remove/<int:id>/', views.remove_cart, name='remcart-page'),
    path("initiate-payment/", views.initiate_payment, name="initiate_payment"),
    path("payment-success/", views.payment_success, name="payment_success"),
    path("payment-failed/", views.payment_failed, name="payment_failed"),
    path("order/", views.viewOrders, name="order-page"),
    path('book', book_table, name='book_table'),
    path('booking-success/', views.booking_success, name='booking_success'),
]
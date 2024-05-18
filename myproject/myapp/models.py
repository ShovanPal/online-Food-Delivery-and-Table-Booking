from django.db import models
from django.contrib.auth.models import AbstractUser, Group, Permission
# Create your models here.

TYPES_CHOICE=(
    ('Veg', 'Veg'),('Non-veg','Non-veg'),('Drinks','Drinks')
);
class CustomUser(AbstractUser):
    mobile = models.CharField(max_length=15)
    address = models.CharField(max_length=250)
    groups = models.ManyToManyField(Group, related_name='custom_user_groups', blank=True)
    user_permissions = models.ManyToManyField(Permission, related_name='custom_user_permissions', blank=True)



class Menu(models.Model):
    menu_name=models.CharField(max_length=100)
    menu_catagory=models.CharField(max_length=10, 
                                   choices=TYPES_CHOICE,
                                   default='Veg')
    def __str__(self):  # Use double underscores
        return self.menu_name + '[' + self.menu_catagory + ']'
    class Meta:
        verbose_name_plural = "Menu"

class Item(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.ImageField(upload_to='item_image/')
    menu=models.ForeignKey(Menu,on_delete=models.CASCADE)

    def __str__(self):
        return self.name
    
class CartItem(models.Model):
	item = models.ForeignKey(Item, on_delete=models.CASCADE)
	quantity = models.PositiveIntegerField(default=0)
	user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
	date_added = models.DateTimeField(auto_now_add=True)

	def __str__(self):
		return f'{self.quantity} x {self.item.name}'
     
class Order(models.Model):
    product = models.ForeignKey(Item, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=0)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    date_ordered = models.DateTimeField(auto_now_add=True)
    payment_status=models.CharField(max_length=255)
    payment_id=models.CharField(max_length=255)
    address=models.TextField()



class Booking(models.Model):
    name = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=15)
    email = models.EmailField()
    persons = models.PositiveIntegerField()
    date = models.DateField()
    time = models.TimeField()

    def __str__(self):
        return f"Booking by {self.name} on {self.date} at {self.time}"

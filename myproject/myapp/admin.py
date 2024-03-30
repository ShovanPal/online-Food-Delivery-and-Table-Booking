from django.utils.html import format_html
from django.contrib import admin
from . models import CustomUser,Menu,Item

# Register your models here.

@admin.register(CustomUser)
class userAdmin(admin.ModelAdmin):
    list_display=('username','mobile','address')

@admin.register(Menu)
class MenuAdmin(admin.ModelAdmin):
    list_display=('menu_name','menu_catagory')

@admin.register(Item)
class ItemAdmin(admin.ModelAdmin):
    def item_image(self, obj):
        return format_html('<img src="{}" width="60" height="60">'.format(obj.image.url))
    
    item_image.short_description = 'Image'
    list_display = ('name', 'description', 'price', 'menu', 'item_image')

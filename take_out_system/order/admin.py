from django.contrib import admin

# Register your models here.
from order.models import Order


class OrderAdmin(admin.ModelAdmin):
    list_display = ('o_name','o_price','o_count','o_number')

admin.site.register(Order,OrderAdmin)

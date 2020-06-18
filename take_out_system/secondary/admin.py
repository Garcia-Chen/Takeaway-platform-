from django.contrib import admin

# Register your models here.
from secondary.models import Good


class GoodAdmin(admin.ModelAdmin):
    list_display=("c_name","c_price","c_sales","c_picture","c_material",)
    raw_id_fields=["shop",]




admin.site.register(Good,GoodAdmin)
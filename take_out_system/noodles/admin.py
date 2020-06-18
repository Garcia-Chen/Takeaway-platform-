from django.contrib import admin

# Register your models here.
from .models import Noodles_shop, Dish_name


class  Noodles_shopAdmin(admin.ModelAdmin):
    list_display =["noodle_name","noodle_adress","noodle_sales","noodle_img","noodle_status","noodle_paise",
                   "noodle_created_time",]
    list_display_links = ["noodle_name"]
    search_fields = ("noodle_name",)
    list_editable = ("noodle_adress","noodle_sales","noodle_img","noodle_status","noodle_paise",)

class Dish_nameAdmin(admin.ModelAdmin):
    list_display =["dish_name","dish_price","dish_sale","dish_image"]
    search_fields = ("dish_name",)
    list_editable = ("dish_price","dish_sale","dish_image",)




admin.site.register(Noodles_shop, Noodles_shopAdmin)
admin.site.register(Dish_name, Dish_nameAdmin)
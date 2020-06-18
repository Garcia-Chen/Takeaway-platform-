from django.contrib import admin

# Register your models here.
from index.models import Store


class StoreAdmin(admin.ModelAdmin):
    list_display = ('store_name','store_adress','store_category','store_sales','store_img',
                    'store_status','store_paise','store_created_time',)

admin.site.register(Store,StoreAdmin)



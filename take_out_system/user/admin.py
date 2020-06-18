from django.contrib import admin

# Register your models here.
from user.models import UserProfile


class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('user_name','user_address','user_phone','is_member')

admin.site.register(UserProfile,UserProfileAdmin)

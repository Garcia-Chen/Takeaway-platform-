from django.db import models

# Create your models here.

class UserProfile(models.Model):
    user_name=models.CharField(max_length=50,verbose_name='用户名')
    user_password=models.CharField(max_length=50,verbose_name='密码',default='')
    user_address=models.CharField(max_length=100,verbose_name='用户地址')
    user_phone=models.CharField(max_length=20,verbose_name='手机号',default='')
    user_nickname=models.CharField(max_length=30,verbose_name='昵称',default='')
    user_avatar=models.ImageField(upload_to='avatar',default='',verbose_name='头像')
    is_member=models.BooleanField(default=False,verbose_name='是否为会员')

    class Meta:
        db_table='user'
        verbose_name='用户'
        verbose_name_plural=verbose_name

class WeiboUser(models.Model):
    wuid=models.CharField(max_length=70,db_index=True)
    access_token=models.CharField(max_length=200)
    buser=models.OneToOneField(UserProfile,null=True)

    class Meta:
        db_table='user_weibo'
from django.db import models

# Create your models here.

class Store(models.Model):
    store_name=models.CharField(max_length=32,verbose_name="商店名称")
    store_adress=models.CharField(max_length=128,verbose_name="商店地址")
    store_category=models.CharField(max_length=30,verbose_name='商店类别',default='')
    store_sales = models.IntegerField(verbose_name="商店销售量",default="")
    store_img=models.ImageField(upload_to="static/upload/stores",verbose_name="商店图片地址",default="")
    store_status=models.BooleanField(default=True,verbose_name="是否营业")
    store_paise=models.DecimalField(max_digits=2,decimal_places=1,verbose_name="店家评分",default="")
    store_created_time=models.DateTimeField(verbose_name="创建时间",auto_now=True)
    bg_img=models.ImageField(upload_to="static/upload/stores",verbose_name="商店二级页面背景图片",default="")

    class  Meta:
        db_table="store"
        verbose_name='商家'
        verbose_name_plural = verbose_name

from django.db import models

# Create your models here.
from index.models import Store

#商品
class Good(models.Model):
    c_name=models.CharField(max_length=30,verbose_name='商品名称')
    c_price=models.DecimalField(max_digits=4,decimal_places=1,verbose_name='商品价格',default='')
    c_sales=models.IntegerField(verbose_name='商品销量')
    c_picture=models.ImageField(upload_to="static/upload/stores",verbose_name='商品图片')
    c_material=models.CharField(max_length=100,verbose_name='商品原料',default='')
    shop=models.ForeignKey(Store)
    class  Meta:
        db_table="good"
        verbose_name='商品'
        verbose_name_plural = verbose_name
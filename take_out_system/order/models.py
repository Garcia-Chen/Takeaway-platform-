from django.db import models

# Create your models here.
from index.models import Store
from user.models import UserProfile


class Order(models.Model):
    o_name=models.CharField(max_length=30,verbose_name='商品名称')
    o_price=models.DecimalField(max_digits=4,decimal_places=1,verbose_name='商品价格',default='')
    o_count=models.IntegerField(verbose_name='商品数量')
    o_number=models.CharField(max_length=50,verbose_name='订单号')
    o_time=models.DateTimeField(auto_now=True,verbose_name='下单时间')
    user=models.ForeignKey(UserProfile)
    shop=models.ForeignKey(Store)
    class  Meta:
        db_table="order"
        verbose_name='订单'
        verbose_name_plural = verbose_name
from django.db import models

# Create your models here.



class Noodles_shop(models.Model):
    noodle_name=models.CharField(max_length=32,verbose_name="面食商店名称",default="")
    noodle_adress=models.CharField(max_length=128,verbose_name="面食商店地址",default="")
    noodle_sales = models.IntegerField(verbose_name="面食商店销售量",default="")
    noodle_img=models.ImageField(upload_to="static/upload/stores",verbose_name="面食商店图片地址",default="")
    noodle_status=models.BooleanField(default=True,verbose_name="是否营业")
    noodle_paise=models.DecimalField(max_digits=2,decimal_places=1,verbose_name="店家评分",default="")
    noodle_created_time=models.DateTimeField(verbose_name="创建时间",auto_now=True)
    bg_img=models.ImageField(upload_to="static/upload/stores",verbose_name="商店二级页面背景图片",default="")
    class  Meta:
        db_table="Nooldles_shop"
        verbose_name_plural = "面食"

    def __str__(self):
        return "<%s>" % (self.noodle_name)

class Dish_name(models.Model):
    dish_name=models.CharField(max_length=11,verbose_name="食品名称")
    dish_price=models.DecimalField(max_digits=5,decimal_places=2,verbose_name="食品价格")
    dish_sale=models.IntegerField(verbose_name="食品销量")
    dish_image=models.ImageField(upload_to="static/upload/foods",verbose_name="食品图片")
    noodle_key=models.ManyToManyField(Noodles_shop)

    class  Meta:
        db_table="Dish_name"
        verbose_name_plural = "面食菜品"


    def __str__(self):
        return "<%s>" % (self.dish_name)

from django.db import models

# Create your models here.
from index.models import Store
from user.models import UserProfile


class Message(models.Model):
    content=models.CharField(max_length=50,verbose_name='留言内容')
    created_time=models.DateTimeField(auto_now_add=True,verbose_name='创建时间')
    parent_id=models.IntegerField(default=0,verbose_name='父留言ID')
    user=models.ForeignKey(UserProfile)
    shop=models.ForeignKey(Store)
    class Meta:
        db_table='message'
        verbose_name='留言表'
        verbose_name_plural=verbose_name
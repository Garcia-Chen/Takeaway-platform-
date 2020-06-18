import datetime
import json
import time
from urllib import parse

from django.db import transaction
from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from index.models import Store
from order.models import Order
from secondary.models import Good
from user.models import UserProfile

#订单管理
def order_deal(request,user_name=None):
    import redis
    pool=redis.Connection(host='localhost',port=6379,db=0)
    r=redis.Redis(connection_pool=pool)

    #处理不同请求
    if request.method=='POST':
        json_str = request.body
        json_obj = json.loads(json_str)
        print(json_obj)
        temp=json_obj.get('obj')
        temp=eval(temp)
        username=json_obj.get('users').replace('"','') #获取订单人
        o_number=json_obj.get('order_num').split('.')[0] #获取订单号
        shopname=json_obj.get('storename').replace('"','')#获取商家名称
        user = UserProfile.objects.filter(user_name=username)  # 获取订单人对象
        if not user:
            result={'code':10303,'error':'error'}
            return JsonResponse(result)
        user=user[0]
        shop=Store.objects.filter(store_name=shopname)[0]  #获取商家对象

        #获取数据
        for k,v in temp.items():
            o_name=k.split('（')[0] #商品名称
            print(o_name)
            o_count=v.split('&')[0] #商品数量
            try:
                good=Good.objects.filter(c_name=o_name)[0]
                good.c_sales+=int(o_count)
                good.save()
            except Exception as e:
                print(e)
                result={'code':10333,'error':'error'}
                return JsonResponse(result)


            print(o_count)
            o_price=float(v.split('&')[-1])*int(o_count)  #商品价格
            o_time=time.strftime("%Y-%m-%d %H:%m:%S")   #下单时间
            try:
                # with r.lock(shop,blocking_timeout=3) as lock:
                    Order.objects.create(o_name=o_name,o_count=int(o_count),o_price=o_price,o_time=o_time,o_number=o_number,
                                         user=user,shop=shop)
                    shop.store_sales+=int(o_count)
                    shop.save()
            except Exception as e:
                print(e)
                # r.expire(lock,3)
                result={'code':10224,'error':'error'}
                return JsonResponse(result)
            result={'code':200}
            return JsonResponse(result)

    elif request.method=='GET':
        if not user_name:
            return render(request, 'order_my.html')
        if user_name:
            user_name=parse.unquote(user_name).replace('"','')
            print(user_name)
            user=UserProfile.objects.filter(user_name=user_name)[0] #获取订单人对象
            #获取订单
            order=Order.objects.filter(user=user)
            if not order:
                result={'code':10231,'error':'Sorry,No order'}
                return JsonResponse(result)
            list=[]
            for item in order:
                dic={}
                dic['username']=user.user_name
                dic['number']=item.o_number
                dic['price']=item.o_price
                dic['count']=item.o_count
                dic['time']=item.o_time
                dic['goodname']=item.o_name
                dic['shop']=item.shop.store_name
                list.append(dic)
            result={'code':200,'data':list}
            return JsonResponse(result)






#{'obj': {'西蓝花炒鸡蛋（力荐）': '2&月售：1000&15', }, 'users': None,'李小姐的店': '李小姐的店'}
#{'西蓝花炒鸡蛋（力荐）': '2&月售：1000', '糖醋排骨（力荐）': '2&月售：1003', '李小姐的店': '李小姐的店'}
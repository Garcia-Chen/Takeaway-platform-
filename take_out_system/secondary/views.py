import random
from urllib import parse
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from index.models import Store
from secondary.models import Good

#商品处理
def good_deal(request,storename=None):
    if request.method=='GET':
        #由于url会自动对url地址进行转码，故后端校验之前进行转码
        storename = parse.unquote(storename)
        print(storename)
        #渲染页面
        try:
            store=Store.objects.get(store_name=storename) #获取商家
            # print(store)
        except Exception as e:
            #获取商家相关数据
            try:
                store = Store.objects.get(id=int(storename))
            except Exception as e:
                result = {'code': 10113, 'error': 'This store is not exist'}
                return JsonResponse(result)

            store_name=store.store_name
            store_image= store.store_img
            bg_image= store.bg_img
            start_price= random.randint(15, 25)
            shipping_fee=random.randint(1,4)
            average_time=random.randint(35,55)
            return render(request,'secondary.html',locals())

        #获取商品
        goods=Good.objects.filter(shop=store)
        #判断商品是否存在
        if not goods:
            result={'code':10203,'error':'Sorry,this store is not business'}
            return JsonResponse(result)
        list = []
        for good in goods:
            dic={}
            dic['c_name']=good.c_name
            dic['c_price']=good.c_price
            dic['c_sales']=good.c_sales
            dic['c_picture']=str(good.c_picture)
            dic['c_material']=good.c_material
            list.append(dic)

        result={'code':200,'msg':list}
        return JsonResponse(result)



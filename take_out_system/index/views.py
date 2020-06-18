from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from index.models import Store
import random

def display(request,type=None):
    if request.method == 'GET':
        if type=="m":
            temp=[]
            temp1=[]
            stores = Store.objects.all()
            while True:
                if len(temp)<8:
                    k=random.choice(stores)
                    if k.id in temp1:
                        k= random.choice(stores)
                    else:
                        dic = {}
                        dic['id'] = k.id
                        dic["store"] = k.store_name
                        dic["address"] = k.store_adress
                        dic["sales"] = k.store_sales
                        dic["img"] = str(k.store_img)
                        dic["status"] = k.store_status
                        dic["paise"] = str(k.store_paise)
                        dic["created_time"] = str(k.store_created_time)
                        temp1.append(k.id)
                        temp.append(dic)
                else:
                    result = {'code': 200, 'msg': temp}
                    return JsonResponse(result)
        elif type=="s":
            stores = Store.objects.all()
            dic = []
            for item in stores:
                dic.append(item.store_name)
            result={"code":200,"msg":dic}
            return JsonResponse(result)



        elif type==None:
            return render(request,"index.html")
        else:
            result=find_category(type)
            return JsonResponse(result)


def find_category(type):
    stores = Store.objects.filter(store_category=type)
    if stores:
        temp = []
        for store in stores:
            dic = {}
            dic['id'] = store.id
            dic["store"] = store.store_name
            dic["address"] = store.store_adress
            dic["sales"] = store.store_sales
            dic["img"] = str(store.store_img)
            dic["status"] = store.store_status
            dic["paise"] = str(store.store_paise)
            dic["created_time"] = str(store.store_created_time)
            temp.append(dic)
        result = {'code': 200, 'msg': temp}
    else:
        result={'code':10100,'error':'Sorry,this category have not store'}

    return result

def find(request,type):
    if request.method=="GET":
        if type=='sales':
            stores = Store.objects.order_by('-store_sales')
            temp = []
            for store in stores:
                dic = {}
                dic['id'] = store.id
                dic["store"] = store.store_name
                dic["address"] = store.store_adress
                dic["sales"] = store.store_sales
                dic["img"] = str(store.store_img)
                dic["status"] = store.store_status
                dic["paise"] = str(store.store_paise)
                dic["created_time"] = str(store.store_created_time)
                temp.append(dic)
            result = {'code': 200, 'msg': temp}
            return JsonResponse(result)

        elif type=='good':
            stores = Store.objects.order_by('-store_paise')
            temp = []
            for store in stores:
                dic = {}
                dic['id'] = store.id
                dic["store"] = store.store_name
                dic["address"] = store.store_adress
                dic["sales"] = store.store_sales
                dic["img"] = str(store.store_img)
                dic["status"] = store.store_status
                dic["paise"] = str(store.store_paise)
                dic["created_time"] = str(store.store_created_time)
                temp.append(dic)
            result = {'code': 200, 'msg': temp}
            return JsonResponse(result)

        elif type=='area':
            stores = Store.objects.order_by('-store_adress')
            temp = []
            for store in stores:
                dic = {}
                dic['id'] = store.id
                dic["store"] = store.store_name
                dic["address"] = store.store_adress
                dic["sales"] = store.store_sales
                dic["img"] = str(store.store_img)
                dic["status"] = store.store_status
                dic["paise"] = str(store.store_paise)
                dic["created_time"] = str(store.store_created_time)
                temp.append(dic)
            result = {'code': 200, 'msg': temp}
            return JsonResponse(result)
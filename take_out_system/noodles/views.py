from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from noodles.models import Noodles_shop


def display(request):
    #数据库存储结构
    #{"store":noodle_name,"content":[{"store":item.noodle_name,..}]}
    all_list=Noodles_shop.objects.all()
    dic1={}
    dic1["code"]=200
    list01=[]
    for item in all_list:
        dic = {}
        dic["store"]=item.noodle_name
        dic["address"]=item.noodle_adress
        dic["sales"]=item.noodle_sales
        dic["img"]=str(item.noodle_img)
        dic["status"]=item.noodle_status
        dic["paise"]=str(item.noodle_paise)
        dic["created_time"]=str(item.noodle_created_time)
        list01.append(dic)
    dic1["msg"]=list01
    #{'store': '重庆小面', 'address': '南京市秦淮区金蝶软件园Ａ-栋', 'sales': 4500, 'img': <ImageFieldFile:
    # static/upload/stores/cqxm.jpeg>, 'status': True, 'paise': Decimal('4.5'),
    # 'created_time': datetime.datetime(2019, 11, 2, 7, 1, 19, 922269, tzinfo=<UTC>)}
    # print(dic)
    import json
    dic=json.dumps(dic1,sort_keys=True,separators=(",",":"))
    return HttpResponse(dic, content_type="application/json")

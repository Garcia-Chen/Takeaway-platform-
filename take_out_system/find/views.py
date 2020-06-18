from urllib import parse
from django.http import JsonResponse
# Create your views here.
from index.models import Store
import redis
import pymysql


def sec(request,sec_name):
    # # redis 缓存机制
    # r = redis.Redis(
    #     host="127.0.0.1",
    #     port=6379,
    #     db=0,
    #     password="123456",
    #
    # )
    # db = pymysql.connect(
    #     "localhost",
    #     "root",
    #     "123456",
    #     "take_out_system",
    #     charset="utf8",
    # )
    # cursor = db.cursor()
    #
    # # sec_name 前端传过来 sec_name 商家名
    # # 数据库查询
    #  ajax 传输,对参数进行转码
    storename = parse.unquote(sec_name)
    #
    # # #redis数据库
    temp = []
    # # print(type(r.hgetall("name")))
    # if r.exists("store"):
    #     for item in r.hgetall("store"):
    #         # store_sales=item["store_sales"]
    #         # store_status=item["store_status"]
    #         # store_paise=item["store_paise"]
    #         # store_img=item["store_img"]
    #         # store_adress=item["store_adress"]
    #         # store_name=item["store_name"]
    #         temp.append(item)
    #     res = {"code": 200, "msg": temp}
    #     return JsonResponse(res)
    #
    # else:
    store_obj = Store.objects.filter(store_name=storename)
    if store_obj:
        for item in store_obj:
            dic = {}
            dic["store_sales"] = item.store_sales
            dic["store_status"] = item.store_status
            dic["store_paise"] = item.store_paise
            dic["store_img"] = str(item.store_img)
            dic["store_adress"] = item.store_adress
            dic["store_name"] = item.store_name
            # temp.append(dic)
            k={
                "store_sales":item.store_sales,
                "store_status":item.store_status,
                "store_paise":item.store_paise,
                "store_img":str(item.store_img),
                "store_adress":item.store_adress,
                "store_name":item.store_name,
            }
            # r.hmset(storename,k)
        res = {"code": 200, "msg": temp}
        return JsonResponse(res)
    else:
        res = {"error": 10101, "msg": "抱歉,你所查找商家不存在！"}
        return JsonResponse(res)





import json

from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from index.models import Store
from message.models import Message
from tools.logging_check import logging_check
from user.models import UserProfile


def leave_message(request, shopname):
    if request.method == 'POST':
        # 发表留言/回复
        shopname=shopname.replace('"','')
        json_str = request.body
        json_obj = eval(json_str.decode())
        # json_obj = json.loads(json_str)
        content = json_obj.get('content')
        user = json_obj.get('user').split('"')[1]
        user=UserProfile.objects.get(user_name=user)
        if not content:
            result = {'code': 40102, 'error': 'content is not empty'}
            return JsonResponse(result)
        parent_id = json_obj.get('parent_id', 0)
        # 检查shop是否存在
        try:
            print(shopname)
            shop = Store.objects.get(store_name=shopname)
        except Exception as e:
            result = {'code': 40103, 'error': 'No store'}
            return JsonResponse(result)

        try:
            Message.objects.create(content=content, parent_id=parent_id, user=user, shop=shop)
        except Exception as e:
            print(e)
            result = {'code': 40101, 'error': 'message failure'}
            return JsonResponse(result)

        result = {'code': 200, 'data': {}}
        return JsonResponse(result)


    if request.method == 'GET':
        shopname=shopname.replace('"','')
        try:
            shop=Store.objects.get(store_name=shopname)
        except Exception as e:
            print(e)
            result = {'code': 40103, 'error': 'No store'}
            return JsonResponse(result)
        #获取该商家的评论
        all_m = Message.objects.filter(shop=shop)
        all_list = []
        for m in all_m:
            d = {}
            d['id'] = m.id
            d['content'] = m.content
            d['parent_id'] = m.parent_id
            d['publisher'] = m.user.user_name
            d['storename'] = m.shop.store_name
            all_list.append(d)
        print('11111111',all_list)
        return JsonResponse({'code': 200, 'data': all_list})

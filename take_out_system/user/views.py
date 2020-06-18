import datetime
import hashlib
import json
import time
from urllib import parse

from django.utils import html

from libs. yuntongxun import sms
import os
import django
import random

import jwt
from django.db import transaction
from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from tools.logging_check import logging_check
from user.models import UserProfile, WeiboUser
from user.weiboapi import OAuthWeibo


K = {}
@logging_check('PUT')
def user_deal(request,user_name=None):
    if request.method=='POST':
        # 创建用户
        json_str = request.body  # 获取信息
        #传过来的数据　此时是字节码并b”{}“
        #将其转化为　字典　***dict() 方法是不可行的　此时要用eval() 强制转换***
        json_obj=eval(json_str.decode())
        print(json_obj)
        user_name = json_obj.get('username')
        user_name = html.escape(user_name)
        if not user_name:
            result = {'code': 10101, 'error': 'Please give me username'}
            return JsonResponse(result)

        #获取验证码
        user_code = json_obj.get('phone')
        if not user_code:
            result = {'code': 10102, 'error': 'Please give me code'}
            return JsonResponse(result)
        if user_code !=str( K["ma"]):
            result = {'code': 10105, 'error': 'code error'}
            return JsonResponse(result)
        #获取地址
        # user_address = json_obj.get('address')
        # if not user_address:
        #     result = {'code': 10102, 'error': 'Please give me address'}
        #     return JsonResponse(result)

        #获取密码
        user_password1 = json_obj.get('password_1')
        user_password1 = html.escape(user_password1)
        if not user_password1:
            result = {'code': 10103, 'error': 'Please give me password'}
            return JsonResponse(result)

        user_password2 = json_obj.get('password_2')
        user_password2 = html.escape(user_password2)
        if not user_password2:
            result = {'code': 10103, 'error': 'Please give me password'}
            return JsonResponse(result)

        #判断两次密码是否一致
        if user_password1 != user_password2:
            result = {'code': 10104, 'error': 'Please make two password same'}
            return JsonResponse(result)

        #判断用户名是否存在
        old_user = UserProfile.objects.filter(user_name=user_name)
        if old_user:
            result = {'code': 10105, 'error': 'The username is already existed !'}
            return JsonResponse(result)

        # 生成散列密码
        pm = hashlib.md5()
        pm.update(user_password1.encode())

        # 创建用户
        try:
            with transaction.atomic():
                new_user=UserProfile.objects.create(user_name=user_name, user_password=pm.hexdigest(),
                                                user_phone=user_code,
                                       user_nickname=user_name)
                #获取wuid
                wuid=json_obj.get('wuid')
                if wuid:
                    #微博用户进行绑定注册
                    w_obj=WeiboUser.objects.get(wuid=wuid)
                    w_obj.buser=new_user
                    w_obj.save()

        except Exception as e:
            print('---create error---')
            print(e)
            result = {'code': 10106, 'error': 'The username is already existed !!'}
            return JsonResponse(result)

        # 生成token
        now_time=time.time()
        token = make_token(user_name, 3600 * 24,now_time)
        result = {'code': 200, 'username': user_name, 'data': {'token': token.decode()}}
        return JsonResponse(result)

    elif request.method=='PUT':
        if not user_name:
            res={'code':10108,'error':'Must be give me username'}
            return JsonResponse(res)
        #获取数据
        json_str=request.body
        json_obj=json.loads(json_str)
        user_address=json_obj.get('user_address')
        user_nickname=json_obj.get('user_nickname')
        user_phone=json_obj.get('user_phone')

        #更新
        user=request.user
        #当前请求，token用户修改自己的数据
        if user.user_name !=user_name:
            result={'code':10109,'error':'The username is error'}
            return JsonResponse(result)
        to_update=False
        if user.user_nickname!=user_nickname or user.user_phone!=user_phone or user.user_address!=user_address:#判断数据是否变化
            to_update=True
            #更新用户数据
        if to_update:
            user.user_nickname=user_nickname
            user.user_address=user_address
            user.user_phone=user_phone
            user.save()
        return JsonResponse({'code':200,'username':user_name})

@logging_check('POST')
def users_avatar(request,user_name):
    #处理头像上传
    if request.method !='POST':
        result={'code':10110,'error':'Please use POST'}
        return JsonResponse(result)
    user=request.user
    if user.user_name !=user_name:
        result={'code':10109,'error':'The username is error!'}
        return JsonResponse(result)

    user.user_avatar=request.FILES['avatar']
    user.save()
    return  JsonResponse({'code':200,'username':user_name})

#获取微博登录界面的url
def users_weibo_url(request):
    oauth=OAuthWeibo('123')
    oauth_weibo_url=oauth.get_weibo_login()
    return JsonResponse({'code':200,'oauth_url':oauth_weibo_url})

def users_weibo_token(request):
    #接受前端返回的code 并去微博校验
    code=request.GET.get('code')
    oauth=OAuthWeibo()

    #向微博服务器提交code,若检验成功 返回该用户的token
    res=oauth.get_access_token_uid(code)
    res_obj=json.loads(res)
    access_token=res_obj['access_token']
    uid=res_obj['uid']

    #检查当前这个用户是否注册过我们博客
    try:
        bu =WeiboUser.objects.get(wuid=uid)
    except Exception as e:
        #用户第一次用微博账号登录
        #TODO??????
        WeiboUser.objects.create(wuid=uid,access_token=access_token)
        print('$$$$$$$$')
        return JsonResponse({'code':10777,'wuid':uid})
    else:
        #检查是否真的绑定过
        buser=bu.buser
        if not buser:
            print('&&&&&&&&')
            return JsonResponse({'code':10777,'wuid':uid})
        now=datetime.datetime.now()
        token=make_token(buser.username,3600*24,now)
        return JsonResponse({'code':200,'username':buser.username,'data':{'token':token.decode()}})

def make_token(username, exp,login_time):
    #生成token
    key = '1234567ab'
    now_t = time.time()
    payload = {'username':username,'login_time':str(login_time), 'exp':int(now_t+exp)}
    return jwt.encode(payload, key, algorithm='HS256')

#验证码发送
def send(request):
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'luffyapi.settings.dev')
    django.setup()
    k = random.randint(1000,9999)
    result = sms.sendTemplateSMS('17855919670',(k,5),1)
    K["ma"]=k

    return JsonResponse({'code':200})

#用户登录
def login(request):
    if request.method=='GET':
        return render(request,'login.html')
    elif request.method == 'POST':
        json_str = request.body
        json_obj = json.loads(json_str)
        # json_obj=parse.quote(json_str)
        # json_obj=json.loads(json_obj)
        username = json_obj.get('username')
        username = html.escape(username)
        password = json_obj.get('password')
        password = html.escape(password)
        # 找用户
        users = UserProfile.objects.filter(user_name=username)
        if not users:
            result = {'code': 20102, 'error': 'The username or password is error!'}
            return JsonResponse(result)
        user = users[0]
        #判断密码是否为空
        if not password:
            result = {'code': 20105, 'error': 'The username or password is error!'}
            return JsonResponse(result)
        #密码加密后进行判断
        pm = hashlib.md5()
        pm.update(password.encode())
        if user.user_password != pm.hexdigest():
            result = {'code': 20103, 'error': 'The password or is empty!!'}
            return JsonResponse(result)

        # 生成token
        # 添加登录时间
        now_datetime = datetime.datetime.now()
        user.login_time = now_datetime
        user.save()

        token = make_token(username, 3600 * 24, now_datetime)
        result = {'code': 200, 'username': username, 'data': {'token': token.decode()}}
        return JsonResponse(result)

#用户个人中心信息
def info(request,user):
    if not user:
        result={'code':12340,'error':'Must be give me username'}
        return JsonResponse(result)
    user = UserProfile.objects.filter(user_name=user)
    user=user[0]
    item={}
    item['username']=user.user_name
    item['phone']=user.user_phone
    # item['address']=user.user_address
    result={'code':200,'data':item}
    return JsonResponse(result)









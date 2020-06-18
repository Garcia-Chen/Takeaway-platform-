import jwt
from django.http import JsonResponse

from user.models import UserProfile

TOKEN_KEY='1234567ab'
def logging_check(*methods):
    def _logging_check(func):
        def wrapper(request,*args,**kwargs):
            #逻辑判断
            #1.判断当前请求是否需要校验
            #2.取出token
            #3.如果需要校验token，如何校验
            if not methods:
                return func(request,*args,**kwargs)
            else:
                if request.method not in methods:
                    return func(request,*args,**kwargs)
            token=request.META.get('HTTP_AUTHORIZATION')
            if not token:
                result={'code':20104,'error':'Plase login'}
                return JsonResponse(result)
            try:
                res=jwt.decode(token,TOKEN_KEY,algorithms='HS256')
            except Exception as e:
                result={'code':20105,'error':'Plase login'}
                return JsonResponse(result)

            #验证login_time
            username=res['username']
            login_time=res.get('login_time')
            user=UserProfile.objects.get(user_name=username)
            if login_time:
                if str(user.login_time)!= login_time:
                    result={'code':20106,'error':'Other people have logined! Please login again !!'}
                    return JsonResponse(result)

            user=UserProfile.objects.filter(user_name=username)[0]
            request.user=user
            return func(request,*args,**kwargs)
        return wrapper
    return _logging_check

def get_user_by_request(request):
    #尝试获取用户身份
    #return user or None
    token = request.META.get('HTTP_AUTHORIZATION')
    if not token:
        return  None

    try:
        res=jwt.decode(token,TOKEN_KEY,algorithms='HS256')
    except Exception as e:
        return None

    username=res['username']
    users=UserProfile.objects.filter(username=username)
    if not users:
        return None
    return users[0]




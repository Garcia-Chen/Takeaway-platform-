from django.conf.urls import url

from . import views

urlpatterns=[
    url(r'^$',views.user_deal),
    # http://127.0.0.1:8000/v1/weibo/url
    url(r'^weibo/url$', views.users_weibo_url),
    # http://127.0.0.1:8000/user/weibo/token
    url(r'^weibo/token$', views.users_weibo_token),
    url(r'^login',views.login),
    url(r'^(?P<user_name>\w+)$', views.user_deal),
    url(r'^(?P<user_name>\w+)/avatar$', views.users_avatar),
    url(r'^get_duanxin/', views.send),


]
#
# http://127.0.0.1:8000/user/register
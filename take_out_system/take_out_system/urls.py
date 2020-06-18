"""take_out_system URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin

from . import views



urlpatterns = [
    url(r'^admin/', admin.site.urls),
    #http://127.0.0.1:8000/index/  主页
    url(r"^index/",include("index.urls")),
    #商家路由
    url(r"^secondary/",include("secondary.urls")),
    #注册路由
    url(r"^registers/",views.registers),
    #搜索路由
    url(r"^find/",include("find.urls")),
    #订单跳转路由
    url(r"^makestore/",views.makestore),
    #用户路由
    url(r"^user/",include("user.urls")),
    #支付路由
    url(r"^alipay/",include("api.urls")),
    #微博跳转
    url(r'^login_callback$',views.weibo),
    #订单跳转
    url(r'^order/',include("order.urls")),

    url(r"^user_center/",views.user_center),
    #留言
    url(r"message/",include("message.urls"))


]

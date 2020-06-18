from django.shortcuts import render

#主页
def index(request):
    return render(request,"index.html")
#登录
def login(request):
    return render(request,"login.html")
#注册
def registers(request):
    return render(request, "registers.html")
#商品制作
def makestore(request):
    return render(request,"makestore.html")
#微博
def weibo(request):
    return render(request,"login_callback.html")

# def orders(request):
#     return render(request,"order_my.html")
#用户中心
def user_center(request):
    return render(request,"user_center.html")
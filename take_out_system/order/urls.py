from django.conf.urls import url

from order import views

urlpatterns=[
    url(r'^(?P<user_name>.*)$',views.order_deal),

]
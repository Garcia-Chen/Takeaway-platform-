from django.conf.urls import url

from secondary import views

urlpatterns=[
    url(r'^(?P<storename>\w+)$',views.good_deal),
]
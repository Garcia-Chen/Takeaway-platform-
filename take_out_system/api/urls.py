from django.conf.urls import url

from api import views

urlpatterns = [
    url(r'^$', views.index),
    url(r'^pay_result/', views.pay_result),
    url(r'^update_order/', views.update_order),
]
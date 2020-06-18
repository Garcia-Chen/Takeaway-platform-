from django.conf.urls import url

from index import views

urlpatterns=[
    url(r'^$',views.display),
    url(r"^(?P<type>\w+)/display",views.display),
    url(r"^find/(?P<type>\w+)",views.find)

]
from django.conf.urls import url

from find import views

urlpatterns=[
    #http://127.0.0.1:8000/find/sec_name
    url(r"^(?P<sec_name>\w+)$",views.sec),
]
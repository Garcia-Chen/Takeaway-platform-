from django.conf.urls import url

from message import views

urlpatterns=[
    url(r'^(?P<shopname>.*)$',views.leave_message)
]
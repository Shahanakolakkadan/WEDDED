from  django.conf.urls import url
from service import views

urlpatterns= [
    url('Service/', views.service.as_view()),
    url('Serviceview/', views.serviceview.as_view()),
    url('abc/', views.serviceview1.as_view()),
    url('ll/',views.searchser.as_view()),
url('out/',views.outp.as_view())
]
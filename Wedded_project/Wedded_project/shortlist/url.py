from  django.conf.urls import url
from shortlist import views

urlpatterns= [
    url('shrt/', views.shrt.as_view()),
    url('vw/',views.vsrt.as_view())
]

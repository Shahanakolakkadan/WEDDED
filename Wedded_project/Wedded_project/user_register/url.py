from  django.conf.urls import url
from user_register import views

urlpatterns= [
    url('User/', views.user.as_view()),
    url('pro/',views.userpro.as_view())
]
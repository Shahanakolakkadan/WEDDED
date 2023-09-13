from  django.conf.urls import url
from previous_work import views

urlpatterns= [
    url('Previous_work/', views.previous_work.as_view())
]
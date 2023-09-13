from  django.conf.urls import url
from package import views

urlpatterns= [
    url('Package/', views.package.as_view())
]
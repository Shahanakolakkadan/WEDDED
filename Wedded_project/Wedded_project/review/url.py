from  django.conf.urls import url
from review import views

urlpatterns= [
    url('Review/', views.review.as_view())
]
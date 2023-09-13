from  django.conf.urls import url
from vendor_register import views

urlpatterns= [
    url('Vendor/', views.vendor.as_view()),
    url('pro1/',views.vendorpro.as_view()),
    url('vdrp/',views.vdrp.as_view())
]
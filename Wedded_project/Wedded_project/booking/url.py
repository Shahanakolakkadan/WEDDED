from  django.conf.urls import url
from booking import views

urlpatterns= [
    url('Booking/', views.booking.as_view()),
    url('Bookingview/', views.bookingview.as_view()),
    url('Acceptbook/', views.acceptbook.as_view()),
    url('Rejectbook/', views.rejectbook.as_view()),
    url('status/', views.bookingstatusview.as_view()),
    url('pred/',views.predict.as_view()),
    url('nw/',views.pred.as_view()),
    url('chart/',views.chart.as_view()),
    url('use/',views.useerchart.as_view())

]

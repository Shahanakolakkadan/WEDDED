from django.shortcuts import render

from django.shortcuts import render
from rest_framework.views import APIView,Response
from review.serializers  import android_serializer
from django.http import HttpResponse
from review.models import Review

# Create your views here.
import datetime
class review(APIView):
    def get(self,request):
        ob=Review.objects.all()
        ser=android_serializer(ob,many=True)
        return Response(ser.data)
    def post(self,request):
        ob=Review()
        ob.review_date = datetime.datetime.now()
        ob.description = request.data['description']
        ob.rating = request.data['rating']
        ob.user_id = request.data['uid']
        ob.vendor_id = request.data['vid']
        ob.save()
        return HttpResponse('yes')


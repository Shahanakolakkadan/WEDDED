from django.http import HttpResponse
from django.shortcuts import render
from shortlist.models import Shortlist
# Create your views here.

from rest_framework.views import APIView,Response
from shortlist.serializers import android_serializer


class shrt(APIView):
    def post(self,request):
        ab=Shortlist()
        ab.u_id=request.data['uid']
        ab.ser_id=request.data['sid']
        ab.save()
        return HttpResponse("yess")


class vsrt(APIView):
    def post(self,request):
        ab=Shortlist.objects.filter(u_id=request.data['uid'])
        ser = android_serializer(ab, many=True)
        return Response(ser.data)
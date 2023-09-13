from django.shortcuts import render

from rest_framework.views import APIView,Response
from service.serializers  import android_serializer
from django.http import HttpResponse
from service.models import Service

# Create your views here.
class service(APIView):
    def get(self,request):
        ob=Service.objects.all()
        ser=android_serializer(ob,many=True)
        return Response(ser.data)
    def post(self,request):
        ob = Service()
        ob.vendor_id = request.data['uid']
        ob.about = request.data['about']
        ob.services = request.data['services']
        ob.category = request.data['category']
        ob.package = request.data['package']
        ob.business_name = request.data['business_name']
        ob.any_link = request.data['any_link']
        ob.cost = request.data['cost']
        ob.location = request.data['location']
        ob.district = request.data['district']
        ob.save()
        return HttpResponse('yes')


class serviceview(APIView):
    def post(self,request):
        ob=Service.objects.filter(category=request.data['ftype'])
        ser=android_serializer(ob,many=True)
        return Response(ser.data)



class serviceview1(APIView):
    def post(self,request):
        print(request.data['service_id'])
        ob=Service.objects.filter(service_id=request.data['service_id'])
        ser=android_serializer(ob,many=True)
        return Response(ser.data)


class searchser(APIView):
    def get(self,request):
        ob=Service.objects.all()
        ser=android_serializer(ob,many=True)
        return Response(ser.data)

class outp(APIView):
    def post(self,request):
        print(request.data['res'])
        ab=Service.objects.filter(vendor_id=request.data['res'])
        ser = android_serializer(ab, many=True)
        return Response(ser.data)
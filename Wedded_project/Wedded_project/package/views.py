from django.shortcuts import render
from rest_framework.views import APIView,Response
from package.serializers  import android_serializer
from django.http import HttpResponse
from package.models import Package

# Create your views here.
class package(APIView):
    def get(self,request):
        ob=Package.objects.all()
        ser=android_serializer(ob,many=True)
        return Response(ser.data)
    def post(self,request):
        ob=Package()
        ob.package_id = 1
        ob.package_name = request.data['package_name']
        ob.description = request.data['description']
        ob.cost = request.data['cost']
        ob.save()
        return HttpResponse('yes')


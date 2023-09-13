from django.shortcuts import render

from rest_framework.views import APIView,Response
from previous_work.serializers  import android_serializer
from django.http import HttpResponse
from previous_work.models import PreviousWork

# Create your views here.
class previous_work(APIView):
    def get(self,request):
        ob=PreviousWork.objects.all()
        ser=android_serializer(ob,many=True)
        return Response(ser.data)
    def post(self,request):
        ob=PreviousWork()
        ob.file = request.data['file']
        ob.file_type = request.data['file_type']
        ob.package_id = 1
        ob.vendor_id=request.data['vid']
        ob.save()
        return HttpResponse('yes')

class vpre(APIView):
    def post(self,request):
        print(request.data['vid'])
        ob=PreviousWork.objects.filter(vendor_id=request.data['vid'])
        ser=android_serializer(ob,many=True)
        return Response(ser.data)
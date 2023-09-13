from django.shortcuts import render
from rest_framework.views import APIView,Response
from vendor_register.serializers  import android_serializer
from django.http import HttpResponse
from vendor_register.models import Vendor
from login.models import Login

# Create your views here.
class vendor(APIView):
    def get(self,request):
        ob = Vendor.objects.all()
        ser = android_serializer(ob,many=True)
        return Response(ser.data)
    def post(self,request):
        ob=Vendor()
        ob.vendor_name = request.data['vendor_name']
        ob.phone_no = request.data['phone_no']
        ob.email = request.data['email']
        ob.district = request.data['district']
        ob.state = request.data['state']
        ob.city = request.data['city']
        ob.password_1 = request.data['password_1']
        ob.password_2 = request.data['password_2']
        ob.save()

        obb = Login()
        obb.username = ob.vendor_name
        obb.password = ob.password_1
        obb.type = "vendor"
        obb.u_id = ob.vendor_id
        obb.save()
        return HttpResponse('yes')


class vendorpro(APIView):
    def post(self,request):
        print("hello")
        print(request.data['uid'])
        ob = Vendor.objects.filter(vendor_id=request.data['uid'])
        ser = android_serializer(ob,many=True)
        return Response(ser.data)


from vendor_register.serializers import android_serializer
from service.models import Service

class vdrp(APIView):
    def get(self,request):
        ob = Vendor.objects.all()
        ser = android_serializer(ob,many=True)
        return Response(ser.data)
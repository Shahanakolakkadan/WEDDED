from django.shortcuts import render

from rest_framework.views import APIView,Response
from user_register.serializers  import android_serializer
from django.http import HttpResponse
from user_register.models import User
from login.models import Login

# Create your views here.
class user(APIView):
    def get(self,request):
        ob = User.objects.all()
        ser = android_serializer(ob,many=True)
        return Response(ser.data)
    def post(self,request):
        ob=User()
        ob.username = request.data['username']
        ob.first_name = request.data['first_name']
        ob.last_name= request.data['last_name']
        ob.phone_no = request.data['phone_no']
        ob.email = request.data['email']
        ob.wedding_date = request.data['wedding_date']
        ob.role = request.data['role']
        ob.district = request.data['district']
        ob.state = request.data['state']
        ob.city = request.data['city']
        ob.password_1 = request.data['password_1']
        ob.password_2 = request.data['password_2']
        ob.save()

        obb = Login()
        obb.username = ob.username
        obb.password = ob.password_1
        obb.type = "user"
        obb.u_id = ob.user_id
        obb.save()
        return HttpResponse('yes')

class userpro(APIView):
    def post(self,request):
        print("hello")
        ob = User.objects.filter(user_id=request.data['uid'])
        ser = android_serializer(ob,many=True)
        return Response(ser.data)



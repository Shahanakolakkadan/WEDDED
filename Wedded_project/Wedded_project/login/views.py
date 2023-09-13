from django.shortcuts import render

from rest_framework.views import APIView,Response
from login.serializers  import android_serializer
from django.http import HttpResponse
from login.models import Login

# Create your views here.
class login_view(APIView):
    def get(self, request):
        ob = Login.objects.all()
        ser = android_serializer(ob, many=True)
        return Response(ser.data)

    def post(self, request):
        username = request.data['username']
        password = request.data['password']
        ob = Login.objects.filter(username=username, password=password)

        # print(len(ob))

        ser = android_serializer(ob, many=True)
        return Response(ser.data)

from django.shortcuts import render

from rest_framework.views import APIView,Response
from booking.serializers  import android_serializer
from django.http import HttpResponse
from booking.models import Booking
import datetime
import requests
# Create your views here.
class booking(APIView):
    def get(self,request):
        ob=Booking.objects.all()
        ser=android_serializer(ob,many=True)
        return Response(ser.data)
    def post(self,request):
        print("hello")
        ob = Booking()
        ob.booking_date = datetime.datetime.now()
        ob.booking_time = datetime.datetime.now()
        ob.name = request.data['name']
        ob.phone_no = request.data['phone_no']
        ob.email = request.data['email']
        ob.function_date = request.data['function_date']
        ob.details = request.data['details']
        ob.status = "Booked"
        ob.user_id = request.data['uid']
        ob.vendor_id = request.data['vid']

        ob.save()
        a="NAME: "+str(ob.name)+"\n"+"function date: "+str(ob.function_date)+"\n"+"Phone NO: "+str(ob.phone_no)+"\n"+"Email id: "+str(ob.email)+"\n"+"Details of wedding: "+str(ob.details)


        url = "https://www.fast2sms.com/dev/bulkV2"

        payload = "message="+a+" &language=english&route=q&numbers=8289980342"
        headers = {
            'authorization': "t7GVHR8k5voZmP09AnIDWLxEyb4XiNSBrM2apuFTC3cKesYfjqYn9GsgdSZLMXax4qHfJ3bNivERAk6l",
            'Content-Type': "application/x-www-form-urlencoded",
            'Cache-Control': "no-cache",
        }

        response = requests.request("POST", url, data=payload, headers=headers)

        print(response.text)
        return HttpResponse('yes')

class bookingview(APIView):
    def post(self,request):
        ob=Booking.objects.filter(vendor_id=request.data['uid'])
        ser=android_serializer(ob,many=True)
        return Response(ser.data)

class bookingstatusview(APIView):
    def post(self,request):
        ob=Booking.objects.filter(user_id=request.data['uid'])
        ser=android_serializer(ob,many=True)
        return Response(ser.data)

class acceptbook(APIView):
    def get(self,request):
        ob=Booking.objects.get(booking_id=request.data['bid'])
        ob.status="accept"
        ob.save()
        return Response("yess")

class rejectbook(APIView):
    def get(self,request):
        ob=Booking.objects.get(booking_id=request.data['bid'])
        ob.status="reject"
        ob.save()
        return Response("nooo")
from Wedded_project import settings
from pandas import read_excel
from sklearn.tree import DecisionTreeClassifier
class predict(APIView):
    def post(self,request):
        a=request.data['location']
        b=request.data['budget']
        c=request.data['noofpeople']
        # d=request.data['type']
        e=request.data['rating']
        f=request.data['ser']
        g=request.data['ser1']
        h=request.data['ser2']
        print(a)
        print(b)
        print(c)
        # print(d)
        print(e)

        print(f)
        print(g)
        print(h)
        imgpath = str(settings.BASE_DIR) + str(settings.STATIC_URL) + "wedd.xlsx"
        data = read_excel(imgpath, "Sheet1")
        X = data.iloc[:, 0:7].values
        y = data.iloc[:, 7].values
        dtc = DecisionTreeClassifier()
        dtc.fit(X, y)
        # test = [int(a1),int(a2),int(a3),int(a4),int(a5),int(a6),int(a7),int(a8),int(a9),int(a10),int(a11),int(a12),
        #         int(a13),int(a14),int(a15),int(a16),int(a17),int(a18),int(a19),int(a20),int(a21),int(a22),int(a23),int(a24),
        #         int(a25),int(a26),int(a27),int(a28),int(a29),int(a30),int(a31),int(a32),int(a33),int(a34),int(a35),int(a36),
        #         int(a37),int(a38),int(a39),int(a40),int(a41)]
        test = [int(a), int(b), int(c), int(e),int(f),int(g),int(h)]
        y_pred = dtc.predict([test])
        res=str(y_pred[0])
        print(res)
        vl=Vendor.objects.get(vendor_name=res)
        print(vl.vendor_id)
        vid=vl.vendor_id

        return HttpResponse(vid)
from vendor_register.models import Vendor
from service.models import Service

class pred(APIView):
    def post(self,request):
        a=request.data['location']
        b=request.data['budget']
        # c=request.data['noofpeople']
        d=request.data['type']
        e=request.data['rating']
        print(a)
        print(b)
        # print(c)
        print(d)
        print(e)
        imgpath = str(settings.BASE_DIR) + str(settings.STATIC_URL) + "bridal.xlsx"
        data = read_excel(imgpath, "Sheet1")
        X = data.iloc[:, 0:4].values
        y = data.iloc[:, 4].values
        dtc = DecisionTreeClassifier()
        dtc.fit(X, y)
        # test = [int(a1),int(a2),int(a3),int(a4),int(a5),int(a6),int(a7),int(a8),int(a9),int(a10),int(a11),int(a12),
        #         int(a13),int(a14),int(a15),int(a16),int(a17),int(a18),int(a19),int(a20),int(a21),int(a22),int(a23),int(a24),
        #         int(a25),int(a26),int(a27),int(a28),int(a29),int(a30),int(a31),int(a32),int(a33),int(a34),int(a35),int(a36),
        #         int(a37),int(a38),int(a39),int(a40),int(a41)]
        test = [int(a), int(b), int(d), int(e)]
        y_pred = dtc.predict([test])
        print(y_pred)
        res = str(y_pred[0])
        print(res)
        vl = Vendor.objects.get(vendor_name=res)
        print(vl.vendor_id)
        vid = vl.vendor_id
        return HttpResponse(vid)


import matplotlib.pyplot as plt
class chart(APIView):
    def get(self,request):
        ab=Booking.objects.filter(function_date__lt=datetime.datetime.now())
        a=len(ab)
        x=[a]
        print(x)
        # print(pp)
        cc=Booking.objects.filter(function_date__gt=datetime.datetime.now())
        b=len(cc)
        y=[b,a]
        print(y)
        mylabels = ["Completed", "Pending"]

        plt.pie(y,labels = mylabels)
        plt.savefig(str(settings.BASE_DIR) + (settings.STATIC_URL) + "graph.png", dpi=300, bbox_inches='tight')
        f="graph.png"
        return HttpResponse(f)
class useerchart(APIView):
    def get(self,request):
        ab=Booking.objects.filter(status="Booked")
        a=len(ab)
        bc=Booking.objects.filter(status="pending")
        b=len(bc)
        y=[a,b]
        mylabels = ["Booked", "Pending"]

        plt.pie(y, labels=mylabels)
        plt.savefig(str(settings.BASE_DIR) + (settings.STATIC_URL) + "graph1.png", dpi=300, bbox_inches='tight')
        f="graph1.png"
        return HttpResponse(f)

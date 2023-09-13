from rest_framework import serializers
from shortlist.models import Shortlist

class android_serializer(serializers.ModelSerializer):
    sername=serializers.CharField(source='ser.business_name')
    class Meta :
        model=Shortlist
        fields=['sername','u_id','shrt_id']
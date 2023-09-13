from rest_framework import serializers
from vendor_register.models import Vendor

class android_serializer(serializers.ModelSerializer):
    class Meta :
        model=Vendor
        fields='__all__'


        
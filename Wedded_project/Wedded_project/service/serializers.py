from rest_framework import serializers
from service.models import Service

class android_serializer(serializers.ModelSerializer):
    class Meta :
        model=Service
        fields = '__all__'

from rest_framework import serializers
from booking.models import Booking

class android_serializer(serializers.ModelSerializer):
    class Meta :
        model=Booking
        fields='__all__'
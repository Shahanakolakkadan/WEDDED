from rest_framework import serializers
from previous_work.models import PreviousWork

class android_serializer(serializers.ModelSerializer):
    class Meta :
        model=PreviousWork
        fields='__all__'
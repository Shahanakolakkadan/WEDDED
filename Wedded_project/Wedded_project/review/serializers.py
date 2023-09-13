from rest_framework import serializers
from review.models import Review

class android_serializer(serializers.ModelSerializer):
    class Meta :
        model=Review
        fields='__all__'
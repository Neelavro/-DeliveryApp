from rest_framework import serializers
from .models import customuser

class CustmUserSerializer(serializers.ModelSerializer):
    class Meta:
        model= customuser
        fields  = ['user_name', 'password', 'email', 'type']
        
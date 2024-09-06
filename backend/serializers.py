from rest_framework import serializers
from .models import CustomUser

class CustmUserSerializer(serializers.ModelSerializer):
    class Meta:
        model= CustomUser
        fields  = ['user_name', 'password', 'email', 'type']
        
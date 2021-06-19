
from rest_framework import serializers
from .models import *


class PersonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Person
        fields = ('id', 'name', 'lastname', 'birth_date')


class ArmyDealaySerializer(serializers.ModelSerializer):
    class Meta:
        model = ArmyDelay
        fields = ('id', 'person_id', 'delay_until')

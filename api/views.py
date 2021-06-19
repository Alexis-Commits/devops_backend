from rest_framework import generics
from .serializers import *

from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

class PersonListCreate(generics.ListCreateAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer


class PersonRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer


class ArmyDelayListCreate(generics.ListCreateAPIView):
    queryset = ArmyDelay.objects.all()
    serializer_class = ArmyDealaySerializer


class ArmyDelayRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = ArmyDelay.objects.all()
    serializer_class = ArmyDealaySerializer


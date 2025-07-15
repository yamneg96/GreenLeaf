from django.shortcuts import render
from rest_framework import viewsets, permissions
from GreenLeafAPI import models as my_models
from GreenLeafAPI import serializers as my_serializers
from rest_framework_simplejwt.authentication import JWTAuthentication
from .permissions import IsOwner
class PlantViewSet(viewsets.ModelViewSet):
    queryset = my_models.PlantModel.objects.all()
    serializer_class = my_serializers.PlantSerializer
    permission_classes = [permissions.IsAuthenticated, IsOwner]

    def get_queryset(self):
        return my_models.PlantModel.objects.filter(created_by=self.request.user)

    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)


# List, Retriever, Create, Update and Delete Plant
class ObservationViewSet(viewsets.ModelViewSet):
    queryset = my_models.ObservationModel.objects.all()
    serializer_class = my_serializers.ObservationSerializer
    permission_classes = [permissions.IsAuthenticated, IsOwner]

    def get_queryset(self):
        return my_models.ObservationModel.objects.filter(created_by=self.request.user)


    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)

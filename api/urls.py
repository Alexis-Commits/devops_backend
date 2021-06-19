from django.conf.urls import url
from django.urls import path, re_path
from rest_framework.authtoken.views import obtain_auth_token
from .views import *

urlpatterns = [
    path('rest-auth/', obtain_auth_token,
         name='api_token_auth'),  # To Login returns token

    path('persons/', PersonListCreate.as_view()),
    re_path('persons/(?P<pk>[0-9]+)', PersonRetrieveUpdateDestroy.as_view()),

    path('delays/', ArmyDelayListCreate.as_view()),
    re_path('delays/(?P<pk>[0-9]+)', ArmyDelayRetrieveUpdateDestroy.as_view()),
]
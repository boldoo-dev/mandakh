from .models import *
from django.forms import ModelForm
from django.contrib.auth.models import User


class UserForm(ModelForm):
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email', 'username', 'password')


class UserDetailForm(ModelForm):
    class Meta:
        model = UserDetails
        fields = '__all__'

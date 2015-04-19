import re
from django import forms
from models import User, Sign_In, Challenge, Likes, Comments
from django.forms import ModelForm, Textarea,PasswordInput
		
class UserForm(ModelForm):
	class Meta:
		model = User
		fields='__all__'
		widgets = {
			 'password': PasswordInput()
			}

class LoginForm(ModelForm):
	class Meta:
		model = Sign_In
		fields=['username','password']
		widgets = {
			'password': PasswordInput()
			}

class ChallengeForm(ModelForm):
	class Meta:
		model = Challenge
		fields='__all__'



from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect,HttpResponse
from django.views import generic
from appname.apps.yolo.forms import UserForm, LoginForm,ChallengeForm
from appname.apps.yolo.models import User, Challenge

def user_check(request):
	if 'user' in request.session:
 		user=request.session['user']
 		return user
 	return []

class challenges(generic.ListView):
	model = Challenge
	template_name = 'yolo/challenges.html'
	context_object_name = 'challenges'

def create_challenge(request):
	c={}
	if request.method == "POST":
		form = ChallengeForm(request.POST, request.FILES)
		if form.is_valid():	
			model_instance = form.save(commit=False)
			model_instance.save()
			return HttpResponseRedirect('/challenge')
	form = ChallengeForm()
	c['form']=form
	return render(request,'yolo/create_challenge.html',c)

def create(request):
	c={}
	if request.method == "POST":
		form = UserForm(request.POST, request.FILES)
		if form.is_valid():	
			model_instance = form.save(commit=False)
			model_instance.save()
			return HttpResponseRedirect('/')
	form = UserForm()
	c['form']=form
	return render(request,'yolo/create.html',c)

def login(request):
	c={}
 	c['user']=user_check(request)
 	
	if request.method == "POST":
		form = LoginForm(request.POST, request.FILES)
		if form.is_valid():	
			model_instance = form.save(commit=False)
			password=str(model_instance.password)
			user=str(model_instance.username)
			if User.objects.filter(username=user).filter(password=password).exists():
				request.session['user']=user
				return HttpResponseRedirect('/')
			else:
				c['error']='Sorry your username or password is invalid. Please try again!'
		else:
			c['error']='Sorry that Username is taken. Try another'
	form = LoginForm()
	c['form']=form
	return render(request, 'yolo/login.html', c)

def logout(request):	
	try:
		del request.session['user']
	except:
		pass
	return HttpResponseRedirect("/")



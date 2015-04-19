
from django.conf.urls import patterns, url

urlpatterns=patterns('appname.apps.homepage.views', 
	url(r'^$','homerender',name='homepage'),
	)

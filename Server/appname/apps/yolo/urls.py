from django.conf.urls import patterns, url
from appname.apps.yolo.views import challenges

urlpatterns=patterns('appname.apps.yolo.views', 
	url(r'^$',challenges.as_view(),name='challenges'),
	url(r'^create$','create',name='create'),
	#url(r'^edit$','edit',name='edit'),
	url(r'^login$','login',name='login'),
	url(r'^logout$','logout',name='logout'),
	url(r'^new$','create_challenge',name='new'),

	)

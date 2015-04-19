from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
    url(r'^$', include('appname.apps.homepage.urls', namespace='homepage')),
    url(r'^challenge/', include('appname.apps.yolo.urls', namespace='challenge')),
    url(r'^yolo/$','appname.apps.homepage.views.yolorender',name='yolo'),

    )  

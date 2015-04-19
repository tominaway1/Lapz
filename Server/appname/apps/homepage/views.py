from django.shortcuts import render

def homerender(request):
	return render(request,'homepage/homepage.html',{})

def yolorender(request):
	c={}
	arr=[]
	c['alfred']='POOOOOOPPPPPPPPSICKLLLLE'
	return render(request,'homepage/yolo.html',c)

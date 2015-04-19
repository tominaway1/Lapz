from django.db import models

class User(models.Model):
	username = models.CharField(max_length=50, unique=True)
	password = models.CharField(max_length=50)
	def __unicode__(self):
		return self.username

class Sign_In(models.Model):
	username = models.CharField(max_length=50)
	password = models.CharField(max_length=50)

class Challenge(models.Model):
	name = models.CharField(max_length=25)
	description = models.CharField(max_length=1500)
	location = models.CharField(max_length=50)
	difficulty = models.CharField(max_length=25)
	def __unicode__(self):
		return self.name

class Likes(models.Model):
	challenge = models.ForeignKey(Challenge)
	username = models.ForeignKey(User)

class Comments(models.Model):
	username = models.ForeignKey(User)
	comment = models.CharField(max_length=1500)





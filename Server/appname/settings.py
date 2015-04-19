

"""
Django settings for r+p project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '-yi5%0y2!9w*))=-2$k8@7-7ixmoj%vkb-7+6b1xei^6lsurtp'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = (
# Django
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

# Third Party
    'debug_toolbar',
    'gunicorn',
    'shell_plus',
    'bootstrap3',
    'south',

# Local
    'appname.apps.homepage',
    'appname.apps.yolo',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'appname.urls'

WSGI_APPLICATION = 'appname.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'appname',
        'HOST': 'localhost',
        'PORT': '5432',
        'USER': 'django',
        'PASSWORD': '',
    }
}

TEMPLATE_DIRS = ('templates',
                 )

TEMPLATE_DIRS = [os.path.join(os.path.abspath(os.path.join(__file__, '..')), dir) for dir in TEMPLATE_DIRS]
try:
    from local_settings import DATABASES
except ImportError:
    pass



"""
Django settings for regionfestival project.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.7/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
import platform
from django.utils.translation import ugettext_lazy as _


PRODUCTION_SERVERS = ['iproduction.ch',]
if platform.node() in PRODUCTION_SERVERS:
    PRODUCTION = True
else:
    PRODUCTION = False
BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.7/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '-wrz)vmjv5ix1fps)&47(k+9!7b2cypn&2r@po!u23quf8ov_a'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

SITE_ID = 1

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.gis',
    'debug_toolbar',
    #'guardian',
    'moderation',
    'associations',
    'spectacles',
    'crm',
    'django.contrib.sites',
    'django.contrib.flatpages',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

AUTHENTICATION_BACKENDS = (
    'django.contrib.auth.backends.ModelBackend',
    #'guardian.backends.ObjectPermissionBackend',
)

ROOT_URLCONF = 'regionfestival.urls'

WSGI_APPLICATION = 'regionfestival.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.7/ref/settings/#databases

if PRODUCTION:
    DATABASES = {
        'default': {
            'ENGINE': 'django.contrib.gis.db.backends.postgis',
            'NAME': 'valaisfestival',
            'PASSWORD': 'RenaultMaster2014',
            'USER': 'valaisfestival',
            'HOST': 'localhost'
        }
    }
else:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }

# Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/

LANGUAGE_CODE = 'fr-ch'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/

STATIC_URL = '/web/'
if not PRODUCTION:
    STATICFILES_DIRS = ( os.path.join(BASE_DIR, 'static'),)



MEDIA_ROOT = os.path.join(BASE_DIR, 'media/')
MEDIA_URL = '/media/'

LANGUAGES = (
    ('fr', _('Français')),
    ('de', _('Allemand')),
)

TEMPLATE_DIRS = (
    os.path.join(BASE_DIR, 'templates/'),
)

# Configuration for Guardian
ANONYMOUS_USER_ID = -1
GUARDIAN_RAISE_403 = True
ANONYMOUS_DEFAULT_USERNAME_VALUE = "Gentil anonyme"


# Configuration for PostGIS
POSTGIS_VERSION = (2, 1, 4)
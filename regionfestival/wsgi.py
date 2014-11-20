"""
WSGI config for regionfestival project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/howto/deployment/wsgi/
"""
import sys
import os
sys.path.append(os.path.dirname(os.path.abspath(__file__)) + '/..' )

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "regionfestival.settings")

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()


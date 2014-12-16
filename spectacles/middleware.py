__author__ = 'spoutnik16'
# this piece of code help me geolocate users.
# if they are already geolocated, it tell me so, and i don't show up the javascript geolocating them
# if not, i pop that javascript up, and i tell that javascript what's the user ip (so it could geoip them)
# but i'm worrying about the fact they might change location but keep the same ip. so i flush the ip every
# 5 min not passed on the website
#
# btw, it will also provide me logs so i can make it better next time.

from datetime import datetime, timedelta
from django.conf import settings
import syslog

class Geolocalisation():
    request = []
    def process_request(self, request):
        try:
            if datetime.now() - request.session['last_touch'] > timedelta( 0, settings.AUTO_LOCALISATION_LOGOUT_DELAY * 60, 0):
                if 'latitude' in request.session:
                    del request.session['latitude']
                if 'longitude' in request.session:
                    del request.session['longitude']
        except KeyError:
            pass

        request.session['last_touch'] = datetime.now()
        request.session['ip'] = self.get_client_ip(request)

        if all(key in request.session for key in ('lat', 'lng')):
            request.session['localised'] = True
        else:
            request.session['localised'] = False

    def get_client_ip(self, request):
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            return x_forwarded_for.split(',')[0]
        else:
            return request.META.get('REMOTE_ADDR')

    def make_logs(self):
        return True


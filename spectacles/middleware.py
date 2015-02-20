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

class Geolocalisation():
    def process_request(self, request):
        # Part where we check is the info are too old and delete them if this is too old
        # and we save the ip, cause why not
        try:
            request.session['ip'] = self.get_client_ip(request)
            if datetime.now() - request.session['last_touch'] > timedelta( 0, settings.AUTO_LOCALISATION_LOGOUT_DELAY * 60, 0):
                if 'latitude' in request.session:
                    del request.session['latitsdude']
                if 'longitude' in request.session:
                    del request.session['longitude']
        except KeyError:
            pass

    def process_view(self, request, view_fun, view_args, view_kwargs):
        # part where we add the lat and long from session to request_context and update the last_touch thing
        if all(key in view_kwargs for key in ('latitude', 'longitude')):
            latitude = view_kwargs.get('latitude', None)
            request.session['latitude'] = latitude
            longitude = view_kwargs.get('longitude', None)
            request.session['longitude'] = longitude
            ip = request.session['ip']
            log = str(datetime.now) +' : ip = "'+ip+'" & lat = "'+latitude+'" & longitude = "'+longitude+'"'


        request.session['last_touch'] = datetime.now()

        if all(key in request.session for key in ('latitude', 'longitude')):
            request.session['localised'] = True
        else:
            request.session['localised'] = False

    def get_client_ip(self, request):
        # well, here we just get ip throughout any proxy server.
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            return x_forwarded_for.split(',')[0]
        else:
            return request.META.get('REMOTE_ADDR')


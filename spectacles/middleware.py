__author__ = 'spoutnik16'

from datetime import datetime, timedelta
from django.conf import settings
from spectacles.views import IP

class AutoLogout():
    def process_request(self, request):
        try:
            if datetime.now() - request.session['last_touch'] > timedelta( 0, settings.AUTO_LOCALISATION_LOGOUT_DELAY * 60, 0):
                del request.session['loc']
        except KeyError:
            pass

        request.session['last_touch'] = datetime.now()
        request.session['ip'] = IP.get_client_ip(request)
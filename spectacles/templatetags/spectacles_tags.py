__author__ = 'spoutnik16'

from django import template
from django.contrib.gis.geos import GEOSGeometry
from django.contrib.gis.measure import D
from datetime import datetime
from spectacles.models import Representation
from regionfestival import settings

register = template.Library()

@register.inclusion_tag('aside/base.html', takes_context=True)
def get_show_near_you(context):
    ip = context['request'].session['ip']
    if context['request'].session['localised']:
        session=context['request'].session
        # near_spec_list = get_near_show(session['latitude'], session['longitude'])
    next_spec_list = get_next_shows()

    return {'next_spec_list': next_spec_list, 'near_spec_list': near_spec_list, 'ip': ip}

@register.inclusion_tag('aside/javascript.js', takes_context=True)
def javascript(context):
    return

def get_near_show(lat, lng):
    geojson = """{"type": "Point","coordinates": ["""+lat+""","""+lng+"""]}"""
    loc = GEOSGeometry(geojson)
    list_specs = set()
    dist = settings.DISTANCE_CLOSE
    while len(list_specs) < 5:
        list_rep = Representation.objects.filter(lieu__in_geom__distance_lte=
                                                 (loc, D(m=dist))).order_by('datetime')
        for rep in list_rep:
            list_specs.add(rep.spectacle)
        dist = int(dist*1.2)
    list_specs = list(list_specs)[:5]
    return list_specs


def get_next_shows():
    i = 5
    spec_list = set()
    while len(spec_list)<5:
        for rep in Representation.objects.filter(datetime__gt=datetime.now()).order_by('datetime')[:i]:
            spec_list.add(rep.spectacle)
        i+=1
    return spec_list
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
        latitude = context['request'].session.get('latitude', False)
        longitude = context['request'].session.get('longitude', False)
        near_spec_list = get_near_show(latitude, longitude)
    next_spec_list = get_next_shows()
    last_touch = context['request'].session.get('last_touch', False)
    return locals()

@register.inclusion_tag('aside/javascript.html', takes_context=True)
def geoloc_javascript(context):
    if context['request'].session['localised']:
        say = "on est localisé"
        javascript = False
        # latitude = context['request'].session['latitude']
        # longitude = context['request'].session['longitude']
    else:
        say = "on est pas localisé"
        javascript = True
    ip = context['request'].session['ip']
    return locals()

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
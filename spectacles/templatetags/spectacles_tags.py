__author__ = 'spoutnik16'

from django import template
from django.contrib.gis.geos import GEOSGeometry
from django.contrib.gis.measure import D
from datetime import datetime
from spectacles.models import Representation, Spectacle, CategorieSpectacle
from django.db.models import Min, Count
from associations.models import Region
from regionfestival import settings

register = template.Library()

@register.assignment_tag()
def get_categories():
    list_categories = CategorieSpectacle.objects.annotate(count=Count('spectacle')).order_by('-count')
    i=0
    cat_dict = dict()
    for category in list_categories:
        cat_dict[category.pk]= category
    for key, category in cat_dict.items():
        cat = category
        while cat.parent:
            cat = cat_dict[cat.parent.pk]
        list_categories[i].count += cat.count
    list_parent=set()
    for category in list_categories:
        if not category.parent:
            list_parent.add(category)
    return list_parent


@register.inclusion_tag('templatetags/base.html', takes_context=True)
def get_show_near_you(context):
    ip = context['request'].session.get('ip', False)
    if context['request'].session.get('localised', False):
        latitude = context['request'].session.get('latitude', False)
        longitude = context['request'].session.get('longitude', False)
        near_spec_list = get_near_show(latitude, longitude)
        localised = True
    else:
        localised = False
    next_spec_list = get_next_shows()
    last_touch = context['request'].session.get('last_touch', False)
    return locals()

@register.inclusion_tag('templatetags/javascript.html', takes_context=True)
def geoloc_javascript(context):
    if context['request'].session['localised']:
        javascript = False
        # latitude = context['request'].session['latitude']
        # longitude = context['request'].session['longitude']
    else:
        javascript = True
    ip = context['request'].session.get('ip', False)
    if ip == "127.0.0.1":
        ip = "88.228.177.71"
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
            list_specs.add(rep.spectacle_id)
        dist = int(dist*2)
    list_specs = Spectacle.objects.filter(pk__in=list_specs)[:5]
    return list_specs


def get_next_shows():
    # i = 5
    # spec_list = set()
    # while len(spec_list)<5:
    #     for rep in Representation.objects.filter(datetime__gt=datetime.now()).order_by('-datetime')[:i]:
    #         spec_list.add(rep.spectacle)
    #     i+=1
    #     if i>100:
    #         break
    spec_list = Spectacle.objects.annotate(date=Min('representation__datetime')).filter(date__gte=datetime.now()).order_by('date')[:5]
    return spec_list
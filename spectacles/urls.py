__author__ = 'spoutnik16'

from django.conf.urls import patterns, url
from django.core.urlresolvers import reverse_lazy
from django.views.generic import RedirectView


urlpatterns = patterns('spectacles.views',
                       url(r'^$', 'accueil', name='accueil'),
                       url(r'^contact/$', 'contact', name='contact'),
                       url(r'^spectacles/'
                           '(?:search/(?P<search_term>[-%+0-9a-zA-Z]+)/)?'
                           '(?:(?P<categorie>[-a-z]+)/)?'
                           '(?:(?P<page>\d+)/)?'
                           '$', 'spectacles', name='spectacles'),
                       url(r'^spectacles_redir/'
                           '(?:search/(?P<search_term>[-%+0-9a-zA-Z]+)/)?'
                           '(?:(?P<categorie>[-a-z]+)/)?'
                           '(?:(?P<page>\d+)/)?'
                           '$', 'spectacles_redir', name='spectacles_redir'),
                       url(r'^spectacle/(?P<slug>[-\w]+)/$', 'spectacle', name='spectacle'),
                       url(r'^commune/(?P<slug>[-\w]+)/$', 'region_child2', name='region_child2'),
                       url(r'^association/(?P<slug>[-\w]+)/$', 'association', name='association'),
                       url(r'^lieu/(?P<slug>[-\w]+)/$', 'place'  , name='place'),
                       url(r'^agenda/'
                           '(?:(?P<day>\d{1,2})/'
                           '(?P<month>\d{1,2})/'
                           '(?P<year>\d{4})/)?'
                           '(?:page/(?P<page>\d+)/)?$', 'agenda', name='agenda'),

                       # #patterns auth'd
                       url(r'^inscription/$', 'inscription', name='inscription'),

                       # patterns from old php website
                       url(r'^(?:fr|de)/spectacle-show-(?P<id>\d+)\.html$', 'redirect_old_spectacle'),
                       url(r'^(?:fr|de)/spectacle-show-(?P<id>\d+)\.html$', 'redirect_old_spectacle'),
                       url(r'^(?:fr|de)/commune-show-(?P<id>\d+)\.html$', 'redirect_old_commune'),
                       url(r'^(?:fr|de)/place-show-(?P<id>\d+)\.html$', 'redirect_old_lieu'),

                       url(r'^(?:fr|de)/connection\.html', RedirectView.as_view(url=reverse_lazy('connection'))),
                       url(r'^(?:fr|de)/deconnection\.html', RedirectView.as_view(url=reverse_lazy('deconnection'))),
                       url(r'^(?:fr|de)/contact.html$', RedirectView.as_view(url=reverse_lazy('contact'))),
                       url(r'^(?:fr|de)/presentation.html$', RedirectView.as_view(url=reverse_lazy('contact'))),


                       url(r'^accounts/profile/', 'espace_membre', name='espace_membre'),
                       url(r'^member/association/(?:(?P<id>\d+)/)?$', 'association_form', name='association_form'))

urlpatterns += patterns('',
                        url(r'^connection/$', 'django.contrib.auth.views.login',
                            {'template_name': 'registration/login.html'}, name='connection'),
                        url(r'^deconnection/$', 'django.contrib.auth.views.logout',
                            {'next_page': reverse_lazy('accueil')}, name='deconnection'),

)
from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings
from spectacles import urls as spectacles_urls

urlpatterns = patterns(
    '',
    # Examples:
    # url(r'^$', 'regionfestival.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'', include(spectacles_urls)),
)
# TODO ajouter les images, les différentes apps, etc...

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^media/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': settings.MEDIA_ROOT
        }))


urlpatterns += patterns(
    url(r'^presentation/$', 'flatpage', {'url': '/about/'}, name='about'),
    )
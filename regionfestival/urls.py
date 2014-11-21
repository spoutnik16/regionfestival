from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings
from spectacles import urls as spectacles_urls
from spectacles.admin import member_space

urlpatterns = patterns(
    '',
    # Examples:
    # url(r'^$', 'regionfestival.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^member/', include(member_space.urls)),
    url(r'', include(spectacles_urls)),
)

if settings.DEBUG:
    from os import path

    urlpatterns += patterns('',
                            (r'^media/(?P<path>.*)$', 'django.views.static.serve', {
                                'document_root': settings.MEDIA_ROOT}),
                            (r'^web/(?P<path>.*)$', 'django.views.static.serve',
                             {'document_root': path.join(path.dirname(__file__),
                                                         '../regionfestival/../static/')}),
    )

urlpatterns += patterns(
    url(r'^presentation/$', 'flatpage', {'url': '/about/'}, name='about'),
    url(r'^i18n/', include('django.conf.urls.i18n')),
)
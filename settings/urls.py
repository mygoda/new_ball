# -*- coding: utf-8 -*-
# __author__ = chenchiyuan

from __future__ import division, unicode_literals, print_function
from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings
from settings import STATIC_ROOT
admin.autodiscover()

urlpatterns = patterns('',


    url(r'^grappelli/', include('grappelli.urls')),
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^api/', include('applications.api.urls')),
    url(r'^', include('applications.ball.urls')),
    )

if settings.DEBUG:
    urlpatterns += patterns('',
    (r'^(?P<path>.*)$', 'django.views.static.serve', {'document_root': STATIC_ROOT, 'show_indexes': True}),
    (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
)
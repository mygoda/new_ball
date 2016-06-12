# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.conf.urls import patterns, url
from settings.const import URL_ID
from applications.api.views import *

urlpatterns = patterns('',
    url(r'^games/$', games_api_list, name='games_queryset_view'),
)


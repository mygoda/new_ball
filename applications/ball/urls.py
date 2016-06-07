# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.conf.urls import patterns, url
from settings.const import URL_ID
from applications.ball.views import *
from settings.const import TASK_ID

urlpatterns = patterns('',
    url(r'^balls/$', test, name='ball_test'),
    url(r'^login/$', login, name='ball_login'),
    url(r'^games_add/$', user_add_json, name='game_add_json'),
    url(r'^bets/$', bet, name='user_bet'),
    url(r'^my/$', user_odd, name='my_odd'),
)
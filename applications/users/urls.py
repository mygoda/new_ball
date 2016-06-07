# -*- coding: utf-8 -*-
# __author__ = xutao
"""
    url控制器
"""
from __future__ import division, unicode_literals, print_function
from django.conf.urls import patterns, url
from applications.users.views import UserLoginTemplateView, UserLogoutTemplateView, UserRegisterTemplateView

urlpatterns = patterns('',
    url(r'^login/$', UserLoginTemplateView.as_view(), name="user_login_view"),
    url(r'^logout/$', UserLogoutTemplateView.as_view(), name="user_logout_view"),
    url(r'^register/$', UserRegisterTemplateView.as_view(), name="user_register_view"),
)

# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.contrib.auth import logout
from django.http import HttpResponseRedirect
from django.views.generic import TemplateView


class UserLoginTemplateView(TemplateView):
    template_name = "user/teacher_login.html"


class UserLogoutTemplateView(TemplateView):

    def get(self, request, *args, **kwargs):
        logout(request)
        return HttpResponseRedirect("/")


class UserRegisterTemplateView(TemplateView):
    template_name = "user/register.html"
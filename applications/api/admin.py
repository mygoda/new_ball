# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.contrib import admin
from applications.api.models import UserPassword


class UserPasswordAdmin(admin.ModelAdmin):
    pass

admin.site.register(UserPassword, UserPasswordAdmin)
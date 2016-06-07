# -*- coding: utf-8 -*-
# __author__ = chenchiyuan

from __future__ import division, unicode_literals, print_function

from django.contrib import admin
from applications.base.models import ErrorLog, ServerSetting


class ErrorLogAdmin(admin.ModelAdmin):
    list_display = ['sentry_id', 'user', 'message', 'created_at']
    search_fields = ['user__username', 'sentry_id']


class ServerSettingAdmin(admin.ModelAdmin):
    list_display = ['theme', "support_wechat_pay", "support_transfer_pay", "sms_enable"]


admin.site.register(ErrorLog, ErrorLogAdmin)
admin.site.register(ServerSetting, ServerSettingAdmin)
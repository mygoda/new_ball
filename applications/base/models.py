# -*- coding: utf-8 -*-
# __author__ = chenchiyuan

from __future__ import division, unicode_literals, print_function
from django.db import models
from django.conf import settings
from libs.datetimes import datetime_now
from libs.models.models import SingletonModel

auth_user_model = getattr(settings, 'AUTH_USER_MODEL', 'user.User')


class ErrorLog(models.Model):
    class Meta:
        app_label = "base"
        db_table = "error_log"
        verbose_name_plural = verbose_name = u"错误日志"

    user = models.ForeignKey(auth_user_model, verbose_name=u"会员", default=None, blank=True, null=True)
    message = models.CharField(u"消息", max_length=256, blank=True, null=True, default="")

    sentry_id = models.CharField(u"sentry_id", max_length=128, blank=True, null=True, default="")

    created_at = models.DateTimeField(u"创建时间", default=datetime_now)

    def __unicode__(self):
        return unicode(self.id)


class ServerSetting(SingletonModel):
    class Meta:
        app_label = "base"
        db_table = "server_setting"
        verbose_name_plural = verbose_name = u"服务设置"

    THEME_DEFAULT = "/static/meeting_v1/css/index.base.css"
    THEME_AASFP = "/static/meeting_v1/css/index.aasfp.css"

    THEME_CHOICES = (
        (THEME_DEFAULT, u"默认主题"),
        (THEME_AASFP, u"亚体定制主题")
    )

    theme = models.CharField(u"主题", max_length=2048, choices=THEME_CHOICES, default=THEME_DEFAULT, blank=True,
                             null=True)

    support_wechat_pay = models.BooleanField(u"是否支持微信支付", default=True, blank=True)
    support_transfer_pay = models.BooleanField(u"是否支持转账支付", default=True, blank=True)

    weixin_api_url = models.CharField(u"微信支付地址", default="http://teacher.qingchengfit.cn/api/payments/", blank=True, null=True, max_length=128)

    sms_enable = models.BooleanField(u"是否发送短信", default=True, blank=True)
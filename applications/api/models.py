# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.db import models
from django.template.loader import render_to_string
from libs.hashs import md5
from libs.sms import send_sms
from libs.uuids import get_code
from libs.datetimes import datetime_now
from django.conf import settings


auth_user_model = getattr(settings, 'AUTH_USER_MODEL', 'user.User')

import logging
logger = logging.getLogger(__name__)


class VerifyPhone(models.Model):
    class Meta:
        app_label = u"api"
        db_table = u'api_verify_phone'
        verbose_name = verbose_name_plural = u"验证码"

    EXPIRE_TIME = 30 #过期时间为30分钟

    phone = models.CharField(u"手机号", max_length=32, unique=True)
    code = models.CharField(u"验证码", max_length=32, default=get_code)
    username = models.CharField(u"用户名", max_length=32, default="", blank=True, null=True)
    send_at = models.DateTimeField(u'发送时间', default=datetime_now)

    remarks = models.CharField(u"额外信息", max_length=1024, default="", blank=True, null=True)
    retry = models.IntegerField(u"重试次数", default=0)

    def __unicode__(self):
        return self.phone

    @classmethod
    def get_or_create(cls, phone, **kwargs):
        try:
            instance = cls.objects.get(phone=phone)
            return instance, False
        except cls.DoesNotExist:
            instance = cls(phone=phone, **kwargs)
            instance.save()
            instance._send()
            return instance, True

    @classmethod
    def check_code(cls, phone, code):
        try:
            instance = cls.objects.get(phone=phone)
            timedelta = datetime_now() - instance.send_at
            if timedelta.total_seconds() > cls.EXPIRE_TIME*60:
                return False
            return instance.code == code
        except:
            return False

    def send(self):
        timedelta = datetime_now() - self.send_at
        if timedelta.total_seconds() < 60:
            return False

        return self._send()

    def _send(self):
        context = {
            "code": self,
        }

        # 重新生成时间和code
        self.send_at = datetime_now()
        self.code = get_code()
        self.save()
        #

        content = render_to_string("common/verifycode.html", context)
        logger.info("send verify code to phone %s : %s" % (self.phone, content))
        r, status = send_sms(self.phone, content)
        return status


class UserPassword(models.Model):
    class Meta:
        app_label = u"api"
        db_table = u'api_user_password'
        verbose_name = verbose_name_plural = u"用户密码"

    phone = models.CharField(u"手机号", max_length=32, unique=True)
    password = models.CharField(u'密码', max_length=40, blank=True, null=True)

    created_at = models.DateTimeField(u'创建时间', blank=True, null=True, default=datetime_now())

    def __unicode__(self):
        return unicode(self.phone)

    @classmethod
    def check_password(cls, password, phone):
        try:
            instance = cls.objects.get(phone=phone)
            return instance.password == md5(password)
        except:
            return False

    def save(self, *args, **kwargs):
        self.password = md5(self.password)
        super(UserPassword, self).save(*args, **kwargs)




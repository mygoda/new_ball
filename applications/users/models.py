# -*- coding: utf-8 -*-
# __author__ = chenchiyuan

from __future__ import division, unicode_literals, print_function
from django.contrib.auth.models import PermissionsMixin, AbstractBaseUser
from django.db import models
from applications.users.managers import UserManager


class User(AbstractBaseUser, PermissionsMixin):
    class Meta:
        db_table = "user"
        verbose_name = verbose_name_plural = "用户"

    GENDER_MALE = 0
    GENDER_FEMALE = 1
    GENDER_CHOICES = (
        (GENDER_MALE, '男'),
        (GENDER_FEMALE, '女'),
    )

    id = models.AutoField(u"用户认证", primary_key=True, unique=True)

    email = models.EmailField(u"邮箱", max_length=255, default="", blank=True, null=True)
    username = models.CharField(u"用户名", max_length=255, default="", blank=True, null=True)

    # student_no = models.CharField(u"学员号", max_length=128, default='', blank=True, null=True)

    avatar = models.CharField(u"头像", max_length=255, blank=True, null=True)
    phone = models.CharField(u"手机号", max_length=24, blank=True, null=True, default="")
    gender = models.SmallIntegerField(u"性别", default=GENDER_FEMALE, choices=GENDER_CHOICES)

    city = models.CharField(u"城市", max_length=128, default="", blank=True, null=True)
    company = models.CharField(u"单位", max_length=256, default="", blank=True, null=True)
    position = models.CharField(u"职位", max_length=128, default="", blank=True, null=True)

    is_active = models.BooleanField(u"是否可用", default=True)
    is_admin = models.BooleanField(u"是否是管理权限", default=False)
    is_staff = models.BooleanField(u"是否可以进入后台", default=False)

    date_of_birth = models.DateField(u"生日", blank=True, null=True)

    money = models.IntegerField(u"余额", default=0)

    objects = UserManager()

    USERNAME_FIELD = 'id'
    REQUIRED_FIELDS = ["email", ]

    def get_username(self):
        return self.get_full_name()

    def get_full_name(self):
        return "%s" % self.username

    def get_short_name(self):
        return self.email

    def __unicode__(self):
        return self.get_full_name()

    @classmethod
    def get_user_by_phone(cls, phone):
        users = User.objects.filter(phone=phone)
        try:
            # 返回第一个会员
            return users[0]
        except:
            return None

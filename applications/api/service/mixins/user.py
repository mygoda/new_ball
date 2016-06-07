# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.contrib.auth import authenticate, login
from applications.api.models import VerifyPhone
from applications.users.models import User


class UserLoginMixin(object):
    def get_login_user(self, request, username="", phone="", code="", **kwargs):
        if request.user.is_authenticated():
            user = request.user
        else:
            code_passed = VerifyPhone.check_code(phone, code)
            if not code_passed:
                raise Exception(u"验证码错误")

            user = authenticate(phone=phone)
            if not user:
                user = User(username=username, phone=phone)
                user.save()
                user = authenticate(phone=phone)
            login(request, user)
        return user
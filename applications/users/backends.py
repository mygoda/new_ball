# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.contrib.auth.hashers import check_password
from django.db.models import Q
from applications.users.models import User


class EmailBackend(object):
    """
    Authenticate against the settings ADMIN_LOGIN and ADMIN_PASSWORD.

    Use the login name, and a hash of the password. For example:

    ADMIN_LOGIN = 'admin'
    ADMIN_PASSWORD = 'sha1$4e987$afbcf42e21bd417fb71db8c66b321e9fc33051de'
    """
    def authenticate(self, username=None, password=None):
        try:
            email = username
            users = list(User.objects.filter(Q(email=email) | Q(username=email)))
            if not users:
                return None
            else:
                user = users[0]

            passed = check_password(password, user.password)
            if passed:
                return user
            return None
        except Exception, err:
            return None

    def get_user(self, id):
        try:
            return User.objects.get(pk=id)
        except User.DoesNotExist:
            return None


class PhoneCheckBackend(object):
    def authenticate(self, phone):
        user = User.get_user_by_phone(phone)
        return user

    def get_user(self, id):
        try:
            return User.objects.get(pk=id)
        except User.DoesNotExist:
            return None
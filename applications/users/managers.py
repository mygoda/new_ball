# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.contrib.auth.models import BaseUserManager
import logging

class UserManager(BaseUserManager):

    def create_user(self, id=None, email=None, password="123456", phone="", username=""):
        user = self.model()
        user.set_password(password)
        user.email = email
        user.username = username
        user.phone = phone
        user.save(using=self._db)
        return user

    def create_superuser(self, id=None, email=None, password="admin"):
        user = self.model()
        user.set_password(password)
        user.email = email
        user.is_admin = True
        user.is_superuser = True
        user.is_staff = True
        user.save(using=self._db)
        return user

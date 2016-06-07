# -*- coding: utf-8 -*-
# __author__ = xutao
# 视图处理函数
from __future__ import division, unicode_literals, print_function
from django.views.generic import View
from applications.api.service.mixins.views import ApiCatchExceptionMixin, ApiQuerysetMixin, ApiGetMixin
from applications.api.service.ball import *


class GameUserQuerysetView(ApiCatchExceptionMixin, ApiQuerysetMixin, View):
    def get_model_service(self, **kwargs):
        return GameUserService(**kwargs)


class GamesQuerysetView(ApiCatchExceptionMixin, ApiQuerysetMixin, View):
    def get_model_service(self, **kwargs):
        return GameService(**kwargs)


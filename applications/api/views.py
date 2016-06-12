# -*- coding: utf-8 -*-
# __author__ = xutao
# 视图处理函数
from __future__ import division, unicode_literals, print_function
from django.views.generic import View
from applications.api.service.mixins.views import ApiCatchExceptionMixin, ApiQuerysetMixin, ApiGetMixin
from applications.api.service.ball import *
from applications.ball.models import *
from libs.http import json_success_response


class GameUserQuerysetView(ApiCatchExceptionMixin, ApiQuerysetMixin, View):
    def get_model_service(self, **kwargs):
        return GameUserService(**kwargs)


class GamesQuerysetView(ApiCatchExceptionMixin, ApiQuerysetMixin, View):
    def get_model_service(self, **kwargs):
        return GameService(**kwargs)


def games_api_list(request):
    """
        返回可以下注的
    :param request:
    :return:
    """
    games = Game.objects.filter(user_can_odd=True)
    games = [game.to_json() for game in games]
    return json_success_response(json_data={"games": games})


# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from applications.api.service.base import ServiceBase

from applications.ball.models import *


class GameService(ServiceBase):

    model = Game

    queryset_name = "games"

    obj_name = "game"

    def obj_to_json(self, obj):
        return obj.to_json()


class GameUserService(ServiceBase):

    model = UserGameShip

    queryset_name = "game_users"

    obj_name = "game_user"

    def obj_to_json(self, obj):
        return obj.to_json()


class GameStaService(ServiceBase):

    model = GameStat

    queryset_name = "game_stats"

    obj_name = "game_stats"

    def obj_to_json(self, obj):
        return obj.to_json()


class TeamService(ServiceBase):

    model = Team

    queryset_name = "teams"

    obj_name = "team"

    def obj_to_json(self, obj):
        return obj.to_json()
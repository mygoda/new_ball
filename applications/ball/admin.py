# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.contrib import admin
from applications.ball.models import Team, Game, UserGameShip, GameStat


class TeamAdmin(admin.ModelAdmin):

    list_display = ["name", "group"]


class GameAdmin(admin.ModelAdmin):
    list_display = ["name", "show_name", "start_time", "success", "extra_goal", "host_win", "other_win", "host_point",
                    "other_point", "default_water", "is_check"]

    def show_name(self, obj):
        return obj.game_name
    show_name.short_description = u"比赛对阵"


class UserGameShipAdmin(admin.ModelAdmin):

    list_display = ["username", "game_name", "money", "team_name", "win_odd", "is_check"]

    def username(self, obj):
        return obj.user.username
    username.short_description = u"下注人"

    def game_name(self, obj):
        return obj.game.game_name
    game_name.short_description = u"比赛名称"

    def team_name(self, obj):
        team = Team.objects.get(id=obj.user_choice_team)
        return team.name
    team_name.short_description = u"下注球队"


admin.site.register(Team, TeamAdmin)
admin.site.register(GameStat)
admin.site.register(Game, GameAdmin)
admin.site.register(UserGameShip, UserGameShipAdmin)
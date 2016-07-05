# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.contrib import admin
from applications.ball.models import Team, Game, UserGameShip, GameStat, ForAdmin, GoldGame, ChampionModel
import datetime


# def delete_game_ship(modeladmin, request, queryset):
#     for item in queryset:
#         if not item.created_at.date() == datetime.date.today():
#             item.delete()
# delete_game_ship.short_description = u"清除用户下注记录"


def delete_user_game(modeladmin, request, queryset):
    for item in queryset:
        user = item.user
        user.money += item.money
        user.save()
        item.delete()
delete_user_game.short_description = u"清楚所选用户下注记录"


def delete_user_for(modeladmin, request, queryset):
    for item in queryset:
        user = item.user
        user.money += item.money
        user.save()
        item.delete()
delete_user_game.short_description = u"清楚所选用户打赏记录"

#
# def update_user_money(modeladmin, request, queryset):
#     user_ids = []
#     for item in queryset:
#         user = item.user
#         if user.id not in user_ids:
#             user.money = 0
#             user.save()
#         user.money -= item.money
#         user_ids.append(user.id)
#         user.save()
# update_user_money.short_description = u"更新用户余额"


class TeamAdmin(admin.ModelAdmin):

    list_display = ["name", "group"]


class GameAdmin(admin.ModelAdmin):
    list_display = ["name", "show_name", "start_time", "success", "extra_goal", "host_win", "other_win", "host_point",
                    "other_point", "default_water", "is_check", "user_can_odd", "created_at"]

    def show_name(self, obj):
        return obj.game_name
    show_name.short_description = u"比赛对阵"


class UserGameShipAdmin(admin.ModelAdmin):

    list_display = ["username", "game_name", "game_result", "game_point", "extra_goal", "money", "team_name", "win_odd", "is_check",
                    "created_at"]

    list_filter = ["user__username"]

    search_fields = ["user__username", ]

    actions = [delete_user_game]

    def username(self, obj):
        return obj.user.username
    username.short_description = u"下注人"

    def game_name(self, obj):
        return obj.game.game_name
    game_name.short_description = u"比赛名称"

    def game_result(self, obj):
        if obj.game.success in ["unstart", "playing"]:
            return u"未开始"
        else:
            return u"已结束"
    game_result.short_description = u"比赛结果"

    def game_point(self, obj):
        return obj.game.game_point if obj.game else ""
    game_point.short_description = u"比分"

    def team_name(self, obj):
        team = Team.objects.get(id=obj.user_choice_team)
        return team.name
    team_name.short_description = u"下注球队"


class StatAdmin(admin.ModelAdmin):

    list_display = ["game_name", "host_win_people", "other_win_people", "host_win_money", "other_win_money", "all_my", "created_at"]

    def game_name(self, obj):
        return obj.game.game_name
    game_name.short_description = u"比赛名称"


class ForModelAdmin(admin.ModelAdmin):

    list_display = ["username", "money"]

    actions = [delete_user_for]

    def username(self, obj):
        return obj.user.username if obj.user else ""

    username.short_description = u"打赏人"


class GoldAdmin(admin.ModelAdmin):

    list_display = ["team_name", "win_odd", "is_gold", "created_at"]

    def team_name(self, obj):
        return obj.team.name

    team_name.short_description = u"球队"


class ChamAdmin(admin.ModelAdmin):

    list_display = ["username", "gold_team_name", "user_choice_team", "money"]

    def username(self, obj):
        return obj.user.username if obj.user else ""

    username.short_description = u"投注人"

    def gold_team_name(self, obj):
        return obj.gold_game.team.name

    gold_team_name.short_description = u"冠军球队"

admin.site.register(Team, TeamAdmin)
admin.site.register(GameStat, StatAdmin)
admin.site.register(Game, GameAdmin)
admin.site.register(UserGameShip, UserGameShipAdmin)
admin.site.register(ForAdmin, ForModelAdmin)
admin.site.register(GoldGame, GoldAdmin)
admin.site.register(ChampionModel, ChamAdmin)
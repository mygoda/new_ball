# -*- coding: utf-8 -*-
# __author__ = xutao
# 视图处理函数
from __future__ import division, unicode_literals, print_function
import jsonfield
from django.db.models import Q
from django.shortcuts import render_to_response
from django.views.generic import View
from libs.http import json_success_response, json_forbidden_response, json_error_response
from django.template import RequestContext
from django.contrib.auth.decorators import login_required
import logging
from applications.ball.models import *
from django.views.decorators.csrf import csrf_exempt
from settings.const import LOGIN_TOKEN
from django.contrib import auth
from applications.users.models import User
from libs.ucenter import ucenter

logger = logging.getLogger(__name__)


@csrf_exempt
def bet(request):
    """
        下注
    :return:
    """
    try:
        data = request.POST
        game_id = data.get("game_id")
        money = abs(float(data.get("money", 5)))
        if money < 5:
            money = 5
        elif money > 500:
            money = 500
        user_id = data.get("user_id", 1)
        user = User.objects.get(id=user_id)
        user_choice = int(data.get("is_host", 0))   # 0: 战平 1: 主队, 2 客队
        game = Game.objects.get(id=game_id)
        if not game.can_add or not game.user_can_odd:
            # 无法下注的情况, 比赛已经开始, 不能下注
            return json_forbidden_response(json_data={}, msg="time_over")

        if not UserGameShip.can_start_bet(user_id=user_id, game_id=game_id):
            logger.info("user:%s can not bet that bet is more than 500 in %s" % (user_id, game_id))
            return json_forbidden_response(json_data={}, msg="can not bet")

        game_stat_exists = GameStat.objects.filter(game_id=game_id).exists()
        if not game_stat_exists:
            # 不存在
            game_stat = GameStat(game_id=game_id, host_win_add=game.host_win, other_win_add=game.other_win, equal_win_add=game.equal)
        else:
            game_stat = GameStat.objects.filter(game_id=game_id)[0]
            game_stat.host_win_add = game.host_win
            game.other_win_add = game.other_win
            game.equal_win_add = game.equal

        # game.success = u"win"
        user_choice_team_id = None
        if user_choice == 0:
            # 战平
            # game.success = "equal"
            win_add = game.equal
            game_stat.equal_win_people += 1
            game_stat.equal_win_money += money
        elif user_choice == 1:
            # 主队获胜
            win_add = game.host_win
            game.win_id = game.host_team.id
            user_choice_team_id = game.host_team.id
            game_stat.host_win_people += 1
            game_stat.host_win_money += money
        else:
            # 客队获胜
            win_add = game.other_win
            game.win_id = game.other_team.id
            user_choice_team_id = game.other_team.id
            game_stat.other_win_people += 1
            game_stat.other_win_money += money
        game_stat.save()
        logger.info(u"用户%s 在 比赛%s 中压%s元, %s胜利!" % (user.username, game_id, money, user_choice))

        user.money -= int(money)
        user.save()
        logger.info("用户%s 扣去 %s元" % (user.username, money))

        logger.info("start add user game ship")
        if user_choice_team_id:
            user_game_ship = UserGameShip(user=user, game_id=game_id, money=money,
                                          user_choice_team=user_choice_team_id, win_odd=win_add, extra_goal=game.extra_goal)
        else:
            user_game_ship = UserGameShip(user=user, game_id=game_id, money=money, win_odd=win_add, extra_goal=game.extra_goal)

        user_game_ship.save()
        return json_success_response(json_data={})
    except Exception as e:
        logger.info("user:%s add %s money is team:%s in game:%s" % (user_id, money, user_choice, game_id))
        logger.info("do it catch exception:%s" % str(e))
        return json_error_response(json_data={}, msg="error")


def user_add_json(request):
    """
        获取game的相关信息
    :param request:
    :return:
    """
    game_id = request.GET.get("game_id", "")
    game = Game.objects.get(id=game_id)
    data = game.obj_to_json()
    return json_success_response(json_data=data)


def user_odd(request):
    """
        查看用户自己的下注情况, 超级用户可以看到所有的统计情况
    :param request:
    :return:
    """
    data = request.GET
    user_id = data.get("user_id")
    user = User.objects.get(id=user_id)
    filter_type = data.get("filter_type", "all")    # just for all: 所有  checked: 已经结算 unchecked: 未结算
    user_games = UserGameShip.objects.filter(user_id=user.id)
    user_games_list = []
    if filter_type == "all":
        user_games_list_tmp = [user_game.to_json() for user_game in user_games]
        user_games_list = user_games_list_tmp
    elif filter_type == "checked":
        for user_game in user_games:
            if user_game.is_check:
                user_games_list.append(user_game.to_json())
    else:
        for user_game in user_games:
            if not user_game.is_check:
                user_games_list.append(user_game.to_json())

    game_stats_list = []
    if user.is_superuser:
        game_stats = GameStat.objects.all()
        for game_stat in game_stats:
            game_stats_list.append(game_stat.to_json())

    data = {
        "games": user_games_list,
        "stats": game_stats_list,
        "is_super": "yes" if user.is_superuser else "no",
        "username": user.username,
        "money": user.money,
    }

    return json_success_response(json_data=data)


def game_list(request, tmp_name=""):
    """
        查看比赛列表
    :param request:
    :param tmp_name:
    :return:
    """

    games = Game.objects.filter(success="unstart")
    game_jsons = []
    for game in games:
        game_jsons.append(game.to_json())

    data = {
        "games": games
    }

    return json_success_response(json_data=data)


def test(request):
    user = request.user
    data = {}
    if user:
        data["a"] = "abc"
    else:
        data["a"] = "11111"

    return json_success_response(json_data=data)

import json
import traceback


@csrf_exempt
def login(request):
    """
        登录
    :param request:
    :return:
    """

    # token = request.META.get("HTTP_TOKEN")
    # if not token or token != LOGIN_TOKEN:
    #     return json_success_response(msg="未授权用户")

    data = request.POST
    username = data.get("username")
    password = data.get("password")
    try:
        employee, errmsg = ucenter.employee_login(username, password)
        if not employee:
            msg = u"用户名或者密码错误"
            logger.error("login error.error username:%s password:%s error message:%s" % (username, password, errmsg))
            return json_forbidden_response(msg=msg, json_data={})
        else:
            user = User.update_cds_employee(employee)
            return json_success_response(json_data={"user_id": user.id})
    except Exception as e:
        logger.info("login ucenter catch error%s" % traceback.format_exc())
        msg = u"login when catch error"
        return json_error_response(msg=msg, json_data={})


def test_test(request):

    data = {"data": request.POST}
    data = json.loads(request.body)
    print(type(data.get("c")))
    #print(json.loads(request.POST.get("is_host")))
    return json_success_response(json_data=data)







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
        team_id = 0
        if user_choice == 1:
            team_id = game.host_team_id
        else:
            team_id = game.other_team_id

        if not game.can_add or not game.user_can_odd:
            # 无法下注的情况, 比赛已经开始, 不能下注
            return json_forbidden_response(json_data={}, msg="time_over")

        if not UserGameShip.can_start_bet(user_id=user_id, game_id=game_id, money=money, team_id=team_id):
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
        c_game_list = ChampionModel.objects.filter(user_id=user_id)
        for c in c_game_list:
            user_games_list_tmp.append(c.to_json())
        user_games_list = user_games_list_tmp
    elif filter_type == "checked":
        for user_game in user_games:
            if user_game.is_check:
                user_games_list.append(user_game.to_json())
        c_game_list = ChampionModel.objects.filter(user_id=user_id, is_checked=True)
        for c in c_game_list:
            user_games_list.append(c.to_json())
    else:
        for user_game in user_games:
            if not user_game.is_check:
                user_games_list.append(user_game.to_json())
            c_game_list = ChampionModel.objects.filter(user_id=user_id, is_checked=False)
            for c in c_game_list:
                user_games_list.append(c.to_json())

    all_money = 0

    game_stats_list = []
    is_quning = False
    if user.is_superuser:
        game_stats = GameStat.objects.all().order_by("-id")
        for game_stat in game_stats:
            game_stats_list.append(game_stat.to_json())

    if user.username == "ning.qu":
        # 庄家信息
        is_quning = True
        users_money = list(User.objects.all().values_list("money", flat=True))
        for user_money in users_money:
            if user_money < 0:
                all_money += abs(user_money)
            elif user_money > 0:
                all_money -= abs(user_money)


    data = {
        "games": user_games_list,
        "stats": game_stats_list,
        "is_super": "yes" if user.is_superuser else "no",
        "username": user.username,
        "money": user.money if not is_quning else all_money,
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


def user_stat(request):
    """
        用户的统计信息, 庄家显示
    :param request:
    :return:
    """
    data = request.GET

    user_id = int(data.get("user_id"))
    if user_id != 23:

        show_name = True
        c_sum = sum(list(ChampionModel.objects.filter(user_id=user_id).values_list("money", flat=True)))
        users = User.objects.all().order_by("-money")
        order_ids = list(users.values_list("id", flat=True))

        user_index = order_ids.index(user_id)   # 排名 需要加一

        user = users.get(id=user_id)    # 此用户

        previous_user_info = "没有人比你更爽"

        if user_index != 0:
            previous_index = user_index - 1

            previous_user = users[previous_index]

            previous_user_info = previous_user.username

        next_user_info = "没有人比你更惨"

        if user_index != len(order_ids) - 1:
            next_index = user_index + 1

            next_user = users[next_index]

            next_user_info = next_user.username

        max_user = users.first()

        min_user = users.last()

        all_game_ship = UserGameShip.objects.filter(user_id=user_id)

        game_ship_count = len(set(all_game_ship.values_list("game_id", flat=True)))

        game_sum = sum(list(all_game_ship.values_list("money", flat=True)))

        gives = ForAdmin.objects.filter(user_id=user_id)

        gives_sum = sum(list(gives.values_list("money", flat=True)))

        return_data = {
            "username": user.username,
            "user_index": user_index + 1,
            "previous_user": previous_user_info if show_name else "*****",
            "next_user": next_user_info if show_name else "*****",
            "max_user_name": max_user.username if show_name else "*****",
            "min_user_name": min_user.username if show_name else "*****",
            "my_money": user.money,
            "game_count": game_ship_count,
            "game_money": game_sum,
            "give_sum": gives_sum,
            "c_sum": c_sum,

        }
        return json_success_response(json_data=return_data)


def admin_stat(request):
    """
        ning.qu 独享
    :param request:
    :return:
    """
    # qu.ning 独享

    c_sum = 0   # 冠军投注收益

    c_sum = sum(list(ChampionModel.objects.all().values_list("money", flat=True)))

    users_ship = UserGameShip.objects.all()

    user_all_money = sum(list(users_ship.values_list("money", flat=True)))  # 总下注额度

    game_count = Game.objects.all().count()

    users_ship_count = users_ship.count()   # 下注数量

    user_count = len(set(users_ship.values_list("user_id", flat=True))) # 下注的人数

    users = User.objects.all().order_by("-money")

    max_user = users.first()    # 赢钱最多

    min_user = users.last()     # 输钱最多

    water_sum, all_my_sum = GameStat.all_my_water_sum()

    max_win, min_win = GameStat.max_min_win()

    max_win_money = max_win.all_my

    max_win_game = max_win.game.game_name

    min_win_money = min_win.all_my

    min_win_game = min_win.game.game_name

    all_admins = ForAdmin.objects.all()

    give_sum = sum(list(all_admins.values_list("money", flat=True)))

    give_people_count = all_admins.count()

    max_user_info = "%s 收益: %s" % (max_user.username, max_user.money)

    min_user_info = "%s 收益: %s" % (min_user.username, min_user.money)

    max_game_win = "%s 收益: %s" % (max_win_game, max_win_money)

    min_game_win = "%s 收益: %s" % (min_win_game, min_win_money)

    super_win = all_my_sum - water_sum + give_sum

    return_data = {
        "user_all_money": user_all_money,
        "users_ship_count": users_ship_count,
        "user_count": user_count,
        "max_user_info": max_user_info,
        "min_user_info": min_user_info,
        "max_game_win": max_game_win,
        "min_game_win": min_game_win,
        "give_sum": give_sum,
        "give_people_count": give_people_count,
        "game_count": game_count,
        "water_sum": water_sum,
        "all_my_sum": round(all_my_sum, 2),
        "super_win": round(super_win),
        "c_sum": c_sum,
    }

    return json_success_response(json_data=return_data)


def for_admin_list(request):
    """
        打赏榜
    :param request:
    :return:
    """

    for_admins = ForAdmin.objects.all().order_by("-money")
    admin_json = [admin.to_json() for admin in for_admins]
    return json_success_response(json_data=admin_json)


def give_admin(request):
    """
        打赏
    :param request:
    :return:
    """

    data = request.POST

    user_id = data.get("user_id")

    money = abs(float(data.get("money", 10)))

    if money < 10:
        money = 10
    elif money > 500:
        money = 500

    give = ForAdmin(user_id=user_id, money=money)
    give.save()

    user = User.objects.get(id=user_id)
    user.money -= money
    user.save()

    logger.info("user:%s give for quning money:%s" % (user_id, money))
    return json_success_response(json_data={})


def gold_list(request):
    """
        押注冠军数组
    """

    golds = GoldGame.objects.all()
    game_list_json = [gold.to_json() for gold in golds]
    logger.info("this game is %s" % game_list_json)
    return json_success_response(json_data=game_list_json)


def add_gold(request):

    data = request.POST

    money = data.get("money")

    money = abs(float(money))

    user_id = data.get("user_id")

    gold_id = data.get("gold_id")

    if not user_id:
        return json_error_response(json_data={}, msg="下注失败,未登录")

    all_money = sum(list(ChampionModel.objects.filter(user_id=user_id).values_list("money", flat=True))) + money

    if all_money > 2000:
        return json_error_response(json_data={}, msg="超过下注金额,无法下注")

    gold = GoldGame.objects.get(id=gold_id)

    if not gold.can_add:
        return json_error_response(json_data={}, msg="超过下注时间,无法下注")

    c_model = ChampionModel(user_id=user_id, gold_game_id=gold_id, money=money, user_choice_team=gold.team_id,
                            win_odd=gold.win_odd)

    c_model.save()

    user = User.objects.get(id=user_id)
    user.money -= money
    user.save()

    return json_success_response(json_data={})















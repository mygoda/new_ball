# -*- coding: utf-8 -*-
# __author__ = xutao

# 定义celery任务
from celery import task
import logging
from applications.ball.models import GameStat, Game, UserGameShip
from applications.users.models import User
logger = logging.getLogger(__name__)


@task
def test(a, b):
    return a+b


@task
def check_money():
    """
        结算钱
    :return:
    """
    games_id = UserGameShip.objects.filter(game__success__in=["win", "equal"]).filter(is_check=False).\
        values_list("game_id", flat=True)
    games = Game.objects.filter(id__in=games_id)
    for game in games:
        game_stat = GameStat.objects.filter(game_id=game.id)[0]
        all_my_money = float(game_stat.all_my)
        game_users = UserGameShip.objects.filter(game_id=game.id)
        for game_user in game_users:
            if game_user.user_win > 0:
                # 该条记录赢钱
                logger.info("user:%s win" % game_user.user.id)
                user = game_user.user
                user_get_money = game_user.user_win
                user.money += user_get_money
                all_my_money -= user_get_money
                user.save()
            else:
                all_my_money += game_user.money
                logger.info("user:%s not win" % game_user.user.id)

            game_user.is_check = True
            game_user.save()
        game.is_check = True
        game.save()
        game_stat.all_my = all_my_money
        game_stat.save()


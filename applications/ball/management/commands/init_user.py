# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.core.management import BaseCommand
from applications.ball.models import *
from applications.users.models import User


class Command(BaseCommand):
    def handle(self, *args, **options):
        self.init_user()

    def init_user(self):

        users = User.objects.all()

        game_stat_list = []

        for user in users:
            print("user:%s check" % user.username)
            user_money = 0
            user_win_money = 0
            user_games = UserGameShip.objects.filter(user_id=user.id)
            for user_game in user_games:

                game_stat = GameStat.objects.get(game_id=user_game.game.id)
                user_money -= user_game.money
                if user_game.game.success in ["unstart", "playing"]:
                    continue
                now_user_win = user_game.user_win

                if now_user_win > 0:
                    print("user%s win money:%s" % (user.username, now_user_win))
                    if user_game.game.success not in ["unstart", "playing"]:
                        if game_stat.id not in game_stat_list:
                            game_stat_list.append(game_stat.id)
                            game_stat.all_my = 0
                            game_stat.save()
                        game_stat.all_my -= user_game.oh_money
                    user_win_money += now_user_win

                else:
                    if user_game.game.success not in ["unstart", "playing"]:
                        if game_stat.id not in game_stat_list:
                            game_stat_list.append(game_stat.id)
                            game_stat.all_my = 0
                            game_stat.save()
                        game_stat.all_my -= user_game.oh_money
                    print(game_stat.all_my)
                    print("user:%s is not win oh my is:%s" % (user.username, user_game.oh_money))
                user_game.is_check = True
                game_stat.save()

            user.money = user_money
            user.save()
            print(user.money)
            user.money += user_win_money
            user.save()


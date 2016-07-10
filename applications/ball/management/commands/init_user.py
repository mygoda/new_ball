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

        quning = User.objects.get(id=23)

        for user in users:
            print("user:%s check" % user.username)
            user_money = 0
            user_win_money = 0
            user_games = UserGameShip.objects.filter(user_id=user.id)
            for_admin_sum = sum(list(ForAdmin.objects.filter(user_id=user.id).values_list("money", flat=True)))
            user_money -= for_admin_sum
            quning.money += for_admin_sum
            print("user for admin %s" % user_money)
            c_games = ChampionModel.objects.filter(user_id=user.id)
            for c_game in c_games:
                # get use c money
                user_money -= c_game.money
                game_money = c_game.get_money()
                if game_money > 0:
                    # 赢钱
                    user_win_money += game_money
                    quning.money -= game_money - c_game.money
                else:
                    quning.money -= game_money

            for user_game in user_games:

                game_stat = GameStat.objects.get(game_id=user_game.game.id)
                user_money -= user_game.money
                if user_game.game.success in ["unstart", "playing"]:
                    continue

                now_user_win = user_game.user_win
                user_water = user_game.user_water
                if now_user_win > 0:
                    print("user%s win money:%s in %s" % (user.username, now_user_win, user_game.game.game_name))
                    if user_game.game.success not in ["unstart", "playing"]:
                        if game_stat.id not in game_stat_list:
                            game_stat_list.append(game_stat.id)
                            game_stat.all_my = 0
                            game_stat.equal_win_add = 0
                            game_stat.save()
                        game_stat.all_my -= user_game.oh_money
                        quning.money -= user_game.oh_money
                        game_stat.equal_win_add += user_water   # 水钱
                    user_win_money += now_user_win

                else:
                    if user_game.game.success not in ["unstart", "playing"]:
                        if game_stat.id not in game_stat_list:
                            game_stat_list.append(game_stat.id)
                            game_stat.all_my = 0
                            game_stat.equal_win_add = 0
                            game_stat.save()
                        game_stat.all_my -= user_game.oh_money
                        quning.money -= user_game.oh_money

                    print(game_stat.all_my)
                    print("user:%s is not win oh my is:%s" % (user.username, user_game.oh_money))
                user_game.is_check = True
                user_game.save()
                game_stat.save()

            user.money = user_money
            user.save()
            print(user.money)
            user.money += user_win_money
            # give_money = ForAdmin.objects.filter(user_id=user.id).values_list("money", flat=True)
            # give_money_sum = sum(list(give_money))
            # print("user:%s has give admin money:%s" % (user.username, give_money_sum))
            # user.money -= give_money_sum
            user.save()
            quning.save()



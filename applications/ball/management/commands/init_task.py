# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.core.management import BaseCommand
from applications.ball.models import *


class Command(BaseCommand):
    def handle(self, *args, **options):
        self.init_stat()

    def init_stat(self):
        # 更新统计数据

        all = GameStat.objects.all()

        for item in all:
            print("item stat %s" % item.id)
            game = item.game
            host_win_people = 0
            other_win_people = 0
            host_money = 0
            other_money = 0
            user_games = UserGameShip.objects.filter(game_id=game.id)
            for game_item in user_games:

                print("init usergame %s" % game_item.id)
                if game_item.user_choice_team == game.host_team_id:
                    # 主队i
                    host_win_people += 1
                    host_money += game_item.money
                elif game_item.user_choice_team == game.other_team_id:
                    other_win_people += 1
                    other_money += game_item.money

            item.host_win_people = host_win_people
            item.host_win_money = host_money
            item.other_win_people = other_win_people
            item.other_win_money = other_money
            item.save()






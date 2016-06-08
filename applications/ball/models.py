# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function

import pytz
from django.db import models
from settings import settings
import datetime
from libs.datetimes import datetime_to_str
import logging

logger = logging.getLogger(__name__)

auth_user_model = getattr(settings, 'AUTH_USER_MODEL', 'user.User')

GAME_SUCCESS = (
    ("win", u"非平手"),
    ("equal", u"平手"),
    ("unstart", u"未开始"),
    (u"playing", u"进行中"),
)


class Team(models.Model):

    class Meta:
        app_label = "ball"
        db_table = "ball_team"
        verbose_name_plural = verbose_name = u"球队"

    name = models.CharField(u"球队名称", null=True, blank=True, max_length=16)
    group = models.CharField(u"小组", null=True, blank=True, max_length=8)

    created_at = models.DateTimeField(u"创建时间", default=datetime.datetime.now)
    update_at = models.DateTimeField(u"更新时间", default=datetime.datetime.now)

    def __unicode__(self):
        return self.name

    def to_json(self):
        return {
            "id": self.id,
            "name": self.name,
            "group": self.group,
        }


class Game(models.Model):
    class Meta:
        app_label = "ball"
        db_table = "ball_game"
        verbose_name_plural = verbose_name = u"比赛"

    name = models.CharField(u"比赛名称", null=True, blank=True, max_length=24)
    host_team = models.ForeignKey(Team, verbose_name=u"主队", null=True, blank=True, related_name=u"game_host")
    other_team = models.ForeignKey(Team, verbose_name=u"客队", null=True, blank=True, related_name=u"game_other")

    win = models.ForeignKey(Team, verbose_name=u"获胜队", null=True, blank=True, related_name=u"game_win")

    success = models.CharField(u"结果", choices=GAME_SUCCESS, max_length=12, default="unstart")

    start_time = models.DateTimeField(u"开球时间", default=datetime.datetime.now)
    end_time = models.DateTimeField(u"结球时间", default=datetime.datetime.now)

    host_win = models.FloatField(u"主队获胜赔率", default=1)
    other_win = models.FloatField(u"客队获胜赔率", default=1)
    equal = models.FloatField(u"战平赔率", default=1)

    extra_goal = models.CharField(u"主队让球", max_length=32, null=True, blank=True)    # 若为负的则,是主队输

    host_point = models.IntegerField(u"主队比分", default=0)

    other_point = models.IntegerField(u"客队比分", default=0)

    default_water = models.IntegerField(u"水钱比例", default=14)    # 默认的百分比

    is_check = models.BooleanField(u"是否结算", default=False)

    created_at = models.DateTimeField(u"创建时间", default=datetime.datetime.now)
    update_at = models.DateTimeField(u"更新时间", default=datetime.datetime.now)

    def __unicode__(self):
        return self.name

    @property
    def game_name(self):
        return "%s - %s" % (self.host_team, self.other_team)

    @property
    def game_point(self):
        return "%s : %s" % (self.host_point, self.other_point)

    @property
    def goal_list(self):
        """
            查看让球让球
        :return:
        """
        if self.extra_goal:
            extra_goal_list = self.extra_goal.split(",")
            if len(extra_goal_list) == 2:
                return "%s/%s" % (extra_goal_list[0], extra_goal_list[1])
            else:
                return "%s" % extra_goal_list[0]
        else:
            return u"无"


    @property
    def who_win(self):
        """
            谁赢了
        :return:
        """
        if self.success == "equal":
            # 平局
            return 0
        elif self.success == "unstart":
            # 未开始
            return 3
        else:
            if self.win_id == self.host_team_id:
                # 主胜
                return 1
            else:
                return 2

    @property
    def win_team_name(self):
        if self.success == "equal":
            # 平局
            return "战平"
        elif self.success == "unstart":
            return "未开始"
        elif self.success == "playing":
            return "进行中"
        else:
            if self.win_id == self.host_team_id:
                # 主胜
                return "%s胜 %s" % (self.host_team.name, self.game_point)
            else:
                return "%s胜 %s" % (self.other_team.name, self.game_point)

    @property
    def can_add(self):
        """
            是否可以下注
        :return:
        """
        now = datetime.datetime.now()
        now = now.replace(tzinfo=pytz.timezone("Asia/Shanghai"))
        if now > self.start_time:
            # 只要下注时间超过开球时间就不允许
            return False

        if self.success != "unstart":
            return False
        print("*" * 30)
        return True

    def to_json(self):
        return {
            "id": self.id,
            "name": self.name,
            "game_name": self.game_name,
            "status": self.success,
            "can_add": "ok" if self.can_add else "no",
            "game_status": self.win_team_name,
            "goal": self.goal_list,
        }

    def obj_to_json(self):
        return {
            "host_team": self.host_team.name,
            "other_team": self.other_team.name,
            "host_win": self.host_win,
            "other_win": self.other_win,
            "equal": self.equal,
            "id": self.id,
            "can_add": "ok" if self.can_add else "no",
            "goal": self.goal_list,
        }


class UserGameShip(models.Model):
    class Meta:
        app_label = "ball"
        db_table = "ball_game_user_ship"
        verbose_name_plural = verbose_name = u"比赛下注情况"

    user = models.ForeignKey(auth_user_model, verbose_name=u"下注人", null=True, blank=True)
    game = models.ForeignKey(Game, verbose_name=u"比赛", null=True, blank=True)

    user_choice_team = models.IntegerField(u"球队id", default=0)

    money = models.IntegerField(u"下注额", default=0)

    extra_goal = models.CharField(u"主队让球", max_length=32, null=True, blank=True)    # 若为负的则,是主队输

    win_odd = models.FloatField(u"获胜赔率", default=1, null=True, blank=True)

    is_check = models.BooleanField(u"是否结算", default=False)

    created_at = models.DateTimeField(u"创建时间", default=datetime.datetime.now)
    update_at = models.DateTimeField(u"更新时间", default=datetime.datetime.now)

    def __unicode__(self):
        return self.user.username

    @property
    def user_win(self):
        """
            用户是否赢钱, 赢了多少
        :return:
        """

        all_money = 0
        default_water = 1 - float(self.game.default_water) / 100
        if self.game.success not in ["unstart", "playing"]:
            if self.extra_goal:
                # 存在的情况
                extra_goal_list = self.extra_goal.split(",")
                if len(extra_goal_list) == 2:
                    # 拆分算钱
                    money = float(self.money) / 2
                    for extra_goal in extra_goal_list:
                        game_result = self.game.host_point - float(extra_goal) - self.game.other_point  # 是否主队赢了
                        if game_result == 0:
                            all_money += self.money
                        elif game_result < 0:
                            # 客队赢了
                            if self.user_choice_team == self.game.other_team_id:
                                all_money += float(self.money) + money * float(self.win_odd) * default_water

                        else:
                            # 押主队的赢了
                            if self.user_choice_team == self.game.host_team_id:
                                all_money += float(self.money) + money * float(self.win_odd) * default_water
                else:
                    # 就一个让球
                    extra_goal = extra_goal_list[0]
                    money = float(self.money)
                    game_result = self.game.host_point - int(extra_goal) - self.game.other_point  # 是否主队赢了
                    if game_result == 0:
                        all_money += self.money
                    elif game_result < 0:
                        # 客队赢了
                        if self.user_choice_team == self.game.other_team_id:
                            all_money += float(self.money) + money * float(self.win_odd) * default_water

                    else:
                        # 押主队的赢了
                        if self.user_choice_team == self.game.host_team_id:
                            all_money += float(self.money) + money * float(self.win_odd) * default_water
            else:
                # 不存在让球
                extra_goal = 0
                money = float(self.money)
                game_result = self.game.host_point - int(extra_goal) - self.game.other_point  # 是否主队赢了
                if game_result == 0:
                    # 主队, 客队的收益拿回本钱
                    all_money += self.money
                elif game_result < 0:
                    # 客队赢了
                    if self.user_choice_team == self.game.other_team_id:
                        all_money += float(self.money) + money * float(self.win_odd) * default_water

                else:
                    # 押主队的赢了
                    if self.user_choice_team == self.game.host_team_id:
                        all_money += float(self.money) + money * float(self.win_odd) * default_water
        return all_money

    @property
    def choice_team(self):
        team = Team.objects.get(id=self.user_choice_team)
        return team.name

    @property
    def user_get_money(self):
        """
            用户收益
        :return:
        """
        return self.user_win

    def to_json(self):
        return {
            "id": self.id,
            "name": self.game.name,
            "game_name": self.game.game_name,
            "success": self.game.success,
            "user_team": self.choice_team if self.user_choice_team else "平局",
            "win_add": self.win_odd,
            "money": self.money,
            "game_status": self.game.win_team_name,
            "got_money": self.user_get_money,
        }


class GameStat(models.Model):
    class Meta:
        app_label = "ball"
        db_table = "ball_game_stat"
        verbose_name_plural = verbose_name = u"下注统计"

    game = models.ForeignKey(Game, verbose_name=u"比赛", null=True, blank=True)

    host_win_people = models.IntegerField(u"押主队人数", default=0)
    other_win_people = models.IntegerField(u"押客队人数", default=0)
    equal_win_people = models.IntegerField(u"押客队人数", default=0)

    host_win_money = models.IntegerField(u"押主队金额", default=0)
    other_win_money = models.IntegerField(u"押客队金额", default=0)
    equal_win_money = models.IntegerField(u"战平押注金额", default=0)

    host_win_add = models.FloatField(u"主队赔率", default=1)
    other_win_add = models.FloatField(u"客队赔率", default=1)
    equal_win_add = models.FloatField(u"战平赔率", default=0)

    all_my = models.FloatField(u"本场收益", default=0)

    created_at = models.DateTimeField(u"创建时间", default=datetime.datetime.now)
    update_at = models.DateTimeField(u"更新时间", default=datetime.datetime.now)

    def __unicode__(self):
        return self.game.name

    @property
    def get_money(self):
        """
            收益情况
        :return:
        """
        who_win = self.game.who_win
        if who_win == 0:
            # 平局
            my_money = self.host_win_add * self.host_win_money + self.other_win_add * self.other_win_money\
                       - self.equal_win_add * self.equal_win_money
        elif who_win == 1:
            # 主队胜利
            my_money = self.equal_win_add * self.equal_win_money - self.host_win_add * self.host_win_money\
                       + self.other_win_add * self.other_win_money
        else:
            my_money = self.equal_win_add * self.equal_win_money + self.host_win_add * self.host_win_money\
                       - self.other_win_add * self.other_win_money
        return my_money

    def to_json(self):
        return {
            "id": self.id,
            "game_name": self.game.game_name,
            "host_win_people": self.host_win_people,
            "host_win_money": self.host_win_money,
            "host_win_add": self.host_win_add,

            "other_win_people": self.other_win_people,
            "other_win_money": self.other_win_money,
            "other_win_add": self.other_win_add,

            "equal_win_people": self.equal_win_people,
            "equal_win_money": self.equal_win_money,
            "equal_win_add": self.equal_win_add,
            "get_money": self.all_my,
            "win_team": self.game.win_team_name,
            "name": self.game.name,

        }
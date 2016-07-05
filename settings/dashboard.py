# -*- coding: utf-8 -*-
# __author__ = chenchiyuan

from __future__ import division, unicode_literals, print_function

from grappelli.dashboard import modules, Dashboard


class CustomIndexDashboard(Dashboard):
    title = u"CDS欧洲杯"

    def init_with_context(self, context):
        site_name = u"CDS欧洲杯"

        self.children.append(modules.ModelList(
            u"用户管理",
            column=1,
            collapsible=True,
            models=(
                'applications.users.models.User',
                'applications.api.models.UserPassword',
            )
        ))

        self.children.append(modules.ModelList(
            u"押注管理",
            column=1,
            collapsible=True,
            models=(
                'applications.ball.models.Team',
                'applications.ball.models.Game',
                'applications.ball.models.UserGameShip',
                'applications.ball.models.GameStat',
                'applications.ball.models.ForAdmin',
                'applications.ball.models.GoldGame',
                'applications.ball.models.ChampionModel',

            )
        ))

        self.children.append(modules.ModelList(
                u"任务调度器",
                column=1,
                collapsible=True,
                models=(
                    'djcelery.models.PeriodicTask',
                    "djcelery.models.WorkerState",
                    "kombu.transport.django.models.Message",
                )
            ))
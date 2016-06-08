# -*- coding: utf-8 -*-
# __author__ = xutao

# 定义celery任务
from __future__ import absolute_import

import os

from celery import Celery

import logging


logger = logging.getLogger(__name__)
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'settings.settings')
from django.conf import settings

app = Celery('p2p')

app.config_from_object('django.conf:settings')
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)


@app.task(bind=True)
def debug_task(self):
    print('Request: {0!r}'.format(self.request))  #dumps its own request information



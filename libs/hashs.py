# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
import hashlib
import uuid


def md5(content):
    m = hashlib.md5()
    m.update(content)
    return m.hexdigest()


def create_uuid(name=''):
    '''
    自动生成36位uuid
    :param name:
    :return:
    '''
    return str(uuid.uuid1())
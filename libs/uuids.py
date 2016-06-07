# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
import uuid
import random


def get_uuid():
    u = uuid.uuid4()
    return str(u).replace("-", "")


def make_uuid():
    return get_uuid()


def make_uuid_digit(digit=10):
    uid = get_uuid()
    return uid[:digit]


def make_uuid_6(digit=6):
    return make_uuid_digit(digit)


def make_uuid_10(digit=10):
    return make_uuid_digit(digit)


def make_uuid_20(digit=20):
    return make_uuid_digit(digit)


def get_code(seed=range(0, 10), digit=6):
    code = ""
    for i in range(digit):
        code += unicode(random.choice(seed))
    return code
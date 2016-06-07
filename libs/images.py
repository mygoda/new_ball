# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
import imghdr


def detect_image_type(content):
    return imghdr.what("", h=content)
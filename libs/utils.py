# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from libs.hashs import md5
from django.conf import settings
from libs.uuids import get_code

import requests
import logging

logger = logging.getLogger(__name__)


def get_qrcode_url(text):
    return "http://qr.liantu.com/api.php?text=%s" % text


def get_tiny_url(url):
    logger.info("send tiny url %s" % url)
    try:
        service_url = "http://163.fm/generateOShort?q=%s" % url
        r = requests.get(service_url)
        shorten_url = r.content.strip()
        if not shorten_url.startswith("http"):
            return url
        else:
            return shorten_url
    except:
        return url


def md5_sign(**kwargs):
    prefix = "qingcheng&kent&ccy&wxttt&hongru&wangxin&liujie"
    content = ""
    for key, value in kwargs.items():
        content = unicode(key) + unicode(value)
    sign = md5(content+prefix)
    logger.info("md5 sign kwargs %s" % kwargs)
    logger.info("md5 sign %s" % sign)
    return sign


def get_file_type(name):
    parts = name.split(".")
    if not parts:
        return ""
    else:
        return parts[-1]


def get_out_trade_no(digit=8):
    cname = settings.SYSTEM_NAME
    code = get_code(digit=8)
    return "{cname}{code}".format(cname=cname, code=code)


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip
# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.conf import settings
from libs.logs import log_message
import requests
import urllib
import logging
import json
import xmltodict

logger = logging.getLogger(__name__)

SECRET_KEY = settings.SMS_SECRET_KEY
ACCESS_KEY = settings.SMS_ACCESS_KEY


def send_sms(to_user_number, content):
    from applications.meeting.models import Message
    from applications.base.models import ServerSetting

    setting = ServerSetting.only_one()
    if not setting.sms_enable:
        message = Message(phone=to_user_number, content=content, is_successful=False, response="")
        message.save()
        logger.info("sms setting False, not send sms")
        return "", False

    try:
        response, is_successful = _send_sms_by_guodu(to_user_number, content)
    except:
        logger.error(log_message("send message error"))
        response, is_successful = "", False
    try:
        message = Message(phone=to_user_number, content=content, is_successful=is_successful, response=response)
        message.save()
    except Exception, err:
        logger.warning(u"save message error %s" % err.message)
    return content, is_successful


def _send_sms(to_user_number, content):
    if settings.DEBUG:
        message = "debug,to %s send message: %s" %(to_user_number, content)
        logger.info(log_message(message))
        return "", True

    data = {
        "secretkey": SECRET_KEY,
        "accesskey": ACCESS_KEY,
        "mobile": to_user_number,
        "content": content.encode("utf-8")
    }
    encode_url = urllib.urlencode(data)
    url = "http://sms.bechtech.cn/Api/send/data/json?%s" %encode_url
    res = requests.get(url)
    json_data = json.loads(res.content)
    if json_data['result'] != "01":
        message = "send sms error, to_phone: %s, content: %s, errorno: %s" %(unicode(to_user_number),
                                                                             content, json_data['result'])
        logger.warning(log_message(message))
    return res.content, True


def _send_sms_by_guodu(to_user_number, content):
    APPEND_ID_MAP = {
        u"【课程预约】": u"01",
        u"【青橙科技】": u"02",
        u"【青橙生活】": u"03",
        u"【会议培训报名】": u"04",
    }

    if settings.DEBUG:
        message = "debug,to %s send message: %s" %(to_user_number, content)
        logger.info(log_message(message))
        return "", True

    # 默认append_id
    append_id = u"01"
    # 动态分配appendid
    for key, value in APPEND_ID_MAP.items():
        if content.startswith(key):
            append_id = value

    data = {
        "OperID": settings.SMS_GUODU_USERNAME,
        "OperPass": settings.SMS_GUODU_PASSWORD,
        "DesMobile": to_user_number,
        "Content": content.encode("gbk"),
        "ContentType": 8, # 15为普通短信，8为长短信
        "AppendID": append_id
    }
    encode_url = urllib.urlencode(data)
    url = "http://%s:%s%s?%s" % (settings.SMS_GUODU_SERVER,
                                 settings.SMS_GUODU_PORT,
                                 settings.SMS_GUODU_PATH,
                                 encode_url)
    r = requests.get(url)
    json_data = xmltodict.parse(r.content.decode("gbk"))
    if not json_data['response']['code'] in ['01', '03']:
        message = "send sms error, to_phone: %s, content: %s, errorno: %s" %(unicode(to_user_number),
                                                                             content, json.dumps(json_data['result']))
        logger.warning(log_message(message))
    return r.content, True
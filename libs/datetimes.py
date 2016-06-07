# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from datetime import timedelta
from django.utils.timezone import is_naive, get_default_timezone, make_aware, now, make_naive, is_aware
from datetime import datetime as py_time
import time

DATE_FORMAT = "%Y-%m-%d"
TIME_FORMAT = "%H:%M:%S"
STRATEGY_TIME_FORMAT = "%H:%M"
DATETIME_FORMAT = "%sT%s" % (DATE_FORMAT, TIME_FORMAT)
USE_MICROSECONDS = True


def time_to_str(time, format=STRATEGY_TIME_FORMAT):
    return time.strftime(format)


def date_to_str(date, format=DATE_FORMAT):
    return date.strftime(format)


def datetime_to_str(datetime, format=DATETIME_FORMAT):
    if is_aware(datetime):
        datetime = to_naive_datetime(datetime)

    return datetime.strftime(format)


def datetime_delta(datetime, **kwargs):
    delta = timedelta(**kwargs)
    return datetime + delta


def str_to_datetime(str, format=DATETIME_FORMAT):
    if isinstance(str, py_time):
        if is_naive(str):
            return to_aware_datetime(str)
        else:
            return str

    return to_aware_datetime(py_time.strptime(str, format))


def to_aware_datetime(value):
    time_zone = get_default_timezone()
    return make_aware(value, time_zone)


def to_naive_datetime(value):
    time_zone = get_default_timezone()
    return make_naive(value, time_zone)


def datetime_now():
    return now()


def dates_during(from_date, to_date, weekdays=None):
    if weekdays == None:
        weekdays = range(0, 8)
    if not weekdays:
        weekdays = []

    dates = []
    delta_day = (to_date - from_date).days
    for delta in range(0, delta_day+1):
        date = from_date + timedelta(days=delta)
        if date.weekday() + 1 in weekdays:
            dates.append(date)
    return dates


def get_weekday(datetime):
    days = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
    return days[datetime.weekday()]


def datetime_to_timestamp(datetime, use_microseconds=USE_MICROSECONDS):
    if is_aware(datetime):
        datetime = to_naive_datetime(datetime)
    timetuple = datetime.timetuple()
    seconds = time.mktime(timetuple)
    if use_microseconds:
        return seconds*1000
    else:
        return seconds


def timestamp_to_datetime(timestamp, use_microseconds=USE_MICROSECONDS):
    if use_microseconds:
        timestamp = float(timestamp) / 1000
    else:
        timestamp = float(timestamp)

    datetime = py_time.fromtimestamp(timestamp)
    return datetime


def str_to_time(input_str):
    from datetime import time
    hour, minute = input_str.split(":")
    return time(int(hour), int(minute))


def str_to_date(input_str):
    return str_to_datetime(input_str, DATE_FORMAT).date()

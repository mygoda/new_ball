# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
import os
import json
from config import config

DATETIME_FORMAT = "Y-m-d H:i"
SESSION_COOKIE_AGE = 94608000 # cookie三年过期

AUTHENTICATION_BACKENDS = (
    'applications.users.backends.EmailBackend',
    'applications.users.backends.PhoneCheckBackend',
)

LOGIN_URL = "/users/login/"

AUTH_USER_MODEL = "users.User"

PROJECT_HOME = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

DEBUG = config.getboolean("django", "debug")
TEMPLATE_DEBUG = config.getboolean("django", "template_dubug")

ALLOWED_HOSTS = json.loads(config.get("django", "allowed_hosts"))
APP_HOST_NAME = config.get("django", "app_host_name")
SYSTEM_NAME = config.get("db", "db_table")

ADMINS = (
    ('Shadow', 'chenchiyuan03@gmail.com'),
)

EMAIL_TO = config.get("settings", "email_to")
EMAIL_FROM = config.get("settings", "email_from")

MANAGERS = ADMINS

DATABASES = {
    'default': {
        'ENGINE': config.get("db", "engine"),
        'NAME': 'ball',
        'USER': 'root',
        'PASSWORD': config.get("db", "password"),
        'HOST': '127.0.0.1',
        'PORT': '',
    }
}

TIME_ZONE = 'Asia/Shanghai'

LANGUAGE_CODE = 'zh-cn'

SITE_ID = 1

USE_I18N = True

USE_L10N = True

USE_TZ = True

MEDIA_ROOT = os.path.join(PROJECT_HOME, "media")

MEDIA_URL = '/media/'

STATIC_ROOT = os.path.join(PROJECT_HOME, 'static')

STATIC_URL = '/static/'

STATICFILES_DIRS = (
)


STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'django.contrib.staticfiles.finders.FileSystemFinder',
     'djangobower.finders.BowerFinder',
)

SECRET_KEY = 'dly31d$+kks@z_!jpie*zw3t=06_as+z(*q8&amp;j0e7p30-euon-'

TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    #'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'raven.contrib.django.raven_compat.middleware.SentryResponseErrorIdMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
)

ROOT_URLCONF = 'settings.urls'

WSGI_APPLICATION = 'settings.wsgi.application'

TEMPLATE_DIRS = (
    os.path.join(PROJECT_HOME, "templates"),
)

TEMPLATE_CONTEXT_PROCESSORS = (
    "django.contrib.auth.context_processors.auth",
    "django.core.context_processors.request",
    "django.core.context_processors.i18n",
    'django.contrib.messages.context_processors.messages',
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    # third_parts
    'grappelli.dashboard',
    'grappelli',
    # apps



    'django.contrib.admin',
    'django.contrib.admindocs',

    "corsheaders",
    'django_extensions',

    'raven.contrib.django.raven_compat',
    "applications.users",
    "applications.ball",
    "applications.ueditor",
    "djcelery",
    "south"
)

# djcelery setting
import djcelery  ###
djcelery.setup_loader()  ###
CELERY_TIMEZONE = 'Asia/Shanghai'  #并没有北京时区，与下面TIME_ZONE应该一致
BROKER_URL = config.get("celery", "BROKER_URL")  #任何可用的redis都可以，不一定要在django server运行的主机上
CELERYBEAT_SCHEDULER = 'djcelery.schedulers.DatabaseScheduler'

LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
    'formatters': {
        'verbose': {
            'format': '%(levelname)s %(asctime)s %(module)s %(process)d %(thread)d %(pathname)s %(lineno)s %(funcName)s %(message)s'
        },
    },
    'filters': {
        'info': {
            '()': 'libs.logs.InfoLevelFilter',
        },
        'warning': {
            '()': 'libs.logs.WarningLevelFilter'
        }
    },
    'handlers': {
        'sentry': {
            'level': 'ERROR',
            'class': 'raven.contrib.django.raven_compat.handlers.SentryHandler',
        },
        'rotate_warning': {
            'level': 'WARNING',
            'class': 'logging.handlers.TimedRotatingFileHandler',
            'filename': os.path.join(PROJECT_HOME, "data", "logs", "warning.log"),
            'when': 'D',
            'formatter': 'verbose',
            'filters': ['warning', ]
        },
        'rotate_info': {
            'level': 'INFO',
            'class': 'logging.handlers.TimedRotatingFileHandler',
            'filename': os.path.join(PROJECT_HOME, "data", "logs", "info.log"),
            'when': 'D',
            'formatter': 'verbose',
            'filters': ['info', ]
        },
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'verbose'
        }
    },
    'loggers': {
        '': {
            'level': 'DEBUG',
            'handlers': ['console', 'rotate_info', 'rotate_warning', 'sentry'],
            'propagate': False,
        },
        'django': {
            'level': 'ERROR',
            'handlers': ['console', 'rotate_info', 'rotate_warning'],
        },
        'django.request': {
            'level': 'DEBUG',
            'handlers': ['console', 'rotate_info', 'rotate_warning', 'sentry'],
            'propagate': False,
        },
        'applications': {
            'level': 'DEBUG',
            'handlers': ['console', 'rotate_info', 'rotate_warning', 'sentry'],
            'propagate': False,
        },
    },
}

INTERNAL_IPS = ['127.0.0.1']
GRAPPELLI_INDEX_DASHBOARD = 'settings.dashboard.CustomIndexDashboard'
GRAPPELLI_ADMIN_TITLE = u"cds文件分发管理后台"

FILE_HOST = config.get("file", "FILE_HOST")
FILE_FOLDER = config.get("file", "FILE_FOLDER")


#raven
RAVEN_CONFIG = {
    'dsn': config.get("sentry", "dsn"),
    'auto_log_stacks': False,
}

# PINGXX
PINGXX_TEST_KEY = u"sk_test_X9CmvHuv10GKXr90WTvvnjLC"
PINGXX_KEY = u"sk_test_X9CmvHuv10GKXr90WTvvnjLC"

# SMS
SMS_ACCESS_KEY = config.get("sms", "accesskey")
SMS_SECRET_KEY = config.get("sms", "secretkey")

#SMS_GUODU
SMS_GUODU_USERNAME = config.get("sms_guodu", "guodu_username")
SMS_GUODU_PASSWORD = config.get("sms_guodu", "guodu_password")
SMS_GUODU_SERVER = config.get("sms_guodu", "guodu_server")
SMS_GUODU_PORT = config.get("sms_guodu", "guodu_port")
SMS_GUODU_PATH = config.get("sms_guodu", "guodu_path")

WEIXIN_CLOUD_PAYMENT_API_URL = config.get("pay", "WEIXIN_CLOUD_PAYMENT_API_URL")

DEFAULT_PAGE_SIZE = 20

IMG_HOST = config.get("file", "FILE_HOST")


# 基于环境参数 开始
UCENTER_URL = 'http://10.13.0.101:80/'
UCENTER_SRC = "ucenter"
UCENTER_USER = "wenshuo.gao"
UCENTER_PASSWORD = "P@ssw0rd"

CORS_ORIGIN_ALLOW_ALL = True

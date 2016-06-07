# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.conf import settings
from django.db.models import get_model
from django.contrib.auth import login, authenticate
import logging
logger = logging.getLogger(__name__)


class WexinTokenAuthMiddleware(object):
    def process_request(self, request):
        if request.user.is_authenticated():
            return None
        else:
            token = request.GET.get("token", "")
            if not token:
                return None
            app, model_name = settings.AUTH_USER_MODEL.split('.')
            model = get_model(app, model_name)
            try:
                user = model.objects.get(token=token)
                authenticate_user = authenticate(token=token, verification=user.verification)
                login(request, authenticate_user)
            except Exception, err:
                return None
            return None

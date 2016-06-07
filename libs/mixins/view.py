# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
import logging
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from libs.decorators import login_required
from libs.http import json_forbidden_response

logger = logging.getLogger(__name__)


class RequestUserMixin(object):
    request_user_key = "__request_user"

    def get_request_user(self, request, *args, **kwargs):
        # 获取访问用户
        # web类型的访问，从cookie，读session_id，获取用户信息
        # app类型的访问，通过access_token, 获取用户信息
        request_user = getattr(self, self.request_user_key, None)
        if not request_user:
            request_user = request.user
            setattr(self, self.request_user_key, request_user)
        return request_user


class PermissionRequiredMixin(object):
    def dispatch(self, request, *args, **kwargs):
        passed = self._check_permission(request, *args, **kwargs)
        if not passed:
            logger.error("permission denied", exc_info=True, extra={
                "request": request,
            })
            return json_forbidden_response({})
        return super(PermissionRequiredMixin, self).dispatch(request, *args, **kwargs)

    def _check_permission(self, request, *args, **kwargs):
        passed = False
        user = request.user
        if not user.is_authenticated():
            return passed

        if user.is_superuser:
            passed = True
        return passed


class CsrfExemptMixin(object):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super(CsrfExemptMixin, self).dispatch(request, *args, **kwargs)


class LoginRequiredMixin(object):
    @method_decorator(login_required(login_url="mobile_user_login_view"))
    def dispatch(self, request, *args, **kwargs):
            return super(LoginRequiredMixin, self).dispatch(request, *args, **kwargs)
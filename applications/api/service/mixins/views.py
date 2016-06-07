# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from libs.http import json_error_response, json_success_response, json_forbidden_response
from applications.base.models import ErrorLog
from django.conf import settings
import logging
import json
from django.views.decorators.csrf import csrf_exempt

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


class ModelServiceMixin(RequestUserMixin, object):
    def get_model_service(self, **kwargs):
        raise NotImplemented


class ApiCatchExceptionMixin(object):
    def dispatch(self, request, *args, **kwargs):
        if settings.DEBUG:
            return super(ApiCatchExceptionMixin, self).dispatch(request, *args, **kwargs)

        try:
            response = super(ApiCatchExceptionMixin, self).dispatch(request, *args, **kwargs)
        except Exception, err:
            logger.error(err.message, exc_info=True, extra={
                "request": request,
            })
            sentry = getattr(request, "sentry", dict())
            if sentry:
                error_id = sentry.get("id", "")
            else:
                error_id = ""
            try:
                user = request.user
                if not user.is_authenticated():
                    user = None
                error_log = ErrorLog(user=user, message=err.message, sentry_id=error_id)
                error_log.save()
            except Exception, err:
                pass
            response = json_error_response(json_data={"error_id": error_id}, msg=err.message)
        return response


class PageCalMixin(object):
    def get_current_page(self, page, total_pages):
        try:
            page = int(page)
        except:
            page = 1
        if page < 1:
            page = 1
        elif page > total_pages:
            # 这里可能出现total_pages为0的情况
            page = total_pages
        return page


class ApiQuerysetMixin(ModelServiceMixin, PageCalMixin, object):
    def get(self, request, *args, **kwargs):
        params = self.get_params(request, *args, **kwargs)
        page = params.pop("page", "")
        model_service = self.get_model_service(**params)
        pages = model_service.get_total_pages()

        has_permissions = self.has_get_queryset_permissions(request, params, *args, **kwargs)
        if not has_permissions:
            return json_forbidden_response(json_data={}, msg=u"您没有接口权限")

        current_page = self.get_current_page(page, pages)
        queryset = model_service.get_queryset(page=current_page)
        queryset_json = self.queryset_to_dict(request, model_service, queryset, *args, **kwargs)
        json_data = {
            model_service.queryset_name: queryset_json,
            "current_page": current_page,
            "pages": pages,
            "total_count": model_service.get_total_count(),
        }
        return json_success_response(json_data=json_data)

    def get_params(self, request, *args, **kwargs):
        return request.GET.dict()

    def queryset_to_dict(self, request, model_service, queryset, *args, **kwargs):
        return map(lambda obj: model_service.obj_to_json(obj), queryset)

    def has_get_queryset_permissions(self, request, params, *args, **kwargs):
        return True


class BulkDeleteMixin(ModelServiceMixin, object):
    def delete(self, request, *args, **kwargs):
        model_service = self.get_model_service()
        delete_dict = json.loads(request.body)
        ids = delete_dict['ids'].split(",")
        model_service.bulk_delete(ids=ids)
        return json_success_response(json_data={})


class CreateObjMixin(ModelServiceMixin, object):
    def post(self, request, *args, **kwargs):
        model_service = self.get_model_service()
        paras = json.loads(request.body)
        paras['request'] = request
        has_permissions = self.has_post_permissions(request, paras, *args, **kwargs)
        if not has_permissions:
            return json_forbidden_response(json_data={}, msg=u"您没有新建权限")

        obj = model_service.create(**paras)
        json_data = {
            model_service.obj_name: model_service.obj_to_json(obj)
        }
        return json_success_response(json_data=json_data)

    def has_post_permissions(self, request, params, *args, **kwargs):
        return True


class ApiGetMixin(ModelServiceMixin, object):
    def get(self, request, *args, **kwargs):
        model_service = self.get_model_service()
        obj = model_service.get_obj(**kwargs)
        has_permissions = self.has_get_permissions(request, obj, *args, **kwargs)
        if not has_permissions:
            return json_forbidden_response(json_data={}, msg=u"您没有读取权限")

        json_data = {model_service.obj_name: model_service.obj_to_json(obj)}
        return json_success_response(json_data=json_data)

    def has_get_permissions(self, request, obj, *args, **kwargs):
        return True


class ApiDeleteMixin(ModelServiceMixin, object):
    def delete(self, request, *args, **kwargs):
        model_service = self.get_model_service()
        obj = model_service.get_obj(**kwargs)
        has_permissions = self.has_delete_permissions(request, obj, *args, **kwargs)
        if not has_permissions:
            return json_forbidden_response(json_data={}, msg=u"您没有操作权限")

        obj.delete()
        logger.info("delete model %s, model_id %s" % (obj.__class__.__name__, obj.id))
        return json_success_response(json_data={})

    def has_delete_permissions(self, request, obj, *args, **kwargs):
        return True


class ApiPutMixin(ModelServiceMixin, object):
    def put(self, request, *args, **kwargs):
        model_service = self.get_model_service()
        put_dict = json.loads(request.body)
        put_dict['request'] = request
        put_dict.update(kwargs)

        has_permissions = self.has_put_permissions(request, put_dict, *args, **kwargs)
        if not has_permissions:
            return json_error_response(json_data={}, msg=u"您没有访问权限")

        obj = model_service.update(**put_dict)
        json_data = {model_service.obj_name: model_service.obj_to_json(obj)}
        return json_success_response(json_data=json_data)

    def has_put_permissions(self, request, params, *args, **kwargs):
        return True


class ApiPermissionRequiredMixin(object):
    methods_check_permissions = ['GET', 'POST', 'PUT', 'DELETE', 'PATCH']
    methods_not_check_permissions = []

    def dispatch(self, request, *args, **kwargs):
        if self._method_need_check(request, *args, **kwargs):
            passed = self._check_permission(request, *args, **kwargs)
        else:
            passed = True
        if not passed:
            logger.error("permission denied", exc_info=True, extra={
                "request": request,
            })
            return json_forbidden_response({})
        return super(ApiPermissionRequiredMixin, self).dispatch(request, *args, **kwargs)

    def _check_permission(self, request, *args, **kwargs):
        return True
        # passed = False
        # user = request.user
        # if not user.is_authenticated():
        #     return passed
        #
        # if user.is_admin or user.is_superuser or user.is_seller:
        #     passed = True
        # return passed

    def _method_need_check(self, request, *args, **kwargs):
        method = request.method
        if method in self.methods_check_permissions and not (method in self.methods_not_check_permissions):
            return True
        else:
            return False
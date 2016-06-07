# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.http import HttpResponse
import json
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.views.generic import View as DjangoView
from django.views.generic.base import ContextMixin
import logging
import urllib
import urlparse

logger = logging.getLogger(__file__)


class View(DjangoView, ContextMixin):
    template_name = ""
    response_type = ""

    def dispatch(self, request, *args, **kwargs):
        return super(View, self).dispatch(request, *args, **kwargs)
        #if settings.DEBUG:
        #    return super(View, self).dispatch(request, *args, **kwargs)
        #try:
        #    response = super(View, self).dispatch(request, *args, **kwargs)
        #    return response
        #except Exception, err:
        #    logger.error(err.message)
        #    json_data = {
        #        "status": 500, "message": err.message
        #    }
        #    if self.template_name:
        #        return self.smart_response(request, json_data, change_template="500.html")
        #    else:
        #        return self.smart_response(request, json_data)

    def smart_response(self, requests, json_data, change_template=None, **kwargs):
        response_type = requests.GET.get("format", self.response_type)
        if response_type == "json" or not self.template_name:
            return json_response(json_data)
        elif self.template_name:
            if change_template:
                template = change_template
            else:
                template = self.template_name
            context_instance = RequestContext(requests)
            return render_to_response(template, json_data, context_instance=context_instance)
        else:
            context_instance = RequestContext(requests)
            return HttpResponse(json.dumps(json_data), context_instance=context_instance)

    def get(self, requests, *args, **kwargs):
        json_data = self.get_context_data(**kwargs)
        return self.smart_response(requests, json_data)


def json_response(json_data, **kwargs):
    data = json.dumps(json_data)
    return HttpResponse(data, content_type='application/json', **kwargs)


def update_url(url, **kwargs):
    url_parts = list(urlparse.urlparse(url))
    query = dict(urlparse.parse_qsl(url_parts[4]))
    query.update(kwargs)
    url_parts[4] = urllib.urlencode(query)
    return urlparse.urlunparse(url_parts)


def get_params(url):
    if "?" not in url:
        url = "?" + url
    url_parts = list(urlparse.urlparse(url))
    return dict(urlparse.parse_qsl(url_parts[4]))


def json_forbidden_response(json_data, msg="", info="", **kwargs):
    data = json_data
    common_response_data = {
        "status": 403,
        "msg": msg,
        "info": info,
        "data": data,
    }
    return HttpResponse(json.dumps(common_response_data), content_type='application/json', **kwargs)


def json_success_response(json_data, **kwargs):
    data = json_data
    common_response_data = {
        "status": 200,
        "msg": "ok",
        "info": "",
        "data": data,
    }
    return HttpResponse(json.dumps(common_response_data), content_type='application/json', **kwargs)


def json_error_response(json_data, msg="", info="", status=500, **kwargs):
    data = json_data
    common_response_data = {
        "status": status,
        "msg": msg,
        "info": info,
        "data": data,
    }
    return HttpResponse(json.dumps(common_response_data), content_type='application/json', **kwargs)
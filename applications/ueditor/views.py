# -*- coding: utf-8 -*-
# __author__ = chenchiyuan

from __future__ import division, unicode_literals, print_function
from django.http import HttpResponse
from django.core.files.base import ContentFile
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import View
from libs.images import detect_image_type
from libs.models.storages import UpyunStorage
from libs.hashs import md5


class ImageUploadView(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super(ImageUploadView, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        return HttpResponse("Success", content_type="Application/javascript")

    def post(self, request, *args, **kwargs):
        response = self.save_file_to_upYun(request.FILES['upfile'])
        return HttpResponse(response, content_type="Application/javascript")

    def save_file_to_upYun(self, file, path=''):
        storage = UpyunStorage()
        memory_file = file
        data = memory_file.read()
        image_type = detect_image_type(data)
        file_name = md5(data) + ".%s" % image_type
        storage.save(file_name, ContentFile(data))
        url = storage.url(file_name)
        response = "{'url':'"+url+"','title':'"+file_name+"','state':'SUCCESS'}"
        return response
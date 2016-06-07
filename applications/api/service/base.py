# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.db.models import Q
import copy
import logging
logger = logging.getLogger(__name__)


class FieldsCallbackMixin(object):
    transform_fields = {}

    def callback_fields(self, params):
        for field, callback in self.transform_fields.items():
            if field in params:
                params[field] = callback(params[field])


class ServiceBase(FieldsCallbackMixin, object):
    # 使用的model
    model = None

    # put时可更新的fields，为空则全部可以更新
    fields_can_update = []
    pop_fields = []

    # queryset page size
    page_size = 30

    # queryset输出时候的名字
    queryset_name = ""
    # obj输出时候的名字
    obj_name = ""

    # search_fields 使用q作为参数的search field
    search_fields = []
    search_keyword = "q"
    order_by = ""

    def __init__(self, **kwargs):
        self._total_count = 0
        self.kwargs = kwargs
        self.show_all = int(self.kwargs.pop("show_all", "0"))
        self.order_by = self.kwargs.pop("order_by", self.__class__.order_by)

    def make_queryset_json(self, queryset, page=1):
        total_count = queryset.count()
        queryset_page_slice = self.get_queryset(page=page, queryset=queryset)
        current_page = page
        pages = int((total_count+self.__class__.page_size-1)/self.__class__.page_size)
        if not pages:
            pages = 1
        else:
            pages = pages
        return {
            "total_count": total_count,
            "pages": pages,
            "current_page": current_page,
            "%s" % self.queryset_name: map(lambda item: self.obj_to_json(item), queryset_page_slice)
        }

    def get_queryset(self, page=1, queryset=None, *args, **kwargs):
        if queryset is None:
            queryset = self._get_filter_queryset()
        total_pages = self.get_total_pages()
        if self.show_all:
            return queryset

        if not type(page) in (int, float):
            page = 1
        if page < 1:
            page = 1
        elif page > total_pages:
            page = total_pages
        from_count = (page-1)*self.__class__.page_size
        to_count = page*self.__class__.page_size
        return queryset[from_count:to_count]

    def create(self, request, *args, **kwargs):
        self.callback_fields(kwargs)
        obj = self.__class__.model(**kwargs)
        obj.save()
        return obj

    def update(self, request, *args, **kwargs):
        obj_id = kwargs.pop("id", "")
        obj = self.get_obj(id=obj_id)
        self.callback_fields(kwargs)
        for key, value in kwargs.items():
            if key in self.fields_can_update or not self.fields_can_update:
                setattr(obj, key, value)
        obj.save()
        return obj

    def get_obj(self, id, *args, **kwargs):
        return self._get_filter_queryset().get(id=id)

    def get_queryset_all(self):
        return self.model.objects.all()

    def _get_filter_queryset(self):
        queryset_all = self.get_queryset_all()

        kwargs_clone = copy.deepcopy(self.kwargs)
        self.callback_fields(kwargs_clone)
        for pop_field in self.pop_fields:
            kwargs_clone.pop(pop_field, "")

        if self.search_keyword in kwargs_clone:
            q = kwargs_clone.pop(self.search_keyword)
        else:
            q = ""

        query = None
        if q and self.search_fields:
            for field in self.search_fields:
                if len(field) == 2:
                    real_field, field_callback = field
                    try:
                        real_q = field_callback(q)
                        gen_query = Q(**{"%s" % real_field: real_q})
                    except:
                        continue
                else:
                    gen_query = Q(**{"%s" % field: q})
                if not query:
                    query = gen_query
                else:
                    query = query | gen_query
            if query:
                queryset_all = queryset_all.filter(query)
        if kwargs_clone:
            queryset_all = queryset_all.filter(**kwargs_clone)
        if self.order_by:
            queryset_all = queryset_all.order_by(self.order_by)
        return queryset_all

    def get_total_count(self):
        if not self._total_count:
            self._total_count = self._get_filter_queryset().count()
        return self._total_count

    def get_total_pages(self):
        if self.show_all:
            return 1
        total_count = self.get_total_count()
        pages = int((total_count+self.__class__.page_size-1)/self.__class__.page_size)
        if not pages:
            return 1
        else:
            return pages

    def obj_to_json(self, obj):
        return obj.to_json()

    def bulk_delete(self, ids=[]):
        self.model.objects.filter(id__in=ids).delete()
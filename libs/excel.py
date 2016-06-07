# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function
from django.http import HttpResponse
from libs.datetimes import datetime_to_str, datetime_now


class ExcelHelper(object):
    @classmethod
    def write(cls, path, data, encoding="utf-8"):
        import xlwt
        workbook = xlwt.Workbook(encoding)
        worksheet = workbook.add_sheet('sheet1')

        for i, line in enumerate(data):
            for j, text in enumerate(line):
                worksheet.write(i, j, label=text)
        workbook.save(path)

    @classmethod
    def read(cls, path, from_row=1, from_content=0):
        import xlrd
        workbook = xlrd.open_workbook(path)
        sheet = workbook.sheets()[0]
        lines = []
        for row in range(from_row, sheet.nrows):
            line = []
            for content in range(from_content, sheet.ncontents):
                line.append(sheet.cell(row, content).value)
            lines.append(line)
        return lines


def to_excel(modeladmin, request, queryset):
    response = HttpResponse(mimetype='application/ms-excel')
    fields = modeladmin.list_display
    model = modeladmin.model._meta
    response['Content-Disposition'] = 'attachment;filename=%s.xls' % datetime_to_str(datetime_now())
    row_data = []
    header_name = []
    model_data = []

    for header in fields:
        if hasattr(modeladmin, header) and hasattr(getattr(modeladmin, header), 'short_description'):
            name = getattr(getattr(modeladmin, header), 'short_description')
            header_name.append(name)
        else:
            field = model.get_field_by_name(header)
            if field and field[0].verbose_name:
                name = field[0].verbose_name
            else:
                name = header
            model_data.append(name)
            header_name.append(name)

    row_data.append(header_name)

    for row in queryset:
        line = []
        for content in fields:
            if hasattr(row, 'get_%s_display' % content):
                data = eval('row.get_' + content + '_display()')
            elif hasattr(row, content):
                data = getattr(row, content)
            elif hasattr(modeladmin, content):
                data = getattr(modeladmin, content)(row)

            if callable(data):
                content_data = data()
                line.append(unicode(content_data))
            else:
                line.append(unicode(data))
        row_data.append(line)
    ExcelHelper.write(response, row_data)
    return response
to_excel.short_description = u'导出excel'

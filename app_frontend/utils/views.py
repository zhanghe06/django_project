#!/usr/bin/env python
# encoding: utf-8

"""
@author: zhanghe
@software: PyCharm
@file: views.py
@time: 2017/10/23 下午3:43
"""

from django.views.generic.base import TemplateResponseMixin


class CSVTemplateResponseMixin(TemplateResponseMixin):
    """
    A mixin that can be used to render a template.
    """
    content_type = 'text/csv'
    # TODO: csv_file_name = 'csv_file_name'
    # response['Content-Disposition'] = 'attachment; filename="%S.csv" % self.csv_file_name'

    def render_to_response(self, context, **response_kwargs):
        """
        Returns a response, using the `response_class` for this
        view, with a template rendered with the given context.

        If any keyword arguments are provided, they will be
        passed to the constructor of the response class.
        """
        response_kwargs.setdefault('content_type', self.content_type)
        return self.response_class(
            request=self.request,
            template=self.get_template_names(),
            context=context,
            using=self.template_engine,
            **response_kwargs
        )

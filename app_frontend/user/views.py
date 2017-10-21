from django.shortcuts import render

# Create your views here.

from django.views import generic
from django.views.generic.list import BaseListView

from app_frontend.utils.views import CSVTemplateResponseMixin
from .models import User


class IndexView(generic.ListView):
    template_name = 'user/index.html'
    context_object_name = 'latest_user_list'

    def get_queryset(self):
        return User.objects.order_by('-time_create')[:5]


class CsvView(CSVTemplateResponseMixin, BaseListView):
    template_name = 'user/csv.html'
    context_object_name = 'csv_data'

    def get_queryset(self):
        return User.objects.order_by('-time_create')


class DetailView(generic.DetailView):
    model = User
    template_name = 'user/detail.html'  # default: user/user_detail.html



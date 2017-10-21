from django.conf.urls import url

from . import views

app_name = 'user'

urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^csv/$', views.CsvView.as_view(), name='csv'),
    url(r'^(?P<pk>[0-9]+)/$', views.DetailView.as_view(), name='detail'),
]

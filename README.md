## Django

安装环境依赖
```bash
virtualenv -p `which python3` django.env
source django.env/bin/activate
pip install django
pip freeze > requirements.txt
```

```bash
pip install django
pip install mysqlclient
```

```bash
sudo apt-get install python3-dev libmysqlclient-dev
```

查看 django-admin 版本
```bash
django-admin.py --version
1.11.5
django-admin --version
1.11.5
```

扩展安装
```bash
pip install django-crispy-forms
```

创建项目
```bash
django-admin startproject app_frontend
django-admin startproject app_backend
```

自动生成模型

https://docs.djangoproject.com/en/1.11/howto/legacy-databases/
```bash
cd app_frontend
python manage.py inspectdb > ../db/models.py
```
注意：这种方式下生成的 model 中 Meta 类属性 managed = False, 即不能反过来从 model 生成数据库

启动项目
```bash
cd app_frontend
python manage.py runserver 0.0.0.0:8100
cd app_backend
python manage.py runserver 0.0.0.0:8200
```

可以忽略 "You have 13 unapplied migration(s)." 的警告;
也可以执行:
```bash
python manage.py migrate
```

创建应用程序
```bash
python manage.py startapp user
python manage.py startapp user_auth
python manage.py startapp user_profile
python manage.py startapp user_bank
```

分别修改对应模块下的 views.py 和 urls.py

app_frontend/app_frontend/settings.py
```
ALLOWED_HOSTS = ['*', ]

INSTALLED_APPS = [
    # ...
    'user',
    'user_auth',
    'user_bank',
    'user_profile',
]
```

app_frontend/app_frontend/urls.py
```
urlpatterns = [
    url(r'^user/', include('user.urls')),
    url(r'^user_auth/', include('user_auth.urls')),
    url(r'^user_bank/', include('user_bank.urls')),
    url(r'^user_profile/', include('user_profile.urls')),
    url(r'^admin/', admin.site.urls),
]
```

根据模型建表（可选，不推荐）
```bash
python manage.py makemigrations user    # 生成 app_frontend/user/migrations/0001_initial.py
python manage.py sqlmigrate user 0001   # 生成建表语句 执行之前, 0001_initial.py 修改属性 'managed': True
python manage.py check                  # 检查（可选）
python manage.py migrate                # 执行建表
```

## Django

[![Build Status](https://travis-ci.org/zhanghe06/django_project.svg?branch=master)](https://travis-ci.org/zhanghe06/django_project)

[![Coverage Status](https://coveralls.io/repos/github/zhanghe06/django_project/badge.svg?branch=master)](https://coveralls.io/github/zhanghe06/django_project?branch=master)

安装环境依赖
```
$ virtualenv -p `which python3` django.env
$ source django.env/bin/activate
$ pip install django
$ pip freeze > requirements.txt
```

```
$ pip install django
$ pip install mysqlclient
```

```
$ sudo apt-get install python3-dev libmysqlclient-dev
```

查看 django-admin 版本
```
$ django-admin.py --version
1.11.5
$ django-admin --version
1.11.5
```

扩展安装
```
$ pip install django-crispy-forms
```

创建项目
```
$ django-admin startproject app_frontend
$ django-admin startproject app_backend
```

自动生成模型

https://docs.djangoproject.com/en/1.11/howto/legacy-databases/
```
$ cd app_frontend
$ python manage.py inspectdb > ../db/models.py
```
注意：这种方式下生成的 model 中 Meta 类属性 managed = False, 即不能反过来从 model 生成数据库

启动项目
```
$ cd app_frontend
$ python manage.py runserver 0.0.0.0:8100
$ cd app_backend
$ python manage.py runserver 0.0.0.0:8200
```

可以忽略 "You have 13 unapplied migration(s)." 的警告;
也可以执行:
```
$ python manage.py migrate
```

创建应用程序
```
$ python manage.py startapp user
$ python manage.py startapp user_auth
$ python manage.py startapp user_profile
$ python manage.py startapp user_bank
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
```
$ python manage.py makemigrations user    # 生成 app_frontend/user/migrations/0001_initial.py
$ python manage.py sqlmigrate user 0001   # 生成建表语句 执行之前, 0001_initial.py 修改属性 'managed': True
$ python manage.py check                  # 检查（可选）
$ python manage.py migrate                # 执行建表
```

交互模式
```
$ python manage.py shell
Python 3.6.2 (default, Jul 17 2017, 16:44:45)
[GCC 4.2.1 Compatible Apple LLVM 8.1.0 (clang-802.0.42)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>> from user.models import User
>>> User.objects.all()
<QuerySet [<User: User object>, <User: User object>, <User: User object>, <User: User object>, <User: User object>]>
```


创建后台管理
```
$ python manage.py createsuperuser
Username (leave blank to use 'zhanghe'): admin
Email address: admin@example.com
Password: 1234!@#$
Password (again): 1234!@#$
Superuser created successfully.
```

```
$ python manage.py runserver 0.0.0.0:8100
```

管理地址: http://127.0.0.1:8100/admin/
Username: admin
Password: 1234!@#$

登录后发现只有 Groups 和 Users, 我们自定义的模块并没有显示


接着将所需的模块注册管理接口

例如: app_frontend/user/admin.py
```
from django.contrib import admin

# Register your models here.

from .models import User

admin.site.register(User)
```
被注册的模块将显示在管理页面

问题又来了, 列表点进去, 仅仅显示 (Xxx object), 需要换成可读的名称:
需要在 model 类中定义`__str__`方法, 如果是 py2, 则是需要定义`__unicode__`

### 单元测试

注意事项:

单元测试需要创建测试数据库, 需要保证 model 中 Meta 类属性 managed = True

生成 migrations 初始化脚本
```
$ python manage.py makemigrations user
```

执行测试, 以 user 为例:
```
$ python manage.py test user                                            # 测试整个 user app
$ python manage.py test user.tests.UserIndexViewTests                   # 测试 user app 下所有 UserIndexViewTests 测试用例
$ python manage.py test user.tests.UserIndexViewTests.test_user_index   # 测试具体用例的某个方法
```

可选项

-k 保留测试数据

### 代码覆盖率

安装
```
$ pip install coverage
```

测试
```
$ coverage run --source='.' manage.py test user
$ coverage report
Name                                  Stmts   Miss  Cover
---------------------------------------------------------
app_frontend/__init__.py                  0      0   100%
app_frontend/settings.py                 21      0   100%
app_frontend/urls.py                      3      0   100%
app_frontend/wsgi.py                      4      4     0%
manage.py                                13      6    54%
user/__init__.py                          0      0   100%
user/admin.py                             3      0   100%
user/apps.py                              3      3     0%
user/migrations/0001_initial.py           6      0   100%
user/migrations/__init__.py               0      0   100%
user/models.py                           17      1    94%
user/tests.py                             6      0   100%
user/urls.py                              4      0   100%
user/views.py                            15      0   100%
user_auth/__init__.py                     0      0   100%
user_auth/admin.py                        3      0   100%
user_auth/apps.py                         3      3     0%
user_auth/migrations/__init__.py          0      0   100%
user_auth/models.py                      15      1    93%
user_auth/tests.py                        1      1     0%
user_auth/urls.py                         3      0   100%
user_auth/views.py                        4      1    75%
user_bank/__init__.py                     0      0   100%
user_bank/admin.py                        3      0   100%
user_bank/apps.py                         3      3     0%
user_bank/migrations/__init__.py          0      0   100%
user_bank/models.py                      15      0   100%
user_bank/tests.py                        1      1     0%
user_bank/urls.py                         3      0   100%
user_bank/views.py                        4      1    75%
user_profile/__init__.py                  0      0   100%
user_profile/admin.py                     3      0   100%
user_profile/apps.py                      3      3     0%
user_profile/migrations/__init__.py       0      0   100%
user_profile/models.py                   15      0   100%
user_profile/tests.py                     1      1     0%
user_profile/urls.py                      3      0   100%
user_profile/views.py                     4      1    75%
---------------------------------------------------------
TOTAL                                   182     30    84%
```

运行服务后, 如果出现 `You have 1 unapplied migration(s).You have 1 unapplied migration(s).` 警告, 处理方式:

user/migrations/0001_initial.py 设置 'managed': False
```
$ python manage.py migrate
```
user/migrations/0001_initial.py 还原 'managed': True

再重启服务, 警告消失


## github 代码覆盖率

https://coveralls.io

https://travis-ci.org

http://docs.coveralls.io/

https://docs.travis-ci.com/user/getting-started/
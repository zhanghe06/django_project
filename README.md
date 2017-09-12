## Django

安装环境依赖
```bash
virtualenv -p `which python3` django.env
source django.env/bin/activate
pip install django
pip freeze > requirements.txt
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

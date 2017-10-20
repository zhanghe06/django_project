# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class User(models.Model):
    status_activate = models.IntegerField()
    status_lock = models.IntegerField()
    status_real_name = models.IntegerField()
    status_delete = models.IntegerField()
    time_activate = models.DateTimeField(blank=True, null=True)
    time_lock = models.DateTimeField(blank=True, null=True)
    time_real_name = models.DateTimeField(blank=True, null=True)
    time_delete = models.DateTimeField(blank=True, null=True)
    time_create = models.DateTimeField()
    time_update = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'user'


class UserAuth(models.Model):
    user_id = models.IntegerField()
    type_auth = models.IntegerField()
    auth_key = models.CharField(max_length=60)
    auth_secret = models.CharField(max_length=60)
    status_verified_auth = models.IntegerField()
    time_create = models.DateTimeField()
    time_update = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'user_auth'
        unique_together = (('type_auth', 'auth_key'),)


class UserBank(models.Model):
    user_id = models.IntegerField()
    bank_name = models.CharField(max_length=60)
    bank_address = models.CharField(max_length=60)
    bank_account = models.CharField(max_length=32)
    status_default = models.IntegerField()
    status_verified_bank = models.IntegerField()
    time_default = models.DateTimeField(blank=True, null=True)
    time_verified_bank = models.DateTimeField(blank=True, null=True)
    time_create = models.DateTimeField()
    time_update = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'user_bank'


class UserProfile(models.Model):
    user_id = models.IntegerField(primary_key=True)
    user_pid = models.IntegerField()
    nickname = models.CharField(max_length=20)
    type_level = models.IntegerField()
    avatar_url = models.CharField(max_length=60, blank=True, null=True)
    birthday = models.DateField()
    real_name = models.CharField(max_length=20)
    id_card = models.CharField(max_length=32)
    time_create = models.DateTimeField()
    time_update = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'user_profile'

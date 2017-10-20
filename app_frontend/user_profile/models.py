from django.db import models

# Create your models here.


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

from django.db import models

# Create your models here.


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

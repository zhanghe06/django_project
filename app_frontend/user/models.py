from django.db import models

# Create your models here.


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
        managed = True
        db_table = 'user'

    def __str__(self):
        return str(self.id)

from django.db import models

# Create your models here.


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

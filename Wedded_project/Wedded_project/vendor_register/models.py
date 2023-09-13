from django.db import models

# Create your models here.
class Vendor(models.Model):
    vendor_id = models.AutoField(primary_key=True)
    vendor_name = models.CharField(max_length=45)
    phone_no = models.IntegerField()
    email = models.CharField(max_length=50)
    city = models.CharField(max_length=45)
    password_1 = models.CharField(max_length=30)
    password_2 = models.CharField(max_length=30)
    district = models.CharField(max_length=20)
    state = models.CharField(max_length=20)

    class Meta:
        # managed = False
        db_table = 'vendor'


from django.db import models
from vendor_register.models import Vendor
# Create your models here.
class Service(models.Model):
    service_id = models.AutoField(primary_key=True)
    vendor_id = models.IntegerField()
    about = models.CharField(max_length=4500)
    services = models.CharField(max_length=1000)
    category = models.CharField(max_length=60)
    location = models.CharField(max_length=150)
    district = models.CharField(max_length=150)
    package = models.CharField(max_length=150)
    business_name = models.CharField(max_length=40)
    any_link = models.CharField(max_length=500)
    cost = models.IntegerField()

    class Meta:
        # managed = False
        db_table = 'service'



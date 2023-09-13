from django.db import models

# Create your models here.
class Package(models.Model):
    package_id = models.AutoField(primary_key=True)
    package_name = models.CharField(max_length=45)
    description = models.CharField(max_length=4500)
    cost = models.IntegerField()

    class Meta:
        # managed = False
        db_table = 'package'

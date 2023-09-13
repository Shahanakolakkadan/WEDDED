from django.db import models

# Create your models here.
class PreviousWork(models.Model):
    previous_id = models.AutoField(primary_key=True)
    file = models.CharField(max_length=500)
    file_type = models.CharField(max_length=45)
    package_id = models.IntegerField()
    vendor_id = models.IntegerField()

    class Meta:
        # managed = False
        db_table = 'previous_work'

from django.db import models
from service.models import Service

# Create your models here.
class Shortlist(models.Model):
    shrt_id = models.AutoField(primary_key=True)
    # ser_id = models.IntegerField()
    ser=models.ForeignKey(Service,on_delete=models.CASCADE)
    u_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'shortlist'

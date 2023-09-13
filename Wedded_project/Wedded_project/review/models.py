from django.db import models

# Create your models here.
class Review(models.Model):
    review_id = models.AutoField(primary_key=True)
    review_date = models.DateField()
    description = models.CharField(max_length=250)
    rating = models.CharField(max_length=25)
    user_id = models.IntegerField()
    vendor_id = models.IntegerField()

    class Meta:
        # managed = False
        db_table = 'review'

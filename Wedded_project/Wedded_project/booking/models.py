from django.db import models

# Create your models here.
class Booking(models.Model):
    booking_id = models.AutoField(primary_key=True)
    booking_date = models.DateField()
    booking_time = models.TimeField()
    name = models.CharField(max_length=45)
    phone_no = models.CharField(max_length=20)
    email = models.CharField(max_length=45)
    function_date = models.DateField()
    details = models.CharField(db_column='Details', max_length=1000)  # Field name made lowercase.
    user_id = models.IntegerField()
    vendor_id = models.IntegerField()
    status = models.CharField(max_length=15)

    class Meta:
        # managed = False
        db_table = 'booking'




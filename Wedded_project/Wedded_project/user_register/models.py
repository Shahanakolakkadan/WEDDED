from django.db import models

# Create your models here.
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=45)
    first_name = models.CharField(max_length=45)
    last_name = models.CharField(max_length=45)
    phone_no = models.IntegerField()
    email = models.CharField(max_length=50)
    wedding_date = models.DateField()
    role = models.CharField(max_length=20)
    district = models.CharField(max_length=20)
    city = models.CharField(max_length=30)
    state = models.CharField(max_length=20)
    password_1 = models.CharField(max_length=30)
    password_2 = models.CharField(max_length=30)

    class Meta:
        # managed = False
        db_table = 'user'


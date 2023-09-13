# Generated by Django 3.2.16 on 2023-04-12 07:34

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Package',
            fields=[
                ('package_id', models.AutoField(primary_key=True, serialize=False)),
                ('package_name', models.CharField(max_length=45)),
                ('description', models.CharField(max_length=4500)),
                ('cost', models.IntegerField()),
            ],
            options={
                'db_table': 'package',
            },
        ),
    ]

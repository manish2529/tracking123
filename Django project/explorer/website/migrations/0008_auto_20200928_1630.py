# Generated by Django 3.0.5 on 2020-09-28 11:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('website', '0007_gallery'),
    ]

    operations = [
        migrations.AddField(
            model_name='customer',
            name='contact_no',
            field=models.CharField(default='0', max_length=10),
        ),
        migrations.AddField(
            model_name='customer',
            name='dob',
            field=models.DateField(default='1998-07-06'),
        ),
    ]

# Generated by Django 3.1.2 on 2020-11-01 15:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('website', '0014_auto_20201101_2033'),
    ]

    operations = [
        migrations.AddField(
            model_name='customer',
            name='bill_city',
            field=models.CharField(max_length=30, null=True),
        ),
    ]
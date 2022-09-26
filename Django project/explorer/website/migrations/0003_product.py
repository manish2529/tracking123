# Generated by Django 3.0.5 on 2020-09-10 04:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('website', '0002_customer_is_block'),
    ]

    operations = [
        migrations.CreateModel(
            name='product',
            fields=[
                ('p_id', models.AutoField(primary_key=True, serialize=False)),
                ('p_name', models.CharField(default='', max_length=20)),
                ('p_price', models.IntegerField(max_length=5)),
                ('p_desc', models.TextField(max_length=250, null=True)),
                ('cat_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='website.category')),
            ],
        ),
    ]
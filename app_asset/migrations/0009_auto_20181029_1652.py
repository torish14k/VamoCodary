# Generated by Django 2.1.1 on 2018-10-29 08:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_asset', '0008_auto_20181016_1527'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='host',
            name='host_status',
        ),
        migrations.AddField(
            model_name='hostdetail',
            name='host_status',
            field=models.CharField(max_length=32, null=True),
        ),
    ]
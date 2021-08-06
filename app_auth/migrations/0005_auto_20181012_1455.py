# Generated by Django 2.1.1 on 2018-10-12 06:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_asset', '0001_initial'),
        ('app_code', '0009_auto_20181010_2034'),
        ('app_auth', '0004_perms_perms_url'),
    ]

    operations = [
        migrations.AddField(
            model_name='role',
            name='asset',
            field=models.ManyToManyField(to='app_asset.HostGroup'),
        ),
        migrations.AddField(
            model_name='role',
            name='project',
            field=models.ManyToManyField(to='app_code.Project'),
        ),
    ]

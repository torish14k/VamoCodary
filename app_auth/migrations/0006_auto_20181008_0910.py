# Generated by Django 2.1.1 on 2018-10-08 01:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app_auth', '0005_auto_20181007_1159'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='menus',
            name='menus_perms',
        ),
        migrations.AddField(
            model_name='perms',
            name='menus',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='app_auth.Menus'),
            preserve_default=False,
        ),
    ]

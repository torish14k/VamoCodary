# Generated by Django 2.1.1 on 2018-12-27 07:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('app_auth', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='OpsLog',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('host_ip', models.CharField(max_length=32)),
                ('hostname', models.CharField(max_length=64, null=True)),
                ('user_name', models.CharField(max_length=64)),
                ('start_time', models.CharField(max_length=64)),
                ('audit_log', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='TaskRecord',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('task_name', models.CharField(max_length=32)),
                ('task_id', models.CharField(max_length=64)),
                ('task_result', models.TextField(null=True)),
                ('status', models.CharField(max_length=32)),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('task_user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app_auth.User')),
            ],
        ),
        migrations.CreateModel(
            name='UserLog',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_name', models.CharField(max_length=32)),
                ('ready_name', models.CharField(max_length=32)),
                ('url_title', models.CharField(max_length=64)),
                ('status', models.CharField(max_length=32)),
                ('create_time', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]

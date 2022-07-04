# Generated by Django 2.1.1 on 2018-12-27 07:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('app_code', '0001_initial'),
        ('app_asset', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Key',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('key_isa', models.TextField(null=True)),
                ('key_isa_pub', models.TextField(null=True)),
                ('key_msg', models.CharField(max_length=64, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Menus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('menu_title', models.CharField(max_length=64)),
                ('menu_url', models.CharField(max_length=64, unique=True)),
                ('menu_type', models.CharField(max_length=64)),
                ('pmenu_id', models.CharField(max_length=64, null=True)),
                ('menu_num', models.CharField(max_length=32, null=True)),
                ('menu_icon', models.CharField(max_length=256, null=True)),
                ('menu_order', models.CharField(max_length=32, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Perms',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('perms_title', models.CharField(max_length=128)),
                ('perms_req', models.CharField(max_length=64)),
                ('perms_url', models.CharField(max_length=64, null=True, unique=True)),
                ('menus', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app_auth.Menus')),
            ],
        ),
        migrations.CreateModel(
            name='RemoteUser',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('lg_user', models.CharField(max_length=64, unique=True)),
                ('lg_passwd', models.CharField(max_length=256, null=True)),
                ('lg_key', models.TextField(null=True)),
                ('lg_key_pass', models.TextField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Role',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('role_title', models.CharField(max_length=64, unique=True)),
                ('role_msg', models.CharField(max_length=128, null=True)),
                ('host', models.ManyToManyField(to='app_asset.Host')),
                ('menu', models.ManyToManyField(to='app_auth.Menus')),
                ('netwk', models.ManyToManyField(to='app_asset.Netwk')),
                ('perms', models.ManyToManyField(to='app_auth.Perms')),
                ('project', models.ManyToManyField(to='app_code.GitCode')),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_name', models.CharField(max_length=32, unique=True)),
                ('ready_name', models.CharField(max_length=64, null=True)),
                ('passwd', models.CharField(max_length=256, null=True)),
                ('email', models.CharField(max_length=64, null=True)),
                ('phone', models.CharField(max_length=128, null=True)),
                ('img', models.ImageField(null=True, upload_to='img')),
                ('status', models.CharField(default='离线', max_length=64)),
                ('creat_time', models.DateTimeField(auto_now_add=True)),
                ('last_login', models.DateTimeField(auto_now=True)),
                ('role', models.ManyToManyField(to='app_auth.Role')),
            ],
        ),
        migrations.AddField(
            model_name='remoteuser',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app_auth.User'),
        ),
        migrations.AddField(
            model_name='key',
            name='user',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='app_auth.User'),
        ),
    ]

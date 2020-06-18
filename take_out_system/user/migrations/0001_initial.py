# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2019-11-09 08:22
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_name', models.CharField(max_length=30, verbose_name='用户名')),
                ('user_address', models.CharField(max_length=100, verbose_name='用户地址')),
                ('user_phone', models.CharField(max_length=20, verbose_name='手机号')),
                ('is_member', models.BooleanField(default=False, verbose_name='是否为会员')),
            ],
            options={
                'verbose_name': '用户',
                'verbose_name_plural': '用户',
                'db_table': 'user',
            },
        ),
    ]

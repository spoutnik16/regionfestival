# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):
    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('crm', '0003_auto_20140925_1012'),
    ]

    operations = [
        migrations.CreateModel(
            name='DeprecatedUser',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('phone', models.CharField(max_length=50, verbose_name='numéro de téléphone', blank=True, null=True)),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL, verbose_name='commune', blank=True, null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.DeleteModel(
            name='Utilisateur2',
        ),
        migrations.RemoveField(
            model_name='customuser',
            name='user',
        ),
    ]

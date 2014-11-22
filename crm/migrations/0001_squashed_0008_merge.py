# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    replaces = [('crm', '0001_initial'), ('crm', '0002_utilisateur'), ('crm', '0003_auto_20140925_1012'), ('crm', '0004_auto_20140925_1014'), ('crm', '0005_customuser_user'), ('crm', '0006_auto_20140925_1015'), ('crm', '0007_auto_20141121_1511'), ('crm', '0007_auto_20141121_1507'), ('crm', '0008_merge')]

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='CustomUser',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('phone', models.CharField(null=True, verbose_name='numéro de téléphone', blank=True, max_length=50)),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL, blank=True, null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AlterModelOptions(
            name='customuser',
            options={'verbose_name_plural': 'profiles', 'verbose_name': 'profile'},
        ),
        migrations.AlterField(
            model_name='customuser',
            name='user',
            field=models.OneToOneField(to=settings.AUTH_USER_MODEL, blank=True, null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='customuser',
            name='user',
            field=models.OneToOneField(to=settings.AUTH_USER_MODEL, blank=True, null=True),
            preserve_default=True,
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):
    dependencies = [
        ('crm', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Utilisateur',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('phone', models.CharField(max_length=50, blank=True, null=True, verbose_name='numéro de téléphone')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]

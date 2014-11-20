# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0005_categoriespectacle_slug'),
    ]

    operations = [
        migrations.CreateModel(
            name='FestivalDays',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', auto_created=True, serialize=False)),
                ('day', models.DateField()),
                ('count', models.IntegerField()),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0007_festivaldays_festival'),
    ]

    operations = [
        migrations.CreateModel(
            name='FestivalDay',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('day', models.DateField()),
                ('count', models.IntegerField(null=True, blank=True)),
                ('festival', models.ForeignKey(null=True, blank=True, to='spectacles.Festival')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.RemoveField(
            model_name='festivaldays',
            name='festival',
        ),
        migrations.DeleteModel(
            name='FestivalDays',
        ),
    ]

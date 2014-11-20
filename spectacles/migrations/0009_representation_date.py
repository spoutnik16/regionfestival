# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.datetime_safe


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0008_auto_20141115_1052'),
    ]

    operations = [
        migrations.AddField(
            model_name='representation',
            name='date',
            field=models.DateField(default=django.utils.datetime_safe.date.today),
            preserve_default=False,
        ),
    ]

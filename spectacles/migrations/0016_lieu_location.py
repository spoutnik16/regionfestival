# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0015_categoriespectacle_main'),
    ]

    operations = [
        migrations.AddField(
            model_name='lieu',
            name='location',
            field=django.contrib.gis.db.models.fields.PointField(srid=4326, null=True, verbose_name='Accès', help_text='Cliquez sur la carte', blank=True),
            preserve_default=True,
        ),
    ]

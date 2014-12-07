# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0016_lieu_location'),
    ]

    operations = [
        migrations.RenameField(
            model_name='lieu',
            old_name='lat',
            new_name='latitude',
        ),
        migrations.RenameField(
            model_name='lieu',
            old_name='long',
            new_name='longitude',
        ),
        migrations.RemoveField(
            model_name='lieu',
            name='location',
        ),
        migrations.AddField(
            model_name='lieu',
            name='in_geom',
            field=django.contrib.gis.db.models.fields.PointField(verbose_name='shp', null=True, blank=True, srid=4326, help_text='Cliquez sur la carte'),
            preserve_default=True,
        ),
    ]

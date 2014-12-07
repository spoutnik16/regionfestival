# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0014_auto_20141122_1035'),
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
        migrations.AddField(
            model_name='categoriespectacle',
            name='main',
            field=models.BooleanField(default=False, help_text='apparaît comme catégorie principale'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='lieu',
            name='in_geom',
            field=django.contrib.gis.db.models.fields.PointField(verbose_name='shp', srid=4326, null=True, blank=True, help_text='Cliquez sur la carte'),
            preserve_default=True,
        ),
    ]

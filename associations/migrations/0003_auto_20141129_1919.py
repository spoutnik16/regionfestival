# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('associations', '0002_region_boundaries'),
    ]

    operations = [
        migrations.AlterField(
            model_name='region',
            name='boundaries',
            field=django.contrib.gis.db.models.fields.MultiPolygonField(null=True, srid=4326, blank=True),
            preserve_default=True,
        ),
    ]

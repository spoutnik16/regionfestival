# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('associations', '0004_auto_20141129_1922'),
    ]

    operations = [
        migrations.AddField(
            model_name='regionchild',
            name='boundaries',
            field=django.contrib.gis.db.models.fields.MultiPolygonField(srid=4326, blank=True, null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='regionchild2',
            name='boundaries',
            field=django.contrib.gis.db.models.fields.MultiPolygonField(srid=4326, blank=True, null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='region',
            name='boundaries',
            field=django.contrib.gis.db.models.fields.MultiPolygonField(srid=4326, blank=True, null=True),
            preserve_default=True,
        ),
    ]

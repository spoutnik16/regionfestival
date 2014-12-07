# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('associations', '0001_squashed_0004_auto_20141118_1455'),
    ]

    operations = [
        migrations.AddField(
            model_name='region',
            name='boundaries',
            field=django.contrib.gis.db.models.fields.MultiPolygonField(null=True, blank=True, srid=4326),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='regionchild',
            name='boundaries',
            field=django.contrib.gis.db.models.fields.MultiPolygonField(null=True, blank=True, srid=4326),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='regionchild2',
            name='boundaries',
            field=django.contrib.gis.db.models.fields.MultiPolygonField(null=True, blank=True, srid=4326),
            preserve_default=True,
        ),
    ]

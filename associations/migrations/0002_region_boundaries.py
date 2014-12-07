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
            field=django.contrib.gis.db.models.fields.PolygonField(srid=4326, null=True, blank=True),
            preserve_default=True,
        ),
    ]

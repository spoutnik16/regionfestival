# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):
    dependencies = [
        ('associations', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='association',
            name='region_child2',
            field=models.ForeignKey(to='associations.RegionChild2', blank=True, null=True, default=None),
        ),
    ]

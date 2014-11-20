# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0006_festivaldays'),
    ]

    operations = [
        migrations.AddField(
            model_name='festivaldays',
            name='festival',
            field=models.ForeignKey(blank=True, to='spectacles.Festival', null=True),
            preserve_default=True,
        ),
    ]

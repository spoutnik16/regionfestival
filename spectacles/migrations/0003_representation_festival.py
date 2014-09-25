# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):
    dependencies = [
        ('spectacles', '0002_auto_20140924_1209'),
    ]

    operations = [
        migrations.AddField(
            model_name='representation',
            name='festival',
            field=models.ManyToManyField(null=True, verbose_name='festival auquel participe le spectacle', blank=True,
                                         to='spectacles.Festival'),
            preserve_default=True,
        ),
    ]

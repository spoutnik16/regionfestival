# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0013_auto_20141122_1034'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='spectacle',
            options={'verbose_name_plural': 'spectacles', 'verbose_name': 'spectacle'},
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0012_auto_20141118_1452'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='spectacle',
            options={'verbose_name_plural': 'spectacles', 'verbose_name': 'spectacle', 'permissions': (('change_spectacle', 'Modifier le spectacle'),)},
        ),
    ]

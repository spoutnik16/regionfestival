# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0014_auto_20141122_1035'),
    ]

    operations = [
        migrations.AddField(
            model_name='categoriespectacle',
            name='main',
            field=models.BooleanField(default=False, help_text='apparaît comme catégorie principale'),
            preserve_default=True,
        ),
    ]

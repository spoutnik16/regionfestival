# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0004_auto_20140925_1506'),
    ]

    operations = [
        migrations.AddField(
            model_name='categoriespectacle',
            name='slug',
            field=models.SlugField(max_length=40, help_text='nom formaté pour les URLs', null=True, blank=True),
            preserve_default=True,
        ),
    ]

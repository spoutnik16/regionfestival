# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0010_auto_20141118_1327'),
    ]

    operations = [
        migrations.AlterField(
            model_name='spectacle',
            name='slug',
            field=models.SlugField(null=True, blank=True, help_text='nom formaté pour les URLs'),
        ),
    ]

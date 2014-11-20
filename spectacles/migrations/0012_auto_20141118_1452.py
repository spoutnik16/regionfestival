# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0011_auto_20141118_1429'),
    ]

    operations = [
        migrations.AddField(
            model_name='artiste',
            name='slug',
            field=models.SlugField(null=True, help_text='nom formaté pour les URLs', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='festival',
            name='slug',
            field=models.SlugField(max_length=40, null=True, help_text='nom formaté pour les URLs', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='lieu',
            name='slug',
            field=models.SlugField(null=True, help_text='nom formaté pour les URLs', blank=True),
            preserve_default=True,
        ),
    ]

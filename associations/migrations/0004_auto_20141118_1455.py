# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('associations', '0003_auto_20141108_1032'),
    ]

    operations = [
        migrations.AddField(
            model_name='association',
            name='slug',
            field=models.SlugField(blank=True, help_text='nom formaté pour les URLs', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='region',
            name='slug',
            field=models.SlugField(blank=True, help_text='nom formaté pour les URLs', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='regionchild',
            name='slug',
            field=models.SlugField(blank=True, help_text='nom formaté pour les URLs', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='regionchild2',
            name='slug',
            field=models.SlugField(blank=True, help_text='nom formaté pour les URLs', null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='categorieassociation',
            name='slug',
            field=models.SlugField(blank=True, help_text='nom formaté pour les URLs', null=True),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):
    dependencies = [
        ('associations', '0002_auto_20140925_1031'),
    ]

    operations = [
        migrations.AddField(
            model_name='categorieassociation',
            name='region_child2',
            field=models.ForeignKey(help_text="commune d'origine", verbose_name='commune', blank=True,
                                    to='associations.RegionChild2', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='categorieassociation',
            name='slug',
            field=models.SlugField(max_length=40, blank=True, help_text='nom formaté pour les URLs', null=True),
            preserve_default=True,
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('spectacles', '0009_representation_date'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='festivalday',
            name='festival',
        ),
        migrations.DeleteModel(
            name='FestivalDay',
        ),
        migrations.AddField(
            model_name='spectacle',
            name='slug',
            field=models.SlugField(help_text='nom formaté pour les URLs', null=True, max_length=80, blank=True),
            preserve_default=True,
        ),
    ]

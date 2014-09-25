# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):
    dependencies = [
        ('spectacles', '0003_representation_festival'),
    ]

    operations = [
        migrations.AlterField(
            model_name='spectacle',
            name='photo',
            field=models.ImageField(upload_to='images-spectacle', blank=True, verbose_name='image', null=True),
        ),
    ]

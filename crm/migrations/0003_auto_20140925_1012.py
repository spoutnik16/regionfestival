# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ('crm', '0002_utilisateur'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Utilisateur',
            new_name='Utilisateur2',
        ),
    ]

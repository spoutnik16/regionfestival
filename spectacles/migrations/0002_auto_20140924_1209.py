# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):
    dependencies = [
        ('crm', '__first__'),
        ('spectacles', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='representation',
            name='allowed_users',
            field=models.ManyToManyField(blank=True, verbose_name='utilisateur authorisé', to='crm.CustomUser',
                                         null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='spectacle',
            name='allowed_user',
            field=models.ManyToManyField(blank=True, verbose_name='utilisateurs authorisés', to='crm.CustomUser',
                                         null=True),
            preserve_default=True,
        ),
    ]

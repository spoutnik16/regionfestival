# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ('crm', '0005_customuser_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='deprecateduser',
            name='user',
        ),
        migrations.DeleteModel(
            name='DeprecatedUser',
        ),
    ]

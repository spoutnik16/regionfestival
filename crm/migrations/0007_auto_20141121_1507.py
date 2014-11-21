# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('crm', '0006_auto_20140925_1015'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customuser',
            name='user',
            field=models.OneToOneField(to=settings.AUTH_USER_MODEL, null=True, blank=True),
            preserve_default=True,
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import moderation.fields
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('contenttypes', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='ModeratedObject',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', auto_created=True, serialize=False)),
                ('object_pk', models.PositiveIntegerField(editable=False, blank=True, null=True)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('moderation_state', models.SmallIntegerField(choices=[(0, 'Ready for moderation'), (1, 'Draft')], default=0, editable=False)),
                ('moderation_status', models.SmallIntegerField(choices=[(1, 'Approved'), (2, 'Pending'), (0, 'Rejected')], default=2, editable=False)),
                ('moderation_date', models.DateTimeField(editable=False, blank=True, null=True)),
                ('moderation_reason', models.TextField(blank=True, null=True)),
                ('changed_object', moderation.fields.SerializedObjectField(editable=False)),
                ('changed_by', models.ForeignKey(to=settings.AUTH_USER_MODEL, blank=True, related_name='changed_by_set', null=True)),
                ('content_type', models.ForeignKey(null=True, to='contenttypes.ContentType', blank=True, editable=False)),
                ('moderated_by', models.ForeignKey(null=True, to=settings.AUTH_USER_MODEL, blank=True, related_name='moderated_by_set', editable=False)),
            ],
            options={
                'ordering': ['moderation_status', 'date_created'],
            },
            bases=(models.Model,),
        ),
    ]

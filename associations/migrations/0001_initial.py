# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):
    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Association',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name',
                 models.CharField(help_text="nom officiel de l'association", max_length=2048, verbose_name='nom')),
                ('website', models.CharField(blank=True, null=True, max_length=512, verbose_name='site web')),
                ('direction', models.CharField(blank=True, null=True, max_length=512, verbose_name='directeur')),
                ('president', models.CharField(blank=True, null=True, max_length=512, verbose_name='president')),
                ('contact_name', models.CharField(help_text='nom de la personne de contact', max_length=2048,
                                                  verbose_name='nom du contact')),
                ('contact_phone', models.CharField(blank=True, null=True, max_length=512,
                                                   verbose_name='numero de telephone de contact')),
                ('contact_email',
                 models.CharField(blank=True, null=True, max_length=512, verbose_name='email de contact')),
                ('contact_adress',
                 models.CharField(blank=True, null=True, max_length=512, verbose_name='rue de contact')),
                ('contact_city',
                 models.CharField(blank=True, null=True, max_length=512, verbose_name='ville de contact')),
                ('contact_NPA',
                 models.CharField(blank=True, null=True, max_length=512, verbose_name='code postal de contact')),
                ('description', models.TextField(blank=True, null=True, max_length=51200, verbose_name='description')),
                ('remarques', models.TextField(blank=True, null=True, max_length=51200, verbose_name='remarques')),
            ],
            options={
                'verbose_name': 'association',
                'verbose_name_plural': 'associations',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='CategorieAssociation',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(max_length=512, verbose_name='categorie')),
                ('parent', models.ForeignKey(blank=True, null=True, to='associations.CategorieAssociation')),
            ],
            options={
                'verbose_name': 'categorie',
                'verbose_name_plural': 'categorie',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Region',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(max_length=512, verbose_name='nom du canton')),
            ],
            options={
                'verbose_name': 'canton',
                'verbose_name_plural': 'cantons',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='RegionChild',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(max_length=512, verbose_name='district')),
                ('region', models.ForeignKey(to='associations.Region')),
            ],
            options={
                'verbose_name': 'district',
                'verbose_name_plural': 'districts',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='RegionChild2',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(max_length=512, verbose_name='commune')),
                ('order', models.CharField(max_length=512, verbose_name='ordre')),
                ('old_id', models.IntegerField(blank=True, help_text="n'existe plus", null=True)),
                ('region_child', models.ForeignKey(to='associations.RegionChild')),
            ],
            options={
                'verbose_name': 'commune',
                'verbose_name_plural': 'communes',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='association',
            name='categorie',
            field=models.ForeignKey(to='associations.CategorieAssociation'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='association',
            name='region_child2',
            field=models.ForeignKey(blank=True, null=True, to='associations.RegionChild2'),
            preserve_default=True,
        ),
    ]

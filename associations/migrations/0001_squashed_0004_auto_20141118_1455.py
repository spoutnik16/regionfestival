# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    replaces = [('associations', '0001_initial'), ('associations', '0002_auto_20140925_1031'), ('associations', '0003_auto_20141108_1032'), ('associations', '0004_auto_20141118_1455')]

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Association',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
                ('name', models.CharField(max_length=2048, help_text="nom officiel de l'association", verbose_name='nom')),
                ('website', models.CharField(max_length=512, blank=True, null=True, verbose_name='site web')),
                ('direction', models.CharField(max_length=512, blank=True, null=True, verbose_name='directeur')),
                ('president', models.CharField(max_length=512, blank=True, null=True, verbose_name='president')),
                ('contact_name', models.CharField(max_length=2048, help_text='nom de la personne de contact', verbose_name='nom du contact')),
                ('contact_phone', models.CharField(max_length=512, blank=True, null=True, verbose_name='numero de telephone de contact')),
                ('contact_email', models.CharField(max_length=512, blank=True, null=True, verbose_name='email de contact')),
                ('contact_adress', models.CharField(max_length=512, blank=True, null=True, verbose_name='rue de contact')),
                ('contact_city', models.CharField(max_length=512, blank=True, null=True, verbose_name='ville de contact')),
                ('contact_NPA', models.CharField(max_length=512, blank=True, null=True, verbose_name='code postal de contact')),
                ('description', models.TextField(max_length=51200, blank=True, null=True, verbose_name='description')),
                ('remarques', models.TextField(max_length=51200, blank=True, null=True, verbose_name='remarques')),
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
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
                ('name', models.CharField(max_length=512, verbose_name='categorie')),
                ('parent', models.ForeignKey(to='associations.CategorieAssociation', null=True, blank=True)),
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
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
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
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
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
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
                ('name', models.CharField(max_length=512, verbose_name='commune')),
                ('order', models.CharField(max_length=512, verbose_name='ordre')),
                ('old_id', models.IntegerField(blank=True, help_text="n'existe plus", null=True)),
                ('region_child', models.ForeignKey(to='associations.RegionChild')),
                ('slug', models.SlugField(help_text='nom formaté pour les URLs', null=True, blank=True)),
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
            field=models.ForeignKey(to='associations.RegionChild2', null=True, default=None, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='categorieassociation',
            name='region_child2',
            field=models.ForeignKey(help_text="commune d'origine", verbose_name='commune', to='associations.RegionChild2', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='categorieassociation',
            name='slug',
            field=models.SlugField(help_text='nom formaté pour les URLs', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='association',
            name='slug',
            field=models.SlugField(help_text='nom formaté pour les URLs', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='region',
            name='slug',
            field=models.SlugField(help_text='nom formaté pour les URLs', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='regionchild',
            name='slug',
            field=models.SlugField(help_text='nom formaté pour les URLs', null=True, blank=True),
            preserve_default=True,
        ),
    ]

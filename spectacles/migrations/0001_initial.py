# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):
    dependencies = [
        ('crm', '__first__'),
        ('associations', '__first__'),
    ]

    operations = [
        migrations.CreateModel(
            name='Artiste',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=512)),
                ('role', models.CharField(null=True, max_length=512, blank=True)),
                ('fonction', models.CharField(null=True, max_length=512, blank=True)),
                ('status', models.SmallIntegerField(
                    help_text='0 = en création, 1 = en validation, 3 = public, 4 = exporté vers le cahier spécial',
                    verbose_name='status', null=True, blank=True)),
                ('allowed_users',
                 models.ManyToManyField(to='crm.CustomUser', verbose_name='utilisateur authorise', null=True,
                                        blank=True)),
                ('association', models.ManyToManyField(to='associations.Association')),
            ],
            options={
                'verbose_name_plural': 'artistes',
                'verbose_name': 'artiste',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='CategorieSpectacle',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(verbose_name='categorie', max_length=512)),
                ('parent', models.ForeignKey(to='spectacles.CategorieSpectacle', blank=True, null=True)),
            ],
            options={
                'verbose_name_plural': 'categorie',
                'verbose_name': 'categorie',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Festival',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=512)),
                ('startdate', models.DateField()),
                ('enddate', models.DateField()),
            ],
            options={
                'verbose_name_plural': 'festivals',
                'verbose_name': 'festival',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Lieu',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name',
                 models.CharField(help_text='nom du lieu', verbose_name='lieu de la représentation', max_length=512)),
                ('phoneNumber',
                 models.CharField(verbose_name='numéro de téléphone du lieu', null=True, max_length=512, blank=True)),
                ('city', models.CharField(verbose_name='ville', max_length=512)),
                ('zipCode', models.CharField(verbose_name='code postal', null=True, max_length=64, blank=True)),
                ('adress', models.CharField(verbose_name='adresse', max_length=512)),
                ('adress2', models.CharField(verbose_name="suite de l'adresse", null=True, max_length=512, blank=True)),
                ('website', models.URLField(verbose_name='site web', null=True, blank=True)),
                ('status', models.SmallIntegerField(
                    help_text='0 = en création, 1 = en validation, 3 = public, 4 = exporté vers le cahier spécial',
                    verbose_name='status', null=True, blank=True)),
                ('lat', models.FloatField(verbose_name='latitude', null=True, blank=True)),
                ('long', models.FloatField(verbose_name='longitude', null=True, blank=True)),
                ('old_id', models.IntegerField(null=True, blank=True)),
                ('region',
                 models.ForeignKey(to='associations.RegionChild2', verbose_name='commune', blank=True, null=True)),
            ],
            options={
                'verbose_name_plural': 'lieux',
                'verbose_name': 'lieu',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Representation',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('datetime', models.DateTimeField()),
                ('status', models.SmallIntegerField(
                    help_text='0 = en création, 1 = en validation, 3 = public, 4 = exporté vers le cahier spécial',
                    verbose_name='status', null=True, blank=True)),
                ('lieu',
                 models.ForeignKey(to='spectacles.Lieu', help_text='lieu où se passe le spectacle', verbose_name='lieu',
                                   blank=True, null=True)),
            ],
            options={
                'verbose_name_plural': 'représentations',
                'verbose_name': 'représentation',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Spectacle',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name',
                 models.CharField(help_text='le titre du spectacle', verbose_name='nom du spectacle', max_length=512)),
                ('website', models.CharField(help_text='site web qui parle du spectacle, page de réservation',
                                             verbose_name='le site web du spectacle', null=True, max_length=512,
                                             blank=True)),
                ('presentation_cahier', models.TextField(help_text='présentation qui apparaîtra dans le cahier spécial',
                                                         verbose_name='présentation courte', null=True, max_length=600,
                                                         blank=True)),
                ('presentation', models.TextField(help_text='présentation pour le site web, sans limitation de taille',
                                                  verbose_name='présentation longue', null=True, blank=True)),
                ('phone', models.CharField(help_text='le numéro auquel appelé pour réserver',
                                           verbose_name='numéro de téléphone pour les réservations', null=True,
                                           max_length=25, blank=True)),
                ('photo', models.ImageField(verbose_name='image', upload_to='images', null=True, blank=True)),
                ('status', models.SmallIntegerField(
                    help_text='0 = en création, 1 = en validation, 3 = public, 4 = exporté vers le cahier spécial',
                    verbose_name='status', null=True, blank=True)),
                ('old_id', models.IntegerField(help_text="n'existe plus", null=True, blank=True)),
                ('associations',
                 models.ManyToManyField(help_text='associations participantes', verbose_name='participant',
                                        to='associations.Association', null=True, blank=True)),
                ('categorie', models.ForeignKey(to='spectacles.CategorieSpectacle')),
                ('parent', models.ManyToManyField(to='spectacles.Spectacle', related_name='parent_rel_+', null=True,
                                                  help_text="dans le cas d'un festival, les différents événements qui s'y passent sont des sous-événements",
                                                  verbose_name='Festival', blank=True)),
                ('participants',
                 models.ManyToManyField(to='spectacles.Artiste', verbose_name='artiste', null=True, blank=True)),
            ],
            options={
                'verbose_name_plural': 'spectacles',
                'verbose_name': 'spectacle',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='representation',
            name='spectacle',
            field=models.ForeignKey(to='spectacles.Spectacle'),
            preserve_default=True,
        ),
    ]

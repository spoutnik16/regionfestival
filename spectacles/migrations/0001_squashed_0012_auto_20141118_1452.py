# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.datetime_safe


class Migration(migrations.Migration):

    replaces = [('spectacles', '0001_initial'), ('spectacles', '0002_auto_20140924_1209'), ('spectacles', '0003_representation_festival'), ('spectacles', '0004_auto_20140925_1506'), ('spectacles', '0005_categoriespectacle_slug'), ('spectacles', '0006_festivaldays'), ('spectacles', '0007_festivaldays_festival'), ('spectacles', '0008_auto_20141115_1052'), ('spectacles', '0009_representation_date'), ('spectacles', '0010_auto_20141118_1327'), ('spectacles', '0011_auto_20141118_1429'), ('spectacles', '0012_auto_20141118_1452')]

    dependencies = [
        ('associations', '__first__'),
        ('crm', '__first__'),
    ]

    operations = [
        migrations.CreateModel(
            name='Artiste',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(max_length=512)),
                ('role', models.CharField(null=True, blank=True, max_length=512)),
                ('fonction', models.CharField(null=True, blank=True, max_length=512)),
                ('status', models.SmallIntegerField(verbose_name='status', null=True, blank=True, help_text='0 = en création, 1 = en validation, 3 = public, 4 = exporté vers le cahier spécial')),
                ('allowed_users', models.ManyToManyField(to='crm.CustomUser', verbose_name='utilisateur authorise', null=True, blank=True)),
                ('association', models.ManyToManyField(to='associations.Association')),
            ],
            options={
                'verbose_name': 'artiste',
                'verbose_name_plural': 'artistes',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='CategorieSpectacle',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(verbose_name='categorie', max_length=512)),
                ('parent', models.ForeignKey(to='spectacles.CategorieSpectacle', null=True, blank=True)),
            ],
            options={
                'verbose_name': 'categorie',
                'verbose_name_plural': 'categorie',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Festival',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(max_length=512)),
                ('startdate', models.DateField()),
                ('enddate', models.DateField()),
                ('slug', models.SlugField(help_text='nom formaté pour les URLs', null=True, blank=True, max_length=40)),
            ],
            options={
                'verbose_name': 'festival',
                'verbose_name_plural': 'festivals',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Lieu',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(verbose_name='lieu de la représentation', help_text='nom du lieu', max_length=512)),
                ('phoneNumber', models.CharField(verbose_name='numéro de téléphone du lieu', null=True, blank=True, max_length=512)),
                ('city', models.CharField(verbose_name='ville', max_length=512)),
                ('zipCode', models.CharField(verbose_name='code postal', null=True, blank=True, max_length=64)),
                ('adress', models.CharField(verbose_name='adresse', max_length=512)),
                ('adress2', models.CharField(verbose_name="suite de l'adresse", null=True, blank=True, max_length=512)),
                ('website', models.URLField(verbose_name='site web', null=True, blank=True)),
                ('status', models.SmallIntegerField(verbose_name='status', null=True, blank=True, help_text='0 = en création, 1 = en validation, 3 = public, 4 = exporté vers le cahier spécial')),
                ('lat', models.FloatField(verbose_name='latitude', null=True, blank=True)),
                ('long', models.FloatField(verbose_name='longitude', null=True, blank=True)),
                ('old_id', models.IntegerField(null=True, blank=True)),
                ('region', models.ForeignKey(to='associations.RegionChild2', null=True, verbose_name='commune', blank=True)),
            ],
            options={
                'verbose_name': 'lieu',
                'verbose_name_plural': 'lieux',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Representation',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('datetime', models.DateTimeField()),
                ('status', models.SmallIntegerField(verbose_name='status', null=True, blank=True, help_text='0 = en création, 1 = en validation, 3 = public, 4 = exporté vers le cahier spécial')),
                ('lieu', models.ForeignKey(to='spectacles.Lieu', null=True, verbose_name='lieu', blank=True, help_text='lieu où se passe le spectacle')),
            ],
            options={
                'verbose_name': 'représentation',
                'verbose_name_plural': 'représentations',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Spectacle',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('name', models.CharField(verbose_name='nom du spectacle', help_text='le titre du spectacle', max_length=512)),
                ('website', models.CharField(verbose_name='le site web du spectacle', null=True, blank=True, help_text='site web qui parle du spectacle, page de réservation', max_length=512)),
                ('presentation_cahier', models.TextField(verbose_name='présentation courte', null=True, blank=True, help_text='présentation qui apparaîtra dans le cahier spécial', max_length=600)),
                ('presentation', models.TextField(verbose_name='présentation longue', null=True, blank=True, help_text='présentation pour le site web, sans limitation de taille')),
                ('phone', models.CharField(verbose_name='numéro de téléphone pour les réservations', null=True, blank=True, help_text='le numéro auquel appelé pour réserver', max_length=25)),
                ('photo', models.ImageField(verbose_name='image', null=True, blank=True, upload_to='images-spectacle')),
                ('status', models.SmallIntegerField(verbose_name='status', null=True, blank=True, help_text='0 = en création, 1 = en validation, 3 = public, 4 = exporté vers le cahier spécial')),
                ('old_id', models.IntegerField(help_text="n'existe plus", null=True, blank=True)),
                ('associations', models.ManyToManyField(to='associations.Association', verbose_name='participant', null=True, blank=True, help_text='associations participantes')),
                ('categorie', models.ForeignKey(to='spectacles.CategorieSpectacle')),
                ('parent', models.ManyToManyField(to='spectacles.Spectacle', null=True, related_name='parent_rel_+', verbose_name='Festival', blank=True, help_text="dans le cas d'un festival, les différents événements qui s'y passent sont des sous-événements")),
                ('participants', models.ManyToManyField(to='spectacles.Artiste', verbose_name='artiste', null=True, blank=True)),
                ('allowed_user', models.ManyToManyField(to='crm.CustomUser', verbose_name='utilisateurs authorisés', null=True, blank=True)),
                ('slug', models.SlugField(help_text='nom formaté pour les URLs', null=True, blank=True)),
            ],
            options={
                'verbose_name': 'spectacle',
                'verbose_name_plural': 'spectacles',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='representation',
            name='spectacle',
            field=models.ForeignKey(to='spectacles.Spectacle'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='representation',
            name='allowed_users',
            field=models.ManyToManyField(to='crm.CustomUser', verbose_name='utilisateur authorisé', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='representation',
            name='festival',
            field=models.ManyToManyField(to='spectacles.Festival', verbose_name='festival auquel participe le spectacle', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='categoriespectacle',
            name='slug',
            field=models.SlugField(help_text='nom formaté pour les URLs', null=True, blank=True, max_length=40),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='representation',
            name='date',
            field=models.DateField(default=django.utils.datetime_safe.date.today),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='artiste',
            name='slug',
            field=models.SlugField(help_text='nom formaté pour les URLs', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='lieu',
            name='slug',
            field=models.SlugField(help_text='nom formaté pour les URLs', null=True, blank=True),
            preserve_default=True,
        ),
    ]

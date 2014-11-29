# -*- encoding: utf-8 -*-
# from django.db import models
from django.contrib.gis.db import models
from django.utils.translation import ugettext_lazy as _

from associations.models import Association, RegionChild2
from crm.models import CustomUser


# Create your models here.
class Artiste(models.Model):
    name = models.CharField(max_length=512)
    association = models.ManyToManyField(Association)
    role = models.CharField(max_length=512,
                            null=True,
                            blank=True)
    fonction = models.CharField(max_length=512,
                                null=True,
                                blank=True)
    allowed_users = models.ManyToManyField(CustomUser,
                                           verbose_name=_('utilisateur authorise'),
                                           null=True,
                                           blank=True)
    status = models.SmallIntegerField(verbose_name=_("status"),
                                      help_text=_(
                                          "0 = en création, 1 = en validation, 3 = public, "
                                          "4 = exporté vers le cahier spécial"),
                                      blank=True,
                                      null=True)
    slug = models.SlugField(null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))

    class Meta:
        verbose_name = _("artiste")
        verbose_name_plural = _("artistes")

    def __str__(self):
        return self.name
    def save(self, **kwargs):
        from regionfestival.snippets import unique_slugify
        unique_slugify(self, self.name)
        super(Artiste, self).save(**kwargs)


class CategorieSpectacle(models.Model):
    name = models.CharField(max_length=512,
                            verbose_name=_("categorie"))
    parent = models.ForeignKey("self",
                               null=True,
                               blank=True)
    slug = models.SlugField(max_length=40,
                            null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))
    main = models.BooleanField(help_text=_("apparaît comme catégorie principale"),
                               default=False)

    def get_absolute_url(self):
        from django.core.urlresolvers import reverse
        return reverse('spectacles', kwargs={'categorie': self.slug})
    class Meta:
        verbose_name = _('categorie')
        verbose_name_plural = _('categorie')
    def save(self, **kwargs):
        from regionfestival.snippets import unique_slugify
        unique_slugify(self, self.name)
        super(CategorieSpectacle, self).save(**kwargs)

    def __str__(self):
        return self.name


class Festival(models.Model):
    name = models.CharField(max_length=512)
    startdate = models.DateField()
    enddate = models.DateField()
    slug = models.SlugField(max_length=40,
                            null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))
    class Meta:
        verbose_name = _("festival")
        verbose_name_plural = _("festivals")
    def save(self, **kwargs):
        from regionfestival.snippets import unique_slugify
        unique_slugify(self, self.name)
        super(Festival, self).save(**kwargs)

    def __str__(self):
        return self.name


class Spectacle(models.Model):
    name = models.CharField(max_length=512,
                            help_text=_("le titre du spectacle"),
                            verbose_name=_('nom du spectacle'))
    associations = models.ManyToManyField(Association,
                                          help_text=_("associations participantes"),
                                          verbose_name=_('participant'),
                                          null=True,
                                          blank=True)
    website = models.CharField(max_length=512,
                               null=True,
                               blank=True,
                               verbose_name=_("le site web du spectacle"),
                               help_text=_("site web qui parle du spectacle, page de réservation"))
    participants = models.ManyToManyField(Artiste,
                                          null=True,
                                          blank=True,
                                          verbose_name=_("artiste"))
    presentation_cahier = models.TextField(max_length=600,
                                           null=True,
                                           blank=True,
                                           help_text=_("présentation qui apparaîtra dans le cahier spécial"),
                                           verbose_name=_("présentation courte"))
    presentation = models.TextField(help_text=_("présentation pour le site web, sans limitation de taille"),
                                    null=True,
                                    blank=True,
                                    verbose_name=_("présentation longue"))
    phone = models.CharField(max_length=25,
                             null=True,
                             blank=True,
                             help_text=_("le numéro auquel appelé pour réserver"),
                             verbose_name=_("numéro de téléphone pour les réservations"))
    photo = models.ImageField(upload_to="images-spectacle",
                              null=True,
                              blank=True,
                              verbose_name=_("image"))
    parent = models.ManyToManyField('self',
                                    null=True,
                                    blank=True,
                                    help_text=_(
                                        "dans le cas d'un festival, les différents événements qui s'y passent sont des "
                                        "sous-événements"),
                                    verbose_name=_("Festival"))
    status = models.SmallIntegerField(verbose_name=_("status"),
                                      blank=True,
                                      null=True,
                                      help_text=_(
                                          "0 = en création, 1 = en validation, 3 = public, 4 = exporté vers le cahier "
                                          "spécial"))
    old_id = models.IntegerField(help_text=_("n'existe plus"),
                                 blank=True,
                                 null=True)
    categorie = models.ForeignKey(CategorieSpectacle)
    slug = models.SlugField(null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))
    allowed_user = models.ManyToManyField(CustomUser,
                                          null=True,
                                          blank=True,
                                          verbose_name=_("utilisateurs authorisés"))
    def get_absolute_url(self):
        from django.core.urlresolvers import reverse
        return reverse("spectacle", args=[self.slug,])

    class Meta:
        verbose_name = _('spectacle')
        verbose_name_plural = _('spectacles')

    def __str__(self):
        return self.name
    def save(self, **kwargs):
        from regionfestival.snippets import unique_slugify
        unique_slugify(self, self.name)
        super(Spectacle, self).save(**kwargs)


class Lieu(models.Model):
    name = models.CharField(max_length=512,
                            help_text=_("nom du lieu"),
                            verbose_name=_("lieu de la représentation"))
    # allowed_users = models.ManyToManyField(CustomUser,
    # null = True,
    # blank = True,
    # verbose_name = _('utilisateur authorisé'))
    phoneNumber = models.CharField(max_length=512,
                                   null=True,
                                   blank=True,
                                   verbose_name=_("numéro de téléphone du lieu"))
    city = models.CharField(max_length=512,
                            verbose_name=_("ville"))
    zipCode = models.CharField(max_length=64,
                               null=True,
                               blank=True,
                               verbose_name=_("code postal"))
    adress = models.CharField(max_length=512,
                              verbose_name=_("adresse"))
    adress2 = models.CharField(max_length=512,
                               null=True,
                               blank=True,
                               verbose_name=_("suite de l'adresse"))
    website = models.URLField(null=True,
                              blank=True,
                              verbose_name=_("site web"))
    region = models.ForeignKey(RegionChild2,
                               blank=True,
                               null=True,
                               verbose_name=_("commune"))
    status = models.SmallIntegerField(verbose_name=_("status"),
                                      null=True,
                                      blank=True,
                                      help_text=_(
                                          "0 = en création, 1 = en validation, 3 = public, 4 = exporté vers le cahier "
                                          "spécial"))
    latitude = models.FloatField(null=True,
                            blank=True,
                            verbose_name=_("latitude"))
    longitude = models.FloatField(verbose_name=_("longitude"),
                             null=True,
                             blank=True)
    slug = models.SlugField(null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))
    old_id = models.IntegerField(null=True,
                                 blank=True)

    ## geodjango magic
    in_geom = models.PointField('shp',
                             srid=4326,
                             help_text = _("Cliquez sur la carte"),
                             null = True,
                             blank = True,
                             )
    objects = models.GeoManager()

    def get_absolute_url(self):
        from django.core.urlresolvers import reverse
        return reverse('place', args=[self.slug])
    class Meta:
        verbose_name = _('lieu')
        verbose_name_plural = _('lieux')
    def save(self, **kwargs):
        if self.slug is not None:
            from regionfestival.snippets import unique_slugify
            unique_slugify(self, self.name)
        if self.in_geom is not None:
            self.longitude = self.in_geom.x
            self.latitude = self.in_geom.y
        elif self.longitude is not None and self.latitude is not None:
            self.in_geom = 'POINT (' + str(self.latitude) + ' ' + str(self.longitude) + ' )'
        super(Lieu, self).save(**kwargs)

    def __str__(self):
        return self.name


class Representation(models.Model):
    lieu = models.ForeignKey(Lieu,
                             help_text=_("lieu où se passe le spectacle"),
                             verbose_name=_('lieu'),
                             null=True,
                             blank=True)
    spectacle = models.ForeignKey(Spectacle)
    datetime = models.DateTimeField()
    date = models.DateField()
    allowed_users = models.ManyToManyField(CustomUser,
                                           null=True,
                                           blank=True,
                                           verbose_name=_('utilisateur authorisé'))
    status = models.SmallIntegerField(verbose_name=_("status"),
                                      null=True,
                                      blank=True,
                                      help_text=_(
                                          "0 = en création, 1 = en validation, 3 = public, 4 = exporté vers le cahier "
                                          "spécial"))
    festival = models.ManyToManyField(Festival,
                                      null=True,
                                      blank=True,
                                      verbose_name=_('festival auquel participe le spectacle'))

    def save(self, *args, **kwargs):
        self.date = self.datetime.date()
        super(Representation, self).save(*args, **kwargs)

    class Meta:
        verbose_name = _('représentation')
        verbose_name_plural = _('représentations')

    def __str__(self):
        return self.spectacle.name + ' à ' + self.lieu.name + ' à ' + self.datetime.__str__()

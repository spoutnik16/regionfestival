# -*- encoding: utf-8 -*-


# Create your models here.
from django.contrib.gis.db import models
from django.contrib.gis import geos
from django.utils.translation import ugettext_lazy as _


# Create your models here.
class Region(models.Model):
    name = models.CharField(max_length=512,
                            verbose_name=_("nom du canton"))
    slug = models.SlugField(null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))
    boundaries = models.MultiPolygonField(null=True,
                                          blank=True)
    objects = models.GeoManager()

    class Meta:
        verbose_name = _('canton')
        verbose_name_plural = _('cantons')

    def __str__(self):
        return self.name
    def save(self, **kwargs):
        from regionfestival.snippets import unique_slugify
        unique_slugify(self, self.name)
        if self.boundaries and isinstance(self.boundaries, geos.Polygon):
            self.boundaries = geos.MultiPolygon(self.boundaries)
        super(Region, self).save(**kwargs)


class RegionChild(models.Model):
    name = models.CharField(max_length=512,
                            verbose_name=_("district"))
    region = models.ForeignKey(Region)
    slug = models.SlugField(null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))
    boundaries = models.MultiPolygonField(null=True,
                                          blank=True)

    class Meta:
        verbose_name = _('district')
        verbose_name_plural = _('districts')

    def __str__(self):
        return self.name
    def save(self, **kwargs):
        from regionfestival.snippets import unique_slugify
        unique_slugify(self, self.name)
        super(RegionChild, self).save(**kwargs)


class RegionChild2(models.Model):
    name = models.CharField(max_length=512,
                            verbose_name=_("commune"))
    region_child = models.ForeignKey(RegionChild)
    order = models.CharField(max_length=512,
                             verbose_name=_("ordre"))
    slug = models.SlugField(null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))
    old_id = models.IntegerField(help_text=_("n'existe plus"),
                                 null=True,
                                 blank=True)
    boundaries = models.MultiPolygonField(null=True,
                                          blank=True)

    class Meta:
        verbose_name = _('commune')
        verbose_name_plural = _('communes')
    def get_absolute_url(self):
        from django.core.urlresolvers import reverse
        return reverse('region_child2', args=[self.slug])
    def __str__(self):
        return self.name
    def save(self, **kwargs):
        from regionfestival.snippets import unique_slugify
        unique_slugify(self, self.name)
        super(RegionChild2, self).save(**kwargs)


class CategorieAssociation(models.Model):
    name = models.CharField(max_length=512,
                            verbose_name=_("categorie"))
    parent = models.ForeignKey("self",
                               null=True,
                               blank=True)
    slug = models.SlugField(max_length=40,
                            null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))
    slug = models.SlugField(null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))
    region_child2 = models.ForeignKey(RegionChild2,
                                      null=True,
                                      blank=True,
                                      help_text=_("commune d'origine"),
                                      verbose_name=_("commune"))

    class Meta:
        verbose_name = _('categorie')
        verbose_name_plural = _('categorie')

    def __str__(self):
        return self.name
    def save(self, **kwargs):
        from regionfestival.snippets import unique_slugify
        unique_slugify(self, self.name)
        super(CategorieAssociation, self).save(**kwargs)

class Person(models.Model):
    first_name = models.CharField(max_length=512)
    last_name = models.CharField(max_length=512,
                                 blank=True,
                                 null=True)
    status = models.SmallIntegerField(verbose_name=_("status"),
                                      help_text=_(
                                          "0 = en création, 1 = en validation, 3 = public, "
                                          "4 = exporté vers le cahier spécial"),
                                      blank=True,
                                      null=True)
    mail = models.EmailField(verbose_name=_("adresse email"),
                             blank=True,
                             null=True)
    adresse = models.TextField(blank=True,
                               null=True,
                               verbose_name=_("adresse postale")
    )
    telephone = models.CharField(max_length=128,
                                 verbose_name=_("numéro de téléphone"),
                                 blank=True,
                                 null=True)
    cellphone = models.CharField(max_length=128,
                                 verbose_name=_("numéro de natel"),
                                 blank=True,
                                 null=True)
    slug = models.SlugField(null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))

    def name(self):
        return self.first_name+' '+self.last_name

    class Meta:
        verbose_name = _("artiste")
        verbose_name_plural = _("artistes")

    def __str__(self):
        return self.name()
    def save(self, **kwargs):
        from regionfestival.snippets import unique_slugify
        unique_slugify(self, self.name)
        super(Artiste, self).save(**kwargs)

class Association(models.Model):
    name = models.CharField(max_length=2048,
                            help_text=_("nom officiel de l'association"),
                            verbose_name=_('nom'))
    categorie = models.ForeignKey(CategorieAssociation)
    region_child2 = models.ForeignKey(RegionChild2,
                                      blank=True,
                                      null=True,
                                      default=None)
    website = models.CharField(max_length=512,
                               verbose_name=_('site web'),
                               blank=True,
                               null=True)
    description = models.TextField(max_length=51200,
                                   verbose_name=_('description'),
                                   blank=True,
                                   null=True)
    remarques = models.TextField(max_length=51200,
                                 verbose_name=_('remarques'),
                                 blank=True,
                                 null=True)
    slug = models.SlugField(null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))
    contacts = models.ManyToManyField(Person,
                                     null=True,
                                     blank=True,
                                     through='Contact',
                                     verbose_name=_('personne de contact'))



    class Meta:
        verbose_name = _('association')
        verbose_name_plural = _('associations')
    def get_absolute_url(self):
        from django.core.urlresolvers import reverse
        return reverse('association', args=[self.slug,])
    def as_a_link(self):
        return '<a href="'+self.get_absolute_url()+'" class="association">'+self.name+'</a>'
    def __str__(self):
        return self.name
    def save(self, **kwargs):
        from regionfestival.snippets import unique_slugify
        unique_slugify(self, self.name)
        super(Association, self).save(**kwargs)

class Contact(models.Model):
    person = models.ForeignKey(Person)
    association=models.ForeignKey(Association)
    role = models.CharField(max_length=64, null=True, blank=True)
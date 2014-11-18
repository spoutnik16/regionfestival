# -*- encoding: utf-8 -*-


# Create your models here.
from django.db import models
from django.utils.translation import ugettext_lazy as _


# Create your models here.
class Region(models.Model):
    name = models.CharField(max_length=512,
                            verbose_name=_("nom du canton"))
    slug = models.SlugField(null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))

    class Meta:
        verbose_name = _('canton')
        verbose_name_plural = _('cantons')

    def __str__(self):
        return self.name
    def save(self, **kwargs):
        from regionfestival.snippets import unique_slugify
        unique_slugify(self, self.name)
        super(Region, self).save(**kwargs)


class RegionChild(models.Model):
    name = models.CharField(max_length=512,
                            verbose_name=_("district"))
    region = models.ForeignKey(Region)
    slug = models.SlugField(null=True,
                            blank=True,
                            help_text=_("nom formaté pour les URLs"))

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

    class Meta:
        verbose_name = _('commune')
        verbose_name_plural = _('communes')

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
    direction = models.CharField(max_length=512,
                                 verbose_name=_('directeur'),
                                 blank=True,
                                 null=True)
    president = models.CharField(max_length=512,
                                 verbose_name=_('president'),
                                 blank=True,
                                 null=True)
    contact_name = models.CharField(max_length=2048,
                                    help_text=_("nom de la personne de contact"),
                                    verbose_name=_('nom du contact'))
    contact_phone = models.CharField(max_length=512,
                                     verbose_name=_('numero de telephone de contact'),
                                     blank=True,
                                     null=True)
    contact_email = models.CharField(max_length=512,
                                     verbose_name=_('email de contact'),
                                     blank=True,
                                     null=True)
    contact_adress = models.CharField(max_length=512,
                                      verbose_name=_('rue de contact'),
                                      blank=True,
                                      null=True)
    contact_city = models.CharField(max_length=512,
                                    verbose_name=_('ville de contact'),
                                    blank=True,
                                    null=True)
    contact_NPA = models.CharField(max_length=512,
                                   verbose_name=_('code postal de contact'),
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

    class Meta:
        verbose_name = _('association')
        verbose_name_plural = _('associations')

    def __str__(self):
        return self.name
    def save(self, **kwargs):
        from regionfestival.snippets import unique_slugify
        unique_slugify(self, self.name)
        super(Association, self).save(**kwargs)
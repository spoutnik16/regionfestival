# -*- encoding: utf-8 -*-


from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.utils.translation import ugettext_lazy as _


# Create your models here.
class CustomUser(models.Model):
    phone = models.CharField(max_length=50,
                             verbose_name=_("numéro de téléphone"),
                             null=True,
                             blank=True)
    user = models.OneToOneField(User,
                             unique=True,
                             blank=True,
                             null=True)
    def create_user_custom(sender, instance, created, **kwargs):
        if created:
            CustomUser.objects.create(user=instance)

    class Meta:
        verbose_name = _('profile')
        verbose_name_plural = _('profiles')

    def __str__(self):
        return self.user.username
    post_save.connect(create_user_custom, sender=User)

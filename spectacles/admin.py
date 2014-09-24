# Register your models here.
from django.contrib import admin

from spectacles.models import CategorieSpectacle, Artiste, Festival, Lieu, Representation, Spectacle


# Register your models here.


admin.site.register(CategorieSpectacle)
admin.site.register(Artiste)
admin.site.register(Lieu)
admin.site.register(Festival)
admin.site.register(Representation)
admin.site.register(Spectacle)
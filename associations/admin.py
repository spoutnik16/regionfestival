# Register your models here.
from django.contrib import admin

from associations.models import Association, Region, Region_child, Region_child2, Categorie


# Register your models here.


admin.site.register(Association)
admin.site.register(Region)
admin.site.register(Region_child)
admin.site.register(Region_child2)
admin.site.register(Categorie)
# Register your models here.
from django.contrib import admin

from associations.models import Region, Association, RegionChild, RegionChild2, CategorieAssociation


# Register your models here.


admin.site.register(Association)
admin.site.register(Region)
admin.site.register(RegionChild)
admin.site.register(RegionChild2)
admin.site.register(CategorieAssociation)
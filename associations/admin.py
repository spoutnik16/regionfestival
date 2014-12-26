# Register your models here.
from django.contrib import admin

from associations.models import Region, Association, RegionChild, RegionChild2, CategorieAssociation, Person, Contact


# Register your models here.

class ContactInline(admin.TabularInline):
    model = Contact
    extra = 1

class PersonAdmin(admin.ModelAdmin):
    inlines = (ContactInline,)

class AssociationAdmin(admin.ModelAdmin):
    inlines = (ContactInline,)


admin.site.register(Association, AssociationAdmin)
admin.site.register(Region)
admin.site.register(RegionChild)
admin.site.register(RegionChild2)
admin.site.register(CategorieAssociation)
admin.site.register(Person, PersonAdmin)
admin.site.register(Contact)

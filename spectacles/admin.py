# Register your models here.
from django.contrib import admin
from django.contrib.admin.sites import AdminSite
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User
from django import forms
from django.contrib.auth import authenticate
from django.utils.translation import ugettext_lazy as _
from spectacles.models import CategorieSpectacle, Artiste, Festival, Lieu, Representation, Spectacle



class MemberSpaceAuthentificationForm(AuthenticationForm):
    """
    Same as Django authenticationForm,b ut allows to login
    any user who is not staff
    refs : http://www.tryolabs.com/Blog/2012/06/18/django-administration-interface-non-staff-users/
    """
    this_is_the_login_form = forms.BooleanField(widget=forms.HiddenInput,
                                                initial=1,
                                                error_messages={'required': _("Identifiez-vous à nouveau, votre session a expiré")})

    def clean(self):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')
        message = ERROR_MESSAGE

        if username and password:
            self.user_cache = authenticate(username=username,
                                           password=password)
            if self.user_cache is None:
                if """@""" in username:
                    """
                    Mistakenly entered e-mail adress instead of username ? look it up.
                    """
                    try:
                        user = User.objects.get(email=username)
                    except (User.DoesNotExists, User.MultipleObjectsReturned):
                        """ well, Nothing to do Here"""
                        pass
                    else:
                        if user.check_password(password):
                            message = _("Utilisez votre nom d'utilisateur plutôt que votre adresse email"
                            "Essayez '%s' à la place") % user.username
                raise forms.ValidationError(message)
            #Removed Check for is_staff here
            elif not self.user_cache.is_active:
                raise forms.ValidationError(message)
        self.check_for_test_cookie()
        return self.cleaned_data


class MemberSpace(AdminSite):
    login_form = MemberSpaceAuthentificationForm


    def has_permission(self, request):
        """
        Remove the check for is_staff
        """
        return request.user.is_active

member_space = MemberSpace(name='memberspace')
member_space.site_header = _("Espace Membre Valais Festival")
member_space.site_title = _("Espace Membre Valais Festival")

# Register your models here.
member_space.register(Spectacle)
member_space.register(Artiste)
member_space.register(Lieu)
member_space.register(Representation)

admin.site.register(CategorieSpectacle)
admin.site.register(Artiste)
admin.site.register(Lieu)
admin.site.register(Festival)
admin.site.register(Representation)
admin.site.register(Spectacle)
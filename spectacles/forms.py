__author__ = 'spoutnik16'
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.utils.translation import ugettext_lazy as _

from spectacles.models import Spectacle, Association


class ConnexionForm(forms.Form):
    username = forms.CharField(label=_("Nom d'utilisateur"), max_length=30)
    password = forms.CharField(label=_("Mot de passe"), widget=forms.PasswordInput)


class ContactForm(forms.Form):
    message = forms.CharField(label=_("Écrivez-nous"),
                              widget=forms.Textarea(
                                                    attrs={'rows': 10,
                                                           'cols': 40
                                                           }
                                                   )
                              )
    newsletter = forms.BooleanField(label=_("S'inscrire à la newsletter"))


class RegisterForm(UserCreationForm):
    email = forms.EmailField(required=True)


class SearchForm(forms.Form):
    search_text = forms.CharField(label=_("Rechercher"),
                                  max_length=30,
                                  required=True)


class AssociationSimpleForm(forms.ModelForm):
    class Meta:
        model = Association
        fields = ['name']


class SpectacleSimpleForm(forms.ModelForm):
    class Meta:
        model = Spectacle
        fields = ['name', 'associations', 'presentation_cahier']

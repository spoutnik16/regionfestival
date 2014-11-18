"""
accueil :    la page d'accueil
contact :    formulaire de contact et infos de contact



spectacles : listes des spectacles

spectacle :  un seul spectacle
place :      un seul lieu
region_child2:une commune

admin         page d'accueil de la zone admin

connection
deconnection


redirect_old_spectacle
redirect_old_lieu
redirect_old_commune

Custom_Paginator

"""
import datetime

from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth import authenticate, login, logout
from django.utils.http import urlquote_plus, unquote_plus
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator, EmptyPage
from django.db.models import Q

from spectacles.forms import ContactForm, ConnexionForm, RegisterForm
from spectacles.forms import SpectacleSimpleForm, AssociationSimpleForm
from spectacles.models import Spectacle, Representation, Lieu, CategorieSpectacle
from associations.models import Region, RegionChild, RegionChild2, Association
from spectacles.models import Festival

# Vues qui sont liées à l'affichage pour le public
def accueil(request):
    return render(request, 'base.html')


def contact(request):
    form = ContactForm(request.POST)
    if form.is_valid():
        message = form.cleaned_data['message']
        newsletter = form.cleaned_data['newsletter']
        envoi = True
    else:
        form = ContactForm
    return render(request, 'contact_form.html', locals())


def spectacles_redir(request, page=1, categorie=None, search_term=None):
    if search_term:
        if categorie:
            return redirect(spectacles, page=1, categorie=categorie, search_term=search_term)
        else:
            return redirect(spectacles, page=1, search_term=search_term)
    else:
        if categorie:
            return redirect(spectacles, page=1, categorie=categorie)
        else:
            return redirect(spectacles, page=1)


def place(request, id):
    lieu = get_object_or_404(Lieu, id=id)
    representations = Representation.objects.filter(lieu=lieu)
    return render(request, 'place.html', locals())


def agenda(request, day=None, month=None, year=None):
    festival = Festival.objects.all().first()
    daterange = lambda d1, d2: (d1 + datetime.timedelta(days=i) for i in range((d2 - d1).days + 1))
    try:
        date = datetime.date(int(year), int(month), int(day))
    except:
        date = festival.startdate
        pass
    if date not in daterange(festival.startdate, festival.enddate):
        date = festival.startdate
    from django.db.models import Count

    list_days = Representation.objects.filter(status__gte=3).extra({'day': 'date'}).values('day').annotate(Count('id'))
    reps = Representation.objects.filter(datetime__year=date.year,
                                         datetime__month=date.month,
                                         datetime__day=date.day).order_by('datetime')
    return render(request, 'agenda.html', locals())


def spectacles(request, page=None, categorie=None, search_term=None):
    if request.method == 'POST':
        if request.POST.get('search_term'):
            search_term = urlquote_plus(request.POST.get('search_term'))
            if categorie:
                return redirect(spectacles_redir, page=1, categorie=categorie, search_term=search_term)
            else:
                return redirect(spectacles_redir, page=1, search_term=search_term)
        else:
            if categorie:
                return redirect(spectacles_redir, page=1, categorie=categorie)
            else:
                return redirect(spectacles_redir, page=1)
    categories_list = CategorieSpectacle.objects.all()
    spectacles_list = Spectacle.objects.all()
    if categorie:
        categorie = get_object_or_404(CategorieSpectacle, slug=categorie)
        spectacles_list = spectacles_list.filter(categorie__in=get_children(categorie))
    if search_term:
        spectacles_list = search(search_term, spectacles_list)
        unquoted_url = unquote_plus(search_term)
    paginator = Paginator(spectacles_list, 10)
    if page:
        page = int(page)
    else:
        page = 1
    try:
        spectacles = paginator.page(page)
    except EmptyPage:
        spectacles = paginator.page(paginator.num_pages)
    return render(request, 'list_spectacles.html', locals())


def spectacle(request, id):
    spectacle = get_object_or_404(Spectacle, id=id)
    return render(request, 'spectacle_solo.html', {'spectacle': spectacle})


def region_child2(request, id):
    region_child2 = get_object_or_404(RegionChild2, id=id)
    spectacles = []
    for lieu in region_child2.lieu_set.all():
        for representation in lieu.representation_set.all():
            spectacles.append(representation.spectacle)
    spectacles = set(spectacles)
    return render(request, 'region_child2.html', {'region_child2': region_child2, 'spectacles': spectacles})


def admin(request):
    return render(request, 'accueil.html')


def connection(request):
    error = False
    if request.method == "POST":
        form = ConnexionForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data["username"]
            password = form.cleaned_data["password"]
            user = authenticate(username=username,
                                password=password)
            if user:
                login(request, user)
            else:
                error = True
    else:
        form = ConnexionForm()
    return render(request, 'registration/login.html', locals())


def deconnection(request):
    logout(request)
    return redirect(reverse(connection))


def inscription(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            return redirect('connection')
    else:
        form = RegisterForm()
    return render(request, 'registration/register.html', {'form': form, })



#
#
# les parties de l'espace admin
#

def espace_membre(request):
    return render(request, 'espace_membre.html')


def association_form(request, id=None):
    form = AssociationSimpleForm()
    return render(request, 'member_form.html', locals())


def spectacle_form(request):
    if request.method == 'POST':
        form = SpectacleSimpleForm(request.POST, instance=Spectacle)
        if form.is_valid():
            form.save()
    else:
        form = SpectacleSimpleForm()
    return render(request, 'espace_membre.html', {'form': form, })

# les différentes redirections des vielles pages du site PHP
#
#
#

def redirect_old_spectacle(request, id):
    id = get_object_or_404(Spectacle, old_id=id).id
    return redirect('spectacles.views.spectacle', id=id)


def redirect_old_lieu(request, id):
    id = get_object_or_404(Lieu, old_id=id).id
    return redirect('spectacles.views.place', id=id)


def redirect_old_commune(request, id):
    id = get_object_or_404(Child2, old_id=id).id
    return redirect('spectacles.views.commune', id=id)


def search(search_text, spectacles):
    search_text = unquote_plus(search_text)
    list_region = Region.objects.filter(name__icontains=search_text)
    list_region_child = RegionChild.objects.filter(
        Q(name__icontains=search_text)
        | Q(region__in=list_region.values_list('id'))
    )
    list_region_child2 = RegionChild2.objects.filter(
        Q(name__icontains=search_text)
        | Q(region_child__in=list_region_child.values_list('id'))
    )
    list_lieux = Lieu.objects.filter(
        Q(name__icontains=search_text)
        | Q(adress__icontains=search_text)
        | Q(city__icontains=search_text)
        | Q(region__in=list_region_child2.values_list('id'))
    )
    list_rep = Representation.objects.filter(lieu_id__in=list_lieux.values_list('id'))

    list_associations = Association.objects.filter(name__icontains=search_text)

    list_spectacles = spectacles.filter(
        Q(name__icontains=search_text)
        | Q(presentation_cahier__icontains=search_text)
        | Q(presentation__icontains=search_text)
        | Q(id__in=list_rep.values_list('spectacle'))
        | Q(associations__in=list_associations.values_list('id'))
    )
    return list_spectacles


def get_children(cat):
    if CategorieSpectacle.objects.filter(parent=cat):
        children = CategorieSpectacle.objects.filter(parent=cat)
        cat_and_children = {cat} | set(children)
        for child in children:
            cat_and_children = cat_and_children | get_children(child)
    else:
        cat_and_children = {cat}
    return cat_and_children
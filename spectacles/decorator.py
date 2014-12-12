from functools import wraps
from django.utils.decorators import available_attrs
from spectacles.models import Representation
def aside(view):
    @wraps(view, assigned=available_attrs(view))
    def _wrapped(request, *args, **kwargs):
        next_reps = Representation.objects.get()
        return view(request, *args, **kwargs)
    return _wrapped
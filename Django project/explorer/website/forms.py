from django import forms
from .models import *

class cat_update(forms.ModelForm):
    class Meta:
        model=category
        fields="__all__"
class p_update(forms.ModelForm):
    class Meta:
        model=product
        fields="__all__"
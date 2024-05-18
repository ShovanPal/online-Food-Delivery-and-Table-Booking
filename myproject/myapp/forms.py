from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User
from django import forms
from django.core.exceptions import ValidationError
from django.utils import timezone
from .models import Booking

class BookingForm(forms.ModelForm):
    class Meta:
        model = Booking
        fields = ['name', 'email', 'phone_number', 'date', 'time', 'persons']

    def clean_date(self):
        date = self.cleaned_data['date']
        today = timezone.now().date()
        if date < today:
            raise ValidationError("Date cannot be in the past")
        if date > today + timezone.timedelta(days=30):
            raise ValidationError("Date cannot be more than 30 days in the future")
        return date

    def clean_time(self):
        time = self.cleaned_data['time']
        if not (10 <= time.hour < 22):
            raise ValidationError("Time must be between 10:00 AM and 10:00 PM")
        return time



class RegistrationForm(UserCreationForm):
    username = forms.CharField(
        label=("Enter user name"),
        widget=forms.TextInput(attrs={"class": "form-control border-primary", "placeholder":"Enter User name"}),
    )
    first_name = forms.CharField(
        label=("Enter first name"),
        widget=forms.TextInput(attrs={"class": "form-control border-primary", "placeholder":"Enter first name"}),
    )
    last_name = forms.CharField(
        label=("Enter last name"),
        widget=forms.TextInput(attrs={"class": "form-control border-primary", "placeholder":"Enter last name"}),
    )
    email = forms.CharField(
        label=("Enter email-id"),
        widget=forms.EmailInput(attrs={"class": "form-control border-primary", "placeholder":"Enter email-id"}),
    )
    mobile = forms.CharField(
        label=("Enter contact number"),
        widget=forms.NumberInput(attrs={"class": "form-control border-primary", "placeholder":"Enter Contact number"}),
    )
    address = forms.CharField(
        label=("Enter Address"),
        widget=forms.Textarea(attrs={"class": "form-control border-primary", "placeholder":"Enter Address"}),
    )
    password1=forms.CharField(
        label=("Enter Password"),
        widget=forms.PasswordInput(attrs={"class": "form-control border-primary", "placeholder":"Enter Password"})
    )
    password2=forms.CharField(
        label=("Enter Confirm Password"),
        widget=forms.PasswordInput(attrs={"class": "form-control border-primary","placeholder":"Confirm password" }),
    )


    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'mobile', 'password1', 'password2']

class MyLogFrm(AuthenticationForm):
    username = forms.CharField(
        label=("Enter user name"),
        widget=forms.TextInput(attrs={"class": "form-control border-primary", "placeholder":"Enter user name" }),
    )
    password=forms.CharField(
        label=("Enter Password"),
        widget=forms.PasswordInput(attrs={"class": "form-control border-primary", "placeholder":"Enter password"}),
    )
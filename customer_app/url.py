from django.contrib import admin
from django.urls import path,include
from customer_app import views


urlpatterns = [
    
    path('',views.index,name="index"),
    path('booking/',views.booking,name="booking"),
    path('services/',views.services,name="services"),
    path('work/',views.work,name="work"),
    path('contact/',views.contact,name="contact"),
    path('view/<id>',views.view,name="view"),
    path('book/<id>',views.book,name="book"),
    path('packagebookingaction/',views.packagebookingaction,name="packagebookingaction"),
    path('bookingaction/<id>',views.bookingaction,name="bookingaction"),
    path('appoinmentbookingaction',views.appoinmentbookingaction,name="appoinmentbookingaction")

]

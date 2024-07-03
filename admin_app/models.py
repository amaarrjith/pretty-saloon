from django.db import models

# Create your models here.

class Categories(models.Model):
    categoryid = models.AutoField(primary_key=True)
    categoryname = models.CharField(max_length=100)
    categoryimage = models.ImageField(upload_to="images/")
    categorydescription = models.CharField(max_length=100)
    
class SubCategories(models.Model):
    subcategoryid = models.AutoField(primary_key=True)
    categoryid = models.IntegerField()
    subcategoryname = models.CharField(max_length=100)
    subcategorydescription = models.TextField()
    rate = models.IntegerField()
    
class Beauticians(models.Model):
    beauticianid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    role = models.CharField(max_length=50)
    description = models.TextField()
    image = models.ImageField(upload_to="images/")
    
class Package(models.Model):
    packageid = models.AutoField(primary_key=True)
    packagename = models.CharField(max_length=50)
    packagerate = models.IntegerField()
    
class PackageList(models.Model):
    packagelistid= models.AutoField(primary_key=True)
    packageid = models.IntegerField()
    subcategoryname = models.CharField(max_length=50)

class PackageBooking(models.Model):
    bookingid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    phone = models.CharField(max_length=50)
    date = models.DateField()
    time = models.TimeField()
    packagename = models.CharField(max_length=50)
    packagerate = models.IntegerField()
    status = models.CharField(max_length=50)
    
class adminuser(models.Model):
    adminid = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    adminame = models.CharField(max_length=50)
    

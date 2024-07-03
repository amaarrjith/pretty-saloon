from django.db import connection
from django.shortcuts import redirect, render
from admin_app.models import Categories,SubCategories,Beauticians,Package,PackageBooking
from django.contrib import messages
from datetime import datetime



# Create your views here.

def index(request):
    Categories_DropDown = Categories.objects.all()
    SubCategories_DropDown1 = SubCategories.objects.filter(categoryid=1)
    SubCategories_DropDown2 = SubCategories.objects.filter(categoryid=2)
    Members_View = Beauticians.objects.all()
    Package_View = Package.objects.all()
    joined_data = []  # Initialize joined_data here
   
    # Iterate over each object and append the results to joined_data
    for package in Package_View:
        packageid = package.packageid
        with connection.cursor() as cursor:
            query = """
            SELECT * FROM admin_app_packagelist where packageid  = %s
            """
            cursor.execute(query, [packageid])  # Pass packageid as a parameter
            joined_data += cursor.fetchall()  # Append results to joined_data
    
     
    return render(request,"index/index.html",{"categories":Categories_DropDown,"subcategory1":SubCategories_DropDown1,"subcategory2":SubCategories_DropDown2,"members":Members_View,"package":Package_View,"package_list":joined_data})

def contact(request):
    return render(request,"index/contact.html")

def booking(request):
    Categories_Dropdown = Categories.objects.all()
    
    return render (request,"index/appoinment_booking.html",{"categories":Categories_Dropdown})

def services(request):
    Categories_DropDown = Categories.objects.all()
    print(Categories_DropDown)
    print("Hi")
    return render (request,"index/about.html",{"categories":Categories_DropDown})

def work(request):
    return render (request,"index/work.html")

def view(request,id):
    categoryid = id
    SubCategoriesList = SubCategories.objects.filter(categoryid=categoryid)
    
    return render (request,"index/about.html",{"subcategories":SubCategoriesList})
    
def book(request,id):
       packageid = id
       PackageView = Package.objects.filter(packageid=packageid)
       return render(request,"index/book.html",{"package":PackageView})
   
def packagebookingaction(request):
    if request.method == "POST":
        name = request.POST.get('name')
        phone = request.POST.get('phone')
        date_str = request.POST.get('date')
        date_obj = datetime.strptime(date_str, '%m/%d/%Y').strftime('%Y-%m-%d')
        time = request.POST.get('time')
        package_name = request.POST.get('packagename')
        package_rate = request.POST.get('packagerate')
        status = request.POST.get('status')
        
        package = PackageBooking()
        
        package.name = name
        package.phone = phone
        package.date = date_obj
        package.time = time
        package.packagename = package_name
        package.packagerate = package_rate
        package.status = status
        package.save()
        return redirect('index')
    
def bookingaction(request,id):
    subcategoryid = id
    subcategory_view = SubCategories.objects.filter(subcategoryid=subcategoryid)
    for item in subcategory_view:
        print(item.rate)
        print(item.subcategoryname)
        
    print(subcategory_view)
    return render (request,"index/booking.html",{"subcategory":subcategory_view})

def appoinmentbookingaction(request):
    if request.method == "POST":
        name = request.POST.get('name')
        phone = request.POST.get('phone')
        date_str = request.POST.get('date')
        date_obj = datetime.strptime(date_str, '%m/%d/%Y').strftime('%Y-%m-%d')
        time = request.POST.get('time')
        
        status = "booked"
        
        package = PackageBooking()
        
        package.name = name
        package.phone = phone
        package.date = date_obj
        package.time = time
        package.packagename = "NULL"
        package.packagerate = 0
        package.status = status
        package.save()
        
        
        
        return redirect('index')
from django.shortcuts import redirect, render
from admin_app.models import Categories,SubCategories,Beauticians,PackageBooking
from admin_app.models import Package,PackageList,adminuser
from django.db import connection
from datetime import datetime
from django.contrib import messages




# Create your views here.

def index(request): 
    
    with connection.cursor() as cursor:
        query = """ SELECT COUNT(*) , SUM(packagerate) FROM admin_app_packagebooking """
        cursor.execute(query)
        result = cursor.fetchall()
        
        query1 = """ SELECT COUNT(*) , SUM(packagerate) FROM admin_app_packagebooking WHERE date = %s """
        current_date = datetime.today().date()
        cursor.execute(query1,[current_date])
        result1 = cursor.fetchall()
        
        query2 = """SELECT COUNT(*)  FROM admin_app_packagebooking WHERE date = %s AND status = "booked" """
        cursor.execute(query2,[current_date])
        result2 = cursor.fetchall()
        
    packageview = PackageBooking.objects.all()    
    adminame = request.session.get('adminame')
    
    context = {"adminame":adminame,"package":packageview,"result":result,"result1":result1,"result2":result2}
    
    return render (request,"admin/index.html",context)

def CategoryRegister(request):
    return render (request,"admin/categoryregister.html")

def CategoryRegisterAction(request):
    if request.method == "POST":
        categoryname = request.POST.get('categoryname')
        categoryimage = request.FILES.get('categoryimage')
        categorydescription = request.POST.get('categorydescription')
        
        
        category = Categories()
        category.categoryname = categoryname
        category.categoryimage = categoryimage
        category.categorydescription = categorydescription
        category.save()
        return render(request,"admin/index.html")
        
def SubCategoryRegistration(request):
    if request.method == "POST":
        categoryid = request.POST.get('categoryid')   
        subcategoryname = request.POST.get('subcategoryname')   
        rate = request.POST.get('rate')
        description = request.POST.get('description')
        subcategory = SubCategories()
        subcategory.categoryid = categoryid
        subcategory.subcategoryname = subcategoryname
        subcategory.rate = rate
        subcategory.subcategorydescription = description
        subcategory.save()
        return render(request,"admin/index.html")
    
def SubCategoryRegister(request):
    Categories_DropDown = Categories.objects.all()
    return render (request,"admin/subcategoryregister.html",{"categories":Categories_DropDown})

def tables(request):
    with connection.cursor() as cursor:
        query = """
        SELECT * FROM admin_app_subcategories s INNER JOIN admin_app_categories c ON s.categoryid = c.categoryid
        """
        cursor.execute(query)
        joined_data = cursor.fetchall()
        print(joined_data)
    
    # Fetch Categories using Django ORM
    categories_dropdown = Categories.objects.all()
    
    return render(request, "admin/tables.html", {"categories": categories_dropdown, "subcategory": joined_data})

def tableaction(request):
    joined_data = []  # Initialize joined_data here
    
    if request.method == "POST":
        categoryid = request.POST.get('categoryid')
        
        with connection.cursor() as cursor:
            query = """
            SELECT * FROM admin_app_subcategories s INNER JOIN admin_app_categories c ON s.categoryid = c.categoryid WHERE c.categoryid = %s
            """
            cursor.execute(query, [categoryid])  # Pass categoryid as a parameter
            joined_data = cursor.fetchall()
            print(joined_data)
    
    # Fetch Categories using Django ORM
    categories_dropdown = Categories.objects.all()
    
    return render(request, "admin/tables.html", {"categories": categories_dropdown, "subcategory": joined_data})

def register(request):
    return render (request,"admin/member.html")

def memberregisteraction(request):
    if request.method == "POST":
        name = request.POST.get('name')
        role = request.POST.get('role')
        description = request.POST.get('description')
        image = request.FILES.get('image')
        
        member = Beauticians()
        
        member.name = name
        member.role = role
        member.description = description
        member.image = image
        member.save()
        
        return render (request,"admin/index.html")
    
def package_entry(request):
    PackageDropDown = Package.objects.all()
    SubCategoriesDropDown = SubCategories.objects.all()
    return render (request,"admin/package.html",{"package":PackageDropDown,"subcategories":SubCategoriesDropDown})
    
def packageaction(request):
    if request.method == "POST":
        packagename = request.POST.get('name')
        packagerate = request.POST.get('rate')
        package = Package()
        
        package.packagename = packagename
        package.packagerate = packagerate
        package.save()
        
        return render (request,"admin/index.html")


def packagelistaction(request):
    if request.method == "POST":
        packageid = request.POST.get('package')
        subcategory = request.POST.get('subcategory')
        
        packagelist = PackageList()
        
        packagelist.packageid = packageid
        packagelist.subcategoryname = subcategory
        packagelist.save()
        
        return render (request,"admin/index.html")

def packagelistdelete(request,id):
    packagelist = PackageList.objects.get(packagelistid=id)
    packagelist.delete()
    
    return redirect('packageview')

def buttonaction(request,id):
    bookingid = id
    bookingview = PackageBooking.objects.get(bookingid=bookingid)
    
    bookingview.status = "done"
    bookingview.save()
    return index(request)

def dateaction(request):
    if request.method == "POST":
        date = request.POST.get('date')
        print(date)
        packageview = PackageBooking.objects.filter(date=date)
        print(packageview)
        with connection.cursor() as cursor:
            query = """ SELECT COUNT(*) , SUM(packagerate) FROM admin_app_packagebooking """
            cursor.execute(query)
            result = cursor.fetchall()
        
            query1 = """ SELECT COUNT(*)  FROM admin_app_packagebooking WHERE date = %s """
            current_date = datetime.today().date()
            cursor.execute(query1,[current_date])
            result1 = cursor.fetchall()
            
            query2 = """SELECT COUNT(*)  FROM admin_app_packagebooking WHERE date = %s AND status = "booked" """
            cursor.execute(query2,[current_date])
            result2 = cursor.fetchall()
        return render (request,"admin/index.html",{"package":packageview,"result":result,"result1":result1,"result2":result2})
        
def adminlogin(request):
    return render(request,"admin/login-2.html")

def adminloginaction(request):
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username)
        print(password)
        
        if adminuser.objects.filter(username=username,password=password).exists():
            admin_objects = adminuser.objects.get(username=username,password=password)
            request.session['adminame'] = admin_objects.adminame
            request.session['username'] = admin_objects.username
            return index(request)
        
        else:
            messages.success(request,'Login Failed! Check Username or Password!')
            return render(request,"admin/login-2.html")
        
def logoutaction(request):
        request.session.flush() 
        return adminlogin(request)
        
def packageview(request):
    packageview = Package.objects.all()
    sql_query = "SELECT * FROM `admin_app_packagelist` p INNER JOIN admin_app_package a ON p.packageid = a.packageid"
    result = PackageList.objects.raw(sql_query)
    data = [
        {
            'packagename':item.packagename,
            'subcategoryname':item.subcategoryname,
            'packagelistid':item.packagelistid
        }
        for item in result
    ]
    return render (request,"admin/packageview.html",{"packageview":packageview,"packagelist":data})
        
def packageviewaction(request):
    if request.method == "POST":
        packageid = request.POST.get('packageid')
        sql_query = "SELECT * FROM `admin_app_packagelist` p INNER JOIN admin_app_package a ON p.packageid = a.packageid WHERE a.packageid=%s"
        result = PackageList.objects.raw(sql_query,[packageid])
        data = [
            {
                'packagename':item.packagename,
                'subcategoryname':item.subcategoryname,
                'packagelistid':item.packagelistid
            }
            for item in result
        ]
        
        packageview = Package.objects.all()
        return render(request,"admin/packageview.html",{"packagelist":data,"packageview":packageview})
    
def packagelistedit(request,id):
    sql_query = "SELECT * FROM admin_app_packagelist pl INNER JOIN admin_app_package p ON pl.packageid = p.packageid where pl.packagelistid=%s"
    result = PackageList.objects.raw(sql_query,[id])
    data = [
        {
            'packagelistid':item.packagelistid,
            'packageid':item.packageid,
            'packagename':item.packagename,
            'packagerate':item.packagerate,
            'subcategoryname':item.subcategoryname
        }
        for item in result
    ]
    packagelist = Package.objects.all()
    subcategorylist = SubCategories.objects.all()
    return render(request,"admin/packagelistedit.html",{"data":data,"packagelist":packagelist,"subcategory":subcategorylist})

def packageedit(request,id):
    packagelist = Package.objects.filter(packageid=id)
    return render(request,"admin/packageedit.html",{"packagelist":packagelist})

def packageeditaction(request,id):
    if request.method == "POST":
        packageid = id
        packagename = request.POST.get('name')
        packagerate = request.POST.get('rate')
        packagelist = Package.objects.get(packageid=id)
        
        packagelist.packagename = packagename
        packagelist.packagerate = packagerate
        packagelist.save()
        
        return redirect('packageview')
    
def packagedelete(request,id):
    packagelist = Package.objects.get(packageid=id)
    packagelist.delete()
    
    return redirect('packageview')

def categorydelete(request,id):
    categoryid=id
    categorylist = Categories.objects.get(categoryid=categoryid)
    categorylist.delete()
    
    return redirect('table')

def categoryedit(request,id):
    categoryid = id
    categorylist = Categories.objects.filter(categoryid=categoryid)
    
    return render(request,"admin/categoryedit.html",{"categorylist":categorylist})

def subcategoryedit(request,id):
    subcategoryid = id
    subcategorylist = SubCategories.objects.filter(subcategoryid=subcategoryid)
    categorylist = Categories.objects.all()
    return render(request,"admin/subcategoryedit.html",{"subcategorylist":subcategorylist,"categorylist":categorylist})

def subcategorydelete(request,id):
    subcategoryid=id
    subcategorylist = SubCategories.objects.get(subcategoryid=subcategoryid)
    subcategorylist.delete()
    
    return redirect('table')

def categoryeditaction(request,id):
    if request.method == "POST":
        print(id)
        categoryid = id
        categoryname = request.POST.get('name')
        categorydescription = request.POST.get('description')
        categoryimage = request.FILES.get('categoryimage')
        
        categorylist = Categories.objects.get(categoryid=categoryid)
        
        if categoryimage:
            categorylist.categoryimage = categoryimage
        
        categorylist.categoryname = categoryname
        categorylist.categorydescription = categorydescription
        categorylist.save()
        return redirect('table')
    
def subcategoryeditaction(request,id):
    if request.method == "POST":
        subcategoryid = id
        categoryid = request.POST.get('categoryid')
        subcategoryname = request.POST.get('subcategoryname')
        subcategorydescription = request.POST.get('description')
        subcategoryrate = request.POST.get('rate')
        
        subcategorylist = SubCategories.objects.get(subcategoryid=subcategoryid)
        subcategorylist.categoryid = categoryid
        subcategorylist.subcategoryname = subcategoryname
        subcategorylist.subcategorydescription = subcategorydescription
        subcategorylist.rate = subcategoryrate
        subcategorylist.save()
        
        return redirect('table')
    
def staffview(request):
    stafflist = Beauticians.objects.all()
    return render (request,"admin/staffview.html",{"stafflist":stafflist})

def staffdelete(request,id):
    stafflist = Beauticians.objects.get(beauticianid=id)
    stafflist.delete()
    return redirect('staffview')

def staffedit(request,id):
    stafflist = Beauticians.objects.filter(beauticianid=id)
    return render (request,"admin/staffedit.html",{"stafflist":stafflist})

def staffeditaction(request,id):
    if request.method == "POST":
        name = request.POST.get('name')
        role = request.POST.get('role')
        description = request.POST.get('description')
        image = request.FILES.get('image')
        
        
        stafflist = Beauticians.objects.get(beauticianid=id)
        
        if image:
            stafflist.image = image
            
        stafflist.name = name
        stafflist.role = role
        stafflist.description = description
        
        
        
        stafflist.save()
        
        return redirect ('staffview')
    
def packagelisteditaction(request,id):
    if request.method == "POST":
        packagename = request.POST.get('package')
        subcategory = request.POST.get('subcategory')
        
        packagelist = PackageList.objects.get(packagelistid=id)
        packagelist.packageid = packagename
        packagelist.subcategoryname = subcategory
        packagelist.save()
        
        return redirect ('adminindex')
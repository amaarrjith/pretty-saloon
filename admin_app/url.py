from django.contrib import admin
from django.urls import path,include
from admin_app import views


urlpatterns = [
    
    path('',views.index,name="adminindex"),
    path('categoryregister/',views.CategoryRegister,name="categoryregister"),
    path('categoryregisteraction',views.CategoryRegisterAction,name="categoryregisteraction"),
    path('subcategoryregister/',views.SubCategoryRegister,name="subcategoryregister"),
    path('subcategoryregisteraction/',views.SubCategoryRegistration,name="subcategoryregisteraction"),
    path('tables/',views.tables,name="table"),
    path('tableaction/',views.tableaction,name="tableaction"),
    path('register/',views.register,name="register"),
    path('memberregisteraction/',views.memberregisteraction,name="memberregisteraction"),
    path('package_entry/',views.package_entry,name="package_entry"),
    path('packageaction/',views.packageaction,name="packageaction"),
    path('packagelistaction/',views.packagelistaction,name="packagelistaction"),
    path('buttonaction/<id>',views.buttonaction,name="buttonaction"),
    path('dateaction/',views.dateaction,name="dateaction"),
    path('adminlogin/',views.adminlogin,name="adminlogin"),
    path('adminloginaction/',views.adminloginaction,name="adminloginaction"),
    path('logoutaction/',views.logoutaction,name="logoutaction"),
    path('packageview/',views.packageview,name="packageview"),
    path('packageviewaction/',views.packageviewaction,name="packageviewaction"),
    path('packagelistedit/<id>',views.packagelistedit,name="packagelistedit"),
    path('packagelistdelete/<id>',views.packagelistdelete,name="packagelistdelete"),
    path('packageedit/<id>',views.packageedit,name="packageedit"),
    path('packageeditaction/<id>',views.packageeditaction,name="packageeditaction"),
    path('packagedelete/<id>',views.packagedelete,name="packagedelete"),
    path('categorydelete/<id>',views.categorydelete,name="categorydelete"),
    path('categoryedit/<id>',views.categoryedit,name="categoryedit"),
    path('subcategoryedit/<id>',views.subcategoryedit,name="subcategoryedit"),
    path('subcategorydelete/<id>',views.subcategorydelete,name="subcategorydelete"),
    path('categoryeditaction/<id>',views.categoryeditaction,name="categoryeditaction"),
    path('subcategoryeditaction/<id>',views.subcategoryeditaction,name="subcategoryeditaction"),
    path('staffview',views.staffview,name="staffview"),
    path('staffdelete/<id>',views.staffdelete,name="staffdelete"),
    path('staffedit/<id>',views.staffedit,name="staffedit"),
    path('staffeditaction/<id>',views.staffeditaction,name="staffeditaction"),
    path('packagelisteditaction/<id>',views.packagelisteditaction,name="packagelisteditaction")
    
]


from django.contrib import admin
from django.urls import path
from website import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [

    path('',views.homepage,name='homepage'),

    path('forgot_password/',views.forgotpassword,name='forgotpassword'),

    path('mail_send/',views.forgotpassword_done,name='forgotpassword_done'),

    path('login/',views.login,name='login'),

    path('register/',views.register,name='register'),

    path('cpassword/',views.cpassword,name='cpassword'),

    path('changepass2/<int:id>/',views.changepass2,name='changepass2'),

    path('editprofile/',views.editprofile,name='editprofile'),

    path('editpro/<int:id>/',views.editpro,name='editpro'),

    path('search_result/',views.search_result,name='search_result'),

    path('product_page/<int:id>/',views.product_page,name='product_page'),

    path('product_page/single_product/<int:id>/',views.single_product,name='single_product'),

    path('cart/',views.cartt,name='cartt'),

    path('cart_delete/<int:id>/',views.cartt_delete,name='cartt_delete'),

    path('checkout/',views.checkout,name='checkout'),

    path('placeorder/',views.placeorder,name='placeorder'),

    path('order/',views.order,name='order'),

    path('feedback/',views.feedback,name='feedback'),

    path('about_us/',views.about,name='about'),

    path('feedback_submitted/',views.feedback_insert,name='feedback_insert'),

    path('logout/',views.logout,name='logout'),

    path('admin_login/',views.admin_login,name='admin_login'),

    path('dashboard/',views.index,name='index'),

    path('customer_table/',views.customer_table,name='customer_table'),

    path(r'^export/xls/$', views.category_xls, name='category_xls'),

    path('customer_block/<int:id>/',views.customer_block,name='customer_block'),

    path('customer_unblock/<int:id>/',views.customer_unblock,name='customer_unblock'),

    path('customer_delete/<int:id>/',views.customer_delete,name='customer_delete'),

    path('category_table/',views.category_table,name='category_table'),

    path('category_table/category_insert/',views.category_insert,name='category_insert'),

    path('category_table/category_edit/<int:id>/',views.category_edit,name='category_edit'),

    path('category_table/category_update/<int:id>/',views.category_update,name='category_update'),

    path('category_delete/<int:id>/',views.category_delete,name='category_delete'),

    path('product_table/',views.product_table,name='product_table'),

    path('product_table/product_insert/',views.product_insert,name='product_insert'),

    path('product_table/product_edit/<int:id>/',views.product_edit,name='product_edit'),

    path('product_table/product_update/<int:id>/',views.product_update,name='product_update'),

    path('product_delete/<int:id>/',views.product_delete,name='product_delete'),

    path('product_table/product_image/<int:id>/',views.product_image,name='product_image'),

    path('product_imageupload/',views.product_imageupload,name='product_imageupload'),

    path('product_imagedelete/<int:id>/',views.product_imagedelete,name='product_imagedelete'),

    path('cart_table/',views.cart_table,name='cart_table'),

    path('order_table/',views.order_table,name='order_table'),

    path('delivered/<int:id>/',views.delivered,name='delivered'),

    path('paid/<int:id>/',views.paid,name='paid'),

    path('cancel/<int:id>/',views.cancel,name='cancel'),

    path('feedback_table/',views.feedback_table,name='feedback_table'),

    path('changepassword/',views.changepassword,name='changepassword'),

    path('changepass/<int:id>/',views.changepass,name='changepass'),

    path('logout',views.admin_logout,name='admin_logout'),

]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
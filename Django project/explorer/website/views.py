from django.shortcuts import render,redirect
import xlwt
from django.http import HttpResponse
import random
from django.utils.crypto import get_random_string
from .models import *
from django.contrib import messages
from django.contrib.sessions.models import Session
from .forms import *
from django.core.files.storage import FileSystemStorage
from datetime import datetime, date
from django.db.models import Q
from django.core.mail import EmailMessage #email
from django.core import mail
connection = mail.get_connection()  

# Create your views here.

def homepage(request):
    catread = category.objects.all()
    pd = product.objects.raw('select * from website_product wp,website_gallery wg WHERE wp.p_id = wg.p_id group BY wg.p_id order by created_date desc limit 9') 
    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        return render(request, 'index.html',{"category":catread,"cust":cust,"product":pd})
    return render(request, 'index.html',{"category":catread,"product":pd})

def forgotpassword(request):
    if request.method == "POST":
        email1 = request.POST['email']
        if customer.objects.filter(email=email1).exists():
            pw=customer.objects.get(email=email1)
            email2 = mail.EmailMessage(
				  	'The Explorer',
				    'Your Password is:-'  +str(pw.password)+ '\n Do not share with any one. click to below link for login' '\n http://127.0.0.1:8000/login/' ,
				    'settings.EMAIL_HOST_USER',
				    [email1],
				   	connection=connection,
					)
            email2.send()
            return render(request, 'forgotpassword_done.html')
        else:
            messages.error(request,'Mail address is not register yet...!')
            return render(request, 'forgotpassword.html')
    return render(request, 'forgotpassword.html')

def forgotpassword_done(request):
    return render(request, 'forgotpassword_done.html')

def login(request):
    catread = category.objects.all()
    if request.session.has_key('is_logged_cust'):
         return redirect('homepage')

    if request.POST:
        email = request.POST['email']
        password = request.POST['password']
        is_block = '0'

         #Select * From customer
        count = customer.objects.filter(email=email,password=password,is_block=is_block).count()
        if count > 0:
            request.session['is_logged_cust'] = email
            return redirect('homepage')
        else:
            messages.error(request,'Invalid Email or Password else You are blocked')
    return render(request, 'login.html',{"category":catread})

def register(request):
    if request.session.has_key('is_logged_cust'):
         return redirect('homepage')

    catread = category.objects.all()
    if request.method == "POST":
        cust_name = request.POST['name']
        email = request.POST['email']
        password = request.POST['password']
        gender = request.POST['gender']
        cpassword = request.POST['cpassword']
        dob = request.POST['dob']
        contact_no = request.POST['contact']
        gender = request.POST['gender']
        add = request.POST['add']
        city = request.POST['city']
        pincode = request.POST['pincode']

        if password == cpassword:
            if customer.objects.filter(email=email).exists():
                messages.info(request, 'Email is already taken')
                return redirect('register')
            else:
                cust = customer(cust_name=cust_name, email=email, password=password, gender=gender,is_admin=0,is_block=0,contact_no=contact_no,dob=dob,bill_pin=pincode,bill_add=add,bill_city=city)
                cust.save()
                return redirect('login')
        else:
            messages.info(request, 'Password Does Not Match')
            return render(request, 'register.html')
    return render(request, 'register.html',{"category":catread})

def cpassword(request):
    catread = category.objects.all()
    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        return render(request, 'cpassword.html',{"category":catread,"cust":cust})
    return render(request, 'login.html')

def changepass2(request, id):
    if request.method == "POST":
        oldpass = request.POST['opass']
        newpass = request.POST['npass']
        cpass = request.POST['cpass']

        if newpass == cpass:
            if customer.objects.filter(password=oldpass,cust_id=id).exists():
                cust=customer.objects.get(cust_id=id)
                cust.password=newpass
                cust.save()
                messages.info(request, 'Password changed Successfully !')
                return redirect('cpassword')
                
            else:
                messages.info(request, 'Old Password Does Not Match')
                return redirect('cpassword')         
        else:
            messages.info(request, 'New Password and Confirm Password is not same!')

    return redirect('cpassword')

def editprofile(request):
    catread = category.objects.all()
    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        return render(request, 'editprofile.html',{"category":catread,"cust":cust})
    return render(request, 'editprofile.html')

def editpro(request, id):
    if request.method == "POST":
        cust_name = request.POST['name']
        #dob = request.POST['dob']
        #gender = request.POST['gender']
        email = request.POST['email']
        contact = request.POST['contact']
        add = request.POST['add']
        city = request.POST['city']
        pincode = request.POST['pin']

        cust1 = customer.objects.get(cust_id=id)
        cust1.cust_name = cust_name
        #cust1.dob = dob
        #if(gender == Male):
        #    cust1.gender = 0
        #else:
        #   cust1.gender = 1
        cust1.email = email
        cust1.contact_no = contact
        cust1.bill_add = add
        cust1.bill_city = city
        cust1.bill_pin = pincode

        cust1.save()
    return redirect('editprofile')

def search_result(request):
    catread = category.objects.all()
    if request.method == 'POST':
        srch = request.POST.get('srh')

        if srch:
            match = product.objects.filter(Q(p_name__icontains=srch) | Q(p_desc__icontains=srch))
            if match:
                return render(request, 'search_result.html',{"category":catread,"sr":match})
            else:
                messages.error(request,'No result found')
        else:
            return redirect('homepage')
    
    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        return render(request, 'search_result.html',{"category":catread,"cust":cust, "sr":match})
    return render(request, 'search_result.html',{"category":catread,"sr":match})

def product_page(request, id):
    catread = category.objects.all()
    data = product.objects.raw('select * from website_product wp,website_gallery wg, website_category wc WHERE wp.p_id = wg.p_id AND wc.cat_id = wp.cat_id AND wp.cat_id = %d group BY wg.p_id'%id)
    context = {"category":catread, "product":data}
    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        return render(request, 'product_page.html',{"category":catread,"cust":cust,"product":data})
    return render(request, 'product_page.html',context)

def single_product(request, id):
    catread = category.objects.all()
    pd = product.objects.get(p_id=id)
    pimage = gallery.objects.filter(p_id=id)
    feed = feedback1.objects.raw('select * from website_feedback1 wf,website_customer wc, website_product wp WHERE wf.p_id = wp.p_id AND wf.cust_id = wc.cust_id AND wf.p_id = %d'%id)

    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        if request.method == "POST":
            custid = request.POST['custid']
            qty = request.POST['qty']
            if cart.objects.filter(p_id=id,cust_id=custid):
                messages.info(request, 'Already In Cart')
                return redirect('single_product',id=id)
            else:
                cart1 = cart(qty=qty, cust_id=custid, p_id=id)
                cart1.save()
                return redirect('cartt')
        return render(request, 'single_product.html',{"category":catread,"cust":cust,"product":pd,"gallery":pimage,"feed":feed})
    return render(request, 'single_product.html',{"category":catread, "product":pd, "gallery":pimage,"feed":feed})

def cartt(request):
    catread = category.objects.all()
    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        data=cart.objects.raw('select *,(wc.qty*wp.p_price) as "total" from website_cart wc,website_product wp where wc.p_id=wp.p_id and wc.cust_id=%d'%cust.cust_id)
        amount=0
        for i in data:
            amount=amount+i.total
        gst=amount*9/100
        gtotal=amount+gst

        return render(request, 'cart.html',{"category":catread,"cust":cust,"data":data,"amount":amount,"gst":gst,"gtotal":gtotal})
    else:
        return render(request, 'register.html')
    return render(request, 'cart.html',{"category":catread})

def cartt_delete(request,id):
    cart_del = cart.objects.get(pk=id)
    cart_del.delete()
    

def checkout(request):
    catread = category.objects.all()
    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        return render(request, 'checkout.html',{"category":catread,"cust":cust})
    else:
        return render(request, 'register.html')

    return render(request,'checkout.html',{"category":catread})

def placeorder(request):
    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        if request.method == "POST":
            add = request.POST['add']
            city = request.POST['city']
            pin = request.POST['pincode']
            number = random.randint(0000000, 9999999)
            data=cart.objects.raw('select *,(wc.qty*wp.p_price) as "total" from website_cart wc,website_product wp where wc.p_id=wp.p_id and wc.cust_id=%d'%cust.cust_id)

            for i in data:
                order2 = order1(qty=i.qty,t_amt=i.total,flag=number,ship_add=add,ship_city=city,ship_pin=pin,date=datetime.now(),order_status=2,payment_status=0,cust_id=cust.cust_id,p_id=i.p_id)
                order2.save()
                cartdel=cart.objects.get(cart_id=int(i.cart_id))
                cartdel.delete()
    else:
        return render(request, 'register.html')       

    return redirect('homepage')

def order(request):
    catread = category.objects.all()
    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        orderread = order1.objects.raw('select *,(wo.qty*wp.p_price) as "total" from website_order1 wo,website_product wp,website_customer wcs where wo.p_id=wp.p_id and wo.cust_id=wcs.cust_id and wo.cust_id=%d group BY wo.flag'%cust.cust_id)
        amount=0
        for i in orderread:
            amount=amount+i.total
        gst=amount*9/100
        gtotal=amount+gst
        return render(request, 'order.html',{"category":catread,"cust":cust,"ordr":orderread,"amount":amount,"gst":gst,"gtotal":gtotal})
    

def feedback(request):
    catread = category.objects.all()
    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        data=order1.objects.raw('select * from website_order1 wo,website_product wp where wo.p_id=wp.p_id and wo.cust_id=%d'%cust.cust_id)
        return render(request, 'feedback.html',{"category":catread,"cust":cust,"data":data})
    else:
        return render(request, 'register.html')

    return render(request,'feedback.html',{"category":catread})

def feedback_insert(request):
    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        if request.method == "POST":
            pname = request.POST['product']
            msg = request.POST['message']

            f = feedback1(feedback=msg,cust_id=cust.cust_id,p_id=pname)
            f.save()
    else:
        return render(request, 'register.html')       

    return redirect('homepage')

def about(request):
    catread = category.objects.all()
    if request.session.has_key('is_logged_cust'):
        cust=customer.objects.get(email=request.session['is_logged_cust'])
        return render(request, 'about.html',{"category":catread,"cust":cust})
    return render(request, 'about.html',{"category":catread})

def logout(request):
    del request.session['is_logged_cust']
    return redirect('login')

def admin_login(request):
    
    if request.session.has_key('is_logged'):
         return redirect('index')

    if request.POST:
        email = request.POST['email']
        password = request.POST['password']
        is_admin = '1'

         #Select * From customer
        count = customer.objects.filter(email=email,password=password,is_admin=is_admin).count()
        if count > 0:
            request.session['is_logged'] = True
            return redirect('index')
    return render(request, 'admin/admin_login.html')


def index(request):
    if request.session.has_key('is_logged'):
        cattotal=category.objects.raw('select count(cat_id) as nofc from website_category')
        return render(request, 'admin/index.html',{"cat":cattotal})
    return redirect('admin_login')


def customer_table(request):
    if request.session.has_key('is_logged'):
        context ={} 
        context["cust"] = customer.objects.all()
        return render(request, 'admin/customer_table.html', context)
    return redirect('admin_login')

def customer_block(request, id):
    if request.method == 'POST':
        cust=customer.objects.get(cust_id=id)
        cust.is_block=1
        cust.save()
    return redirect('customer_table') 

def customer_unblock(request, id):
    if request.method== 'POST':
        cust=customer.objects.get(cust_id=id)
        cust.is_block=0
        cust.save()
    return redirect('customer_table') 

def customer_delete(request, id):
    if request.method== 'POST':
        ci = customer.objects.get(pk=id)
        ci.delete()
    return redirect('customer_table')

 


def category_table(request):
    if request.session.has_key('is_logged'):
        catread = category.objects.all()
        return render(request, 'admin/category_table.html',{"category":catread})
    return redirect('admin_login')

def category_xls(request):
    response = HttpResponse(content_type='application/ms-excel')
    response['Content-Disposition'] = 'attachment; filename="Customer.xls"'

    wb = xlwt.Workbook(encoding='utf-8')
    ws = wb.add_sheet('Customer')

    # Sheet header, first row
    row_num = 0

    font_style = xlwt.XFStyle()
    font_style.font.bold = True

    columns = ['Name', 'Email', 'Contact no.', 'Address','City','Pincode', ]

    for col_num in range(len(columns)):
        ws.write(row_num, col_num, columns[col_num], font_style)

    # Sheet body, remaining rows
    font_style = xlwt.XFStyle()

    rows = customer.objects.all().values_list('cust_name', 'email', 'contact_no','bill_add','bill_city','bill_pin', )
    for row in rows:
        row_num += 1
        for col_num in range(len(row)):
            ws.write(row_num, col_num, row[col_num], font_style)

    wb.save(response)
    return response



def category_insert(request):
    if request.method=='POST':
        if request.POST.get('cat_name') and request.POST.get('cat_desc'):
            saverecord=category()
            saverecord.cat_name=request.POST.get('cat_name')
            saverecord.cat_desc=request.POST.get('cat_desc')
            saverecord.save()
            return redirect('category_table')
    else:
        return render(request, 'admin/category_insert.html')

def category_edit(request, id):
    if request.method== 'POST':
        cat_update=category.objects.get(cat_id=id)
        return render(request, 'admin/category_edit.html',{"category":cat_update})

def category_update(request, id):
    if request.method== 'POST':
        catupdate=category.objects.get(cat_id=id)
        form=cat_update(request.POST,instance=catupdate)
        if form.is_valid():
            form.save()
            return redirect('category_table')
            return render(request, 'admin/category_edit.html',{"category":catupdate})
        

def category_delete(request, id):
    if request.method== 'POST':
        di = category.objects.get(pk=id)
        di.delete()
    return redirect('category_table') 



def product_table(request):
    if request.session.has_key('is_logged'):
        context ={} 
        context["pd"] = product.objects.all()
        return render(request, 'admin/product_table.html', context)
    return redirect('admin_login')


def product_insert(request):
    catname = category.objects.all()
    today = date.today()
    if request.method=='POST':
        if request.POST.get('cat') and request.POST.get('p_name') and request.POST.get('p_price') and request.POST.get('p_desc'):
            saverecord=product()
            saverecord.p_name=request.POST.get('p_name')
            saverecord.p_price=request.POST.get('p_price')
            saverecord.p_desc=request.POST.get('p_desc')
            saverecord.cat_id=request.POST.get('cat')
            saverecord.created_date=today.strftime('%Y-%m-%d')
            saverecord.save()
            return redirect('product_table')
    else:
        return render(request, 'admin/product_insert.html',{"category":catname})

def product_edit(request, id):
    if request.method== 'POST':
        p_update=product.objects.get(p_id=id)
        return render(request, 'admin/product_edit.html',{"product":p_update})

def product_update(request, id):
    if request.method== 'POST':
        pdupdate=product.objects.get(p_id=id)
        form=p_update(request.POST,instance=pdupdate)
        if form.is_valid():
            form.save()
            return redirect('product_table')
            return render(request, 'admin/product_edit.html',{"product":pdupdate})

def product_delete(request):
    if request.method== 'POST':
        pi = product.objects.get(pk=id)
        pi.delete()
    return redirect('product_table')

def product_image(request, id):
    if request.method== 'POST':
        pd = product.objects.get(p_id=id)
        pimages = gallery.objects.filter(p_id=id)
    return render(request, 'admin/product_image.html',{"product":pd, "gallery":pimages})



def product_imageupload(request):
    if request.method == 'POST' and request.FILES['pimage']:
        pimage = request.FILES['pimage']
        fs = FileSystemStorage()
        filename = fs.save(pimage.name, pimage)
        url = fs.url(filename)
        new_profile = gallery(
            p_image = url,
            p_id = request.POST['pid']
        )
        new_profile.save()
        return redirect('product_table')

def product_imagedelete(request, id):
    if request.method== 'POST':
        gi = gallery.objects.get(pk=id)
        gi.delete()
    return redirect('product_table')

def cart_table(request):
    if request.session.has_key('is_logged'):
        cartread = cart.objects.raw('select *,(wc.qty*wp.p_price) as "total" from website_cart wc,website_product wp,website_customer wcs where wc.p_id=wp.p_id and wc.cust_id=wcs.cust_id')
        return render(request, 'admin/cart_table.html',{"cart":cartread})
    return redirect('admin_login')

  
def order_table(request):
    if request.session.has_key('is_logged'):
        orderread = order1.objects.raw('select *,(wo.qty*wp.p_price) as "total" from website_order1 wo,website_product wp,website_customer wcs where wo.p_id=wp.p_id and wo.cust_id=wcs.cust_id')
        return render(request, 'admin/order_table.html',{"order":orderread})
    return redirect('admin_login')

def delivered(request, id):
    order2=order1.objects.get(order_id=id)
    order2.order_status=0
    order2.save()
    return redirect('order_table')

def cancel(request, id):
    order2=order1.objects.get(order_id=id)
    order2.order_status=1
    order2.save()
    return redirect('order')

def paid(request, id):
    order2=order1.objects.get(order_id=id)
    order2.payment_status=1
    order2.save()
    return redirect('order_table')

def feedback_table(request):
    if request.session.has_key('is_logged'):
        feedread = feedback1.objects.raw('select * from website_feedback1 wf,website_product wp,website_customer wcs where wf.p_id=wp.p_id and wf.cust_id=wcs.cust_id')
        return render(request, 'admin/feedback_table.html',{"feed":feedread})
    return redirect('admin_login')

def changepassword(request):
    return render(request, 'admin/changepass.html')
    
def changepass(request, id):
    if request.method == "POST":
        oldpass = request.POST['oldpass']
        newpass = request.POST['newpass']
        cpass = request.POST['cpass']

        if newpass == cpass:
            if customer.objects.filter(password=oldpass,cust_id=id).exists():
                cust=customer.objects.get(cust_id=id)
                cust.password=newpass
                cust.save()
                messages.info(request, 'Password changed Successfully !')
                return redirect('changepass')
                
            else:
                messages.info(request, 'Old Password Does Not Match')
                return redirect('changepass')         
        else:
            messages.info(request, 'New Password and Confirm Password is not same!')

    return redirect('changepass')

def admin_logout(request):
    del request.session['is_logged']
    return redirect('admin_login')




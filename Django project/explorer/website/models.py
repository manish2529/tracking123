from django.db import models

# Create your models here.



class customer(models.Model):
    cust_id = models.AutoField(primary_key=True)
    cust_name = models.CharField(max_length=30,null=False,default='')
    contact_no = models.CharField(max_length=10,null=False,default='')
    dob = models.DateField(null=False)
    email = models.EmailField(max_length=50,null=False,default='')
    password = models.CharField(max_length=12,null=False,default='')
    gender = models.BooleanField(null=False,default='0')
    bill_add = models.CharField(max_length=255,null=True)
    bill_city = models.CharField(max_length=30,null=True)
    bill_pin = models.IntegerField(null=True)
    is_admin = models.BooleanField(null=False,default='0')
    is_block = models.BooleanField(null=False,default='0')

class category(models.Model):
    cat_id = models.AutoField(primary_key=True)
    cat_name = models.CharField(max_length=20,null=False,default='')
    cat_desc = models.CharField(max_length=250,null=True)
    class Meta:
        db_table:"explorer_category"

class product(models.Model):
    p_id = models.AutoField(primary_key=True)
    cat = models.ForeignKey(category, on_delete=models.CASCADE)
    p_name = models.CharField(max_length=50,null=False,default='')
    p_price = models.IntegerField(null=False)
    p_desc = models.CharField(max_length=250,null=True)
    p_image = models.URLField(null=True,default="/web")
    created_date = models.DateField(null=False)

class gallery(models.Model):
    g_id = models.AutoField(primary_key=True)
    p = models.ForeignKey(product, on_delete=models.CASCADE)
    p_image = models.URLField()

class cart(models.Model):
    cart_id = models.AutoField(primary_key=True)
    p = models.ForeignKey(product, on_delete=models.CASCADE)
    cust = models.ForeignKey(customer, on_delete=models.CASCADE)
    qty =  models.IntegerField(null=False)

class order1(models.Model):
    order_id = models.AutoField(primary_key=True)
    p = models.ForeignKey(product, on_delete=models.CASCADE)
    cust = models.ForeignKey(customer, on_delete=models.CASCADE)
    qty =  models.IntegerField(null=False)
    t_amt = models.IntegerField(null=False)
    flag = models.IntegerField(null=False)
    ship_add = models.CharField(max_length=255,null=True)
    ship_city = models.CharField(max_length=30,null=True)
    ship_pin = models.IntegerField(null=True)
    date = models.DateTimeField(null=False)
    order_status = models.IntegerField(null=False,default='2')
    payment_status = models.BooleanField(null=False,default='0')

class feedback1(models.Model):
    f_id = models.AutoField(primary_key=True)
    p = models.ForeignKey(product, on_delete=models.CASCADE)
    cust = models.ForeignKey(customer, on_delete=models.CASCADE)
    feedback =  models.CharField(max_length=255,null=False)

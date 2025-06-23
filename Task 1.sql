create database ecommerceDB;
use ecommerceDB;
/* Customer Table*/
create table customers(
cust_id int auto_increment primary key,
cust_name varchar(100) Not Null,
Email varchar(50) unique,
Phone varchar(50),
Address text
);
/* Categories Table*/
create table categories(
category_id int auto_increment primary key,
category_name varchar(50) not null);

/*Product Table*/
create table product(
product_id int auto_increment primary key,
product_name varchar(100) Not Null,
Description text,
price decimal(10,2) not null,
stock int not null,
category_id int,
foreign key(category_id) references categories(category_id));

/*order Table*/

create table orders(
order_id int auto_increment primary key,
cust_id int,
Total_amount decimal(10,2),
status varchar(30),
foreign key(cust_id) references customers(cust_id));

/*order items*/

create table orderitems(
order_id int,
product_id int,
quantity int,
price decimal(10,2),
primary key(order_id, product_id),
foreign key(order_id) references orders(order_id),
foreign key(product_id) references product(product_id));

/*Payment Table*/
create table payment(
pay_id int auto_increment primary key,
order_id int,
pay_date datetime default current_timestamp,
Amount Decimal(10,2),
Paymentmethod varchar(50),
foreign key(order_id) references orders(order_id));





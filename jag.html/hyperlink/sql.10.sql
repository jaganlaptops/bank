drop database dml;

create database dml;

use dml;

/*
Exercise1:
Create a table named "products" with the following columns:

product_id (integer, primary key)
product_name (varchar, max length 100)
category (varchar, max length 50)
price (decimal, precision 10, scale 2)
stock_quantity (integer)
*/

create table products(
	product_id int not null primary key,
    product_name varchar(100),
    category varchar(50),
    price decimal(10, 2),
    stock_quantity int
);

desc products;

/*Exercise2:
Insert a single product with specific values [201, 'Smartphone', 'Electronics', 599.99, 100]:
*/

insert into products values(201, 'Smartphone', 'Electronics', 599.99, 100);


/*Exercise3:
Insert multiple products with specific values:
    (202, 'Power Drill', 'Hardware', 79.99, 50),
    (203, 'Designer Jeans', 'Apparel', 89.99, 75),
    (204, 'Bluetooth Speaker', 'Electronics', 39.99, 200)
*/

insert into products values
(202, 'Power Drill', 'Hardware', 79.99, 50),
(203, 'Designer Jeans', 'Apparel', 89.99, 75),
(204, 'Bluetooth Speaker', 'Electronics', 39.99, 200);
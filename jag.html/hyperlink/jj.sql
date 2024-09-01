create database batch_852;

use batch_852;

create table products(
product_id int,
product_name varchar(50),
price double,
stock int,
re_order_level int
);

insert into products values(1, 'pen', 10.50, 1000 , 200);


insert into products(product_name, price, stock, re_order_level) 
values('Pencil', 7.50, 3000, 400);

insert into products values(null, 'Pen', 10.50, 1000, 200);


insert into products values(2, null, 5.00, 3000, 525);

insert into products values(2, 'Mobile', 25000, 5, 1);

insert into products values(3, 'T.V', null, 4, 0);

insert into products values(3, 'Fan', 7500, 40, 8);



select * from products;


-- unique

drop table products;

create table products(
	product_id int not null unique,
	product_name varchar(50) not null,
	price double,
	stock int,
	re_order_level int
);

insert into products values(1, 'Pen', 10.50, 1000, 200);

insert into products(product_name, price, stock, re_order_level) 
values('Pencil', 7.50, 3000, 400);

insert into products values(null, 'Pen', 10.50, 1000, 200);


insert into products values(2, null, 5.00, 3000, 525);

insert into products values(2, 'Mobile', 25000, 5, 1);

insert into products values(3, 'T.V', null, 4, 0);

insert into products values(3, 'Fan', 7500, 40, 8);

insert into products values(4, 'Fan', -7500, 40, 8);

select * from products;






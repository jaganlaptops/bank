-- primary key

create table students(
	student_id int not null primary key,
    student_name nvarchar(50) not null,
    marks int
);

desc students;

insert into students values(1, 'Ramesh', 99);
insert into students values(2, 'Divya', 99.99);

select * from students;

-- check constraint

drop table products;

create table products(
	product_id int not null primary key,
	product_name varchar(50) not null,
	price double check(price >= 0),
	stock int check(stock >= 0),
	re_order_level int check (re_order_level >= 0)
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

-- Foreign key constraint
/*departments(dept_id,name,location)(master/parent)

1, 'Production', 'Bangalore'
2, 'Account', 'Mumbai'
3, 'Training', 'Bangalore'
4, 'H.R', 'Tirupathi'

employees(id, name, salary, dept_id)(details/child)
1, 'Ramesh', 700000, 2
2, 'Divya', 800000, 4
3, 'Anish', 700000, 3
4, 'Vidhya', 250000, 4
5, 'Jagan', 8000000, 8
6, 'Mahesh', 400000, null
*/

select * from departments;

drop table departments;
drop table employees;

create table departments(
	dept_id int not null primary key,
    dept_name varchar(50) not null,
    location varchar(30)
);


insert into departments values
(1, 'Production', 'Bangalore'),
(2, 'Account', 'Mumbai'),
(3, 'Training', 'Bangalore'),
(4, 'H.R', 'Tirupathi');

select * from departments;

create table employees(
	emp_id int not null primary key,
    emp_name varchar(50) not  null,
    salary double check(salary >= 0),
    dept_id int,
    foreign key(dept_id) references departments(dept_id)
);

insert into employees values(1, 'Ramesh', 700000, 2);

insert into employees values(2, 'Divya', 800000, 4);

insert into employees values(3, 'Anish', 700000, 3);

insert into employees values(4, 'Vidhya', 250000, 4);

insert into employees values(5, 'Jagan', 8000000, 8);

insert into employees values(6, 'Mahesh', 400000, null);

select * from employees;

-- auto increment

create table customers (
	id int not null primary key auto_increment,
    name varchar(50) not null,
    address varchar(30)
);

desc customers;

insert into customers(name, address) values('Ramesh', 'Bangalore');

insert into customers(name, address) values('Chaithu', 'Chittoor');

insert into customers(name, address) values('Divya', 'Bangalore');

insert into customers(name, address) values('Anish', 'Trivendrum');

select * from customers;
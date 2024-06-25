create database batch851;

use batch851;

create table students(
student_id int,
student_name varchar(50),
age int,
degree varchar(50),
percentage double
);

insert into students values(1, 'Ramesh',18,'B-Tech', 99.9);

insert into students values(2, 'Divya',22,'M.C.A', 79.9);

insert into students values(3, 'Vidya',23,'M-Tech', 99.99);

select student_id, student_name, age, degree, percentage from students;






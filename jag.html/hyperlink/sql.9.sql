drop database dml_practice;

create database dml_practice;

use dml_practice;

-- DML statements (insert, update, delete)

-- 1. CREATE TABLE Statement: 
-- Used to create a new table in the database.
drop table employees;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) not null,
    last_name VARCHAR(50),
    department_id INT,
    hire_date DATE
);

desc employees;


insert into employees(first_name, last_name, department_id, hire_date) 
values('Ramesh', 'Raju', 1, '2024-6-29');

insert into employees(first_name, last_name, department_id, hire_date) 
values('Divya', 'Ramesh', 2, '2024-6-27');

insert into employees(first_name, last_name, department_id, hire_date) values
('Anish', 'Rao', 1, '2024-6-22'),
('Deepti', 'Rao', 4, '2024-6-21'),
('Dinesh', 'Raju', 3, '2024-5-20'),
('Ravi', 'Rao', 2, '2024-6-22');

-- inserting a null value

insert into employees(first_name, last_name, department_id, hire_date) 
values('Sunil', 'Raju', null, '2024-6-29');

insert into employees(first_name, last_name, hire_date) 
values('Anil', 'Kumar','2024-6-29');


select * from employees;

-- 2. INSERT Statement: 
-- Used to insert new records into a table.

-- Insert 5 rows of sample data into the employees table

INSERT INTO employees (
	first_name, 
    last_name, 
    department_id, 
    hire_date)
VALUES
    ('John', 'Doe', 1, '2023-08-01'),
    ('Jane', 'Smith', 2, '2023-08-02'),
    ('Michael', 'Johnson', 1, '2023-08-03'),
    ('Susan', 'Williams', 3, '2023-08-04'),
    ('David', 'Brown', 2, '2023-08-05');

select * from employees;

-- 3. insert values to the less no of columns examples
-- insert only first_name and last_name columns

-- insert into employees values('Ramesh', 'Raju');

insert into employees(first_name, last_name) values('Ramana', 'Raju');

select * from employees;
-- Insert values into fewer columns for 5 rows in the 
-- employees table

INSERT INTO employees (first_name, last_name)
VALUES
    ('Alice', 'Johnson'),
    ('Bob', 'Smith'),
    ('Catherine', 'Williams'),
    ('Daniel', 'Brown'),
    ('Eva', 'Garcia');
    
select * from employees;


-- 4. Insert 5 new rows into the first_name, department_id, 
-- and hire_date columns of the employees table

insert into employees(first_name, department_id, hire_date)
values('Manish', 3, '2023-3-30');



INSERT INTO employees (first_name, department_id, hire_date)
VALUES
    ('Emily', 1, '2023-08-15'),
    ('Frank', 2, '2023-08-16'),
    ('Grace', 3, '2023-08-17'),
    ('Henry', 2, '2023-08-18'),
    ('Isabella', 1, '2023-08-19');

select * from employees;

-- leaving out the not null column

insert into employees(last_name, department_id, hire_date)
values('Ramu', 5, now());

insert into employees(first_name, department_id, hire_date)
values('Ramu', 5, now());

select * from employees;

select now();

-- 5. UPDATE Statement: 

select * from employees;

update employees set last_name = 'Ramu'; -- never use update with out a where

update employees set last_name = 'Baskar'
where first_name = 'Ramesh';

update employees set first_name = 'Ramesh'
where employee_id = 26;

select * from employees
order by employee_id desc;

select * from employees
where first_name = 'Emily';

update employees set last_name = 'Smith', hire_date = '2023-8-12'
where employee_id = 13;

select * from employees
where employee_id=13;

select * from employees
where first_name = 'Emily';

update employees set last_name = 'Smith', hire_date = '2023-8-02'
where employee_id = (select employee_id from employees
where first_name = 'Emily');


select * from employees;

update employees set hire_date = '2023-08-06'
where employee_id = 1;

-- Used to modify existing records in a table.

-- Update Emily's department to 4 and hire date to 20-8-2023

update employees set 
		department_id = 4,
        hire_date = '2023-08-20'
where first_name = 'Emily';

update employees set 
		department_id = 5,
        hire_date = '2023-08-26'
where employee_id = (select employee_id from employees
						where first_name='Frank');
                        
update employees set 
		department_id = 5,
        hire_date = '2023-08-26'
where first_name = 'Frank';

select * from employees;


update employees set 
	department_id = 4, 
    hire_date = '2023-08-20'
where employee_id = 11;



UPDATE employees
SET department_id = 4, hire_date = '2023-08-20'
WHERE first_name = 'Emily';

-- Update Frank's hire date to 17-8-2023

select employee_id from employees
where first_name = 'Frank';

update employees set hire_date = '2023-08-17'
where employee_id = 12;

select * from employees;


UPDATE employees
SET hire_date = '2023-08-17'
WHERE first_name = 'Frank';

-- Update Grace's department id to 1

select employee_id from employees
where first_name = 'Grace';

update employees set department_id=1
where employee_id=13;

select * from employees;

UPDATE employees
SET department_id = 1
WHERE first_name = 'Grace';

-- Update Henry's hire date to 21-08-2023 and department id to 3
UPDATE employees
SET department_id = 3, hire_date = '2023-08-21'
WHERE first_name = 'Henry';

-- Update Isabella's department and hire date
UPDATE employees
SET department_id = 2, hire_date = '2023-08-22'
WHERE first_name = 'Isabella';

-- Update John's last name to Johnson
UPDATE employees
SET last_name = 'Johnson'
WHERE first_name = 'John';

select * from employees;


-- Update Jane's last name to 'Brown' and department id 3
UPDATE employees
SET last_name = 'Brown', department_id = 3
WHERE first_name = 'Jane';

-- Update Michael's department and hire date
UPDATE employees
SET department_id = 2, hire_date = '2023-08-23'
WHERE first_name = 'Michael';

-- Update Susan's hire date
UPDATE employees
SET hire_date = '2023-08-24'
WHERE first_name = 'Susan';

-- Update David's last name to Garcia and hire date 2023-08-25
UPDATE employees
SET last_name = 'Garcia', hire_date = '2023-08-25'
WHERE first_name = 'David';

-- 4. DELETE Statement: 
-- Used to remove records from a table.

-- Delete a Specific Employee by ID 3:


select * from employees;

delete from employees;

delete from employees
where employee_id = 3;

delete from employees
where employee_id = 26;

select * from employees
order by employee_id desc;

insert into employees(first_name, last_name)
values('Kiran', 'Mahesh');








-- Delete Employees in Department id 2:

select * from employees
where department_id = 2;

DELETE FROM employees
WHERE department_id = 2;

-- Delete Employees Hired Before a Date '2023-08-17' :

select * from employees
where hire_date < '2023-08-17';

DELETE FROM employees
WHERE hire_date < '2023-08-17';

-- Delete All Employees:

DELETE FROM employees;

select * from employees;

-- 5. Create the users table

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    registration_date DATE
);

-- 6. Insert 5 rows of sample data

INSERT INTO users (username, email, registration_date)
VALUES
    ('john_doe', 'john@example.com', '2023-08-01'),
    ('jane_smith', 'jane@example.com', '2023-08-02'),
    ('mike_jones', 'mike@example.com', '2023-08-03'),
    ('susan_williams', 'susan@example.com', '2023-08-04'),
    ('david_brown', 'david@example.com', '2023-08-05');
    
-- 7. INSERT...SELECT Statement: 

-- create the table audit_log
create table audit_log (
	id int not null auto_increment primary key,
    event_type nvarchar(20),
    event_date datetime
);

-- Used to insert data from one table into another.

INSERT INTO audit_log (event_type, event_date)
SELECT 'Login', NOW()
FROM users
WHERE user_id = 5;


select * from audit_log;

select * from employees;

delete from employees;

ALTER TABLE employees AUTO_INCREMENT = 1; 

INSERT INTO employees (
	first_name, 
    last_name, 
    department_id, 
    hire_date)
VALUES
    ('John', 'Doe', 1, '2023-08-01'),
    ('Jane', 'Smith', 2, '2023-08-02'),
    ('Michael', 'Johnson', 1, '2023-08-03'),
    ('Susan', 'Williams', 3, '2023-08-04'),
    ('David', 'Brown', 2, '2023-08-05');


ALTER TABLE employees AUTO_INCREMENT = 101; 

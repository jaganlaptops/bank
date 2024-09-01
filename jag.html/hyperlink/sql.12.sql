/*Design the following ecommerce database
Table 1: Products
•	product_id (Primary Key)
•	product_name
•	price
•	description
Table 2: Customers
•	customer_id (Primary Key)
•	first_name
•	last_name
•	email
•	phone
•	address
Table 3: Orders
•	order_id (Primary Key)
•	customer_id (Foreign Key referencing Customers)
•	order_date
•	total_amount
Table 4: Order_Items
•	item_id (Primary Key)
•	order_id (Foreign Key referencing Orders)
•	product_id (Foreign Key referencing Products)
•	quantity
•	subtotal
Table 5: Payment Methods
•	method_id (Primary Key)
•	customer_id (Foreign Key referencing Customers)
•	method_type (e.g., credit card, PayPal)
•	method_details (e.g., card number, PayPal email)
Now, let's add constraints to these tables:
Products Table Constraints:
•	product_id is a primary key, ensuring uniqueness.
•	price must be a non-negative value.
•	product_name and description should not be empty.
Customers Table Constraints:
•	customer_id is a primary key, ensuring uniqueness.
•	email should be unique and in a valid email format.
•	phone could have a format constraint (e.g., a certain number of digits).
Orders Table Constraints:
•	order_id is a primary key, ensuring uniqueness.
•	customer_id references a valid customer in the Customers table.
•	order_date should not be in the future.
•	total_amount must be a non-negative value.
Order Items Table Constraints:
•	item_id is a primary key, ensuring uniqueness.
•	order_id references a valid order in the Orders table.
•	product_id references a valid product in the Products table.
•	quantity must be a positive integer.
•	subtotal must be calculated as quantity * product price.
Payment Methods Table Constraints:
•	method_id is a primary key, ensuring uniqueness.
•	customer_id references a valid customer in the Customers table.
•	method_type could be restricted to a predefined set of values.
•	method_details would depend on the method_type and its associated requirements.
*/

drop database ecommerce;

create database ecommerce;
use ecommerce;

/*Answer:
*/

-- Table: Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);

-- Table: Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);

-- Table: Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
);

-- Table: Order Items
CREATE TABLE OrderItems (
    item_id INT PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    product_id INT REFERENCES Products(product_id),
    quantity INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL
);

-- Table: Payment Methods
CREATE TABLE PaymentMethods (
    method_id INT PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    method_type VARCHAR(50) NOT NULL,
    method_details TEXT
);

/*Insertion of the data
-- Insert data into Products
*/

INSERT INTO Products (product_id, product_name, price, description)
VALUES
    (1, 'Laptop', 999.99, 'High-performance laptop'),
    (2, 'Smartphone', 599.99, 'Latest model smartphone'),
    (3, 'Tablet', 299.99, 'Portable tablet device'),
    (4, 'Desktop PC', 799.99, 'Powerful desktop computer'),
    (5, 'Wireless Headphones', 149.99, 'Noise-cancelling wireless headphones'),
    (6, 'Smart Watch', 199.99, 'Fitness and smart features'),
    (7, 'Camera', 499.99, 'High-resolution digital camera'),
    (8, 'Gaming Console', 399.99, 'Next-gen gaming console'),
    (9, 'Printer', 129.99, 'Wireless color printer'),
    (10, 'External Hard Drive', 89.99, '1TB portable external hard drive'),
    (11, 'Smart TV', 899.99, 'Ultra HD smart television'),
    (12, 'Bluetooth Speaker', 69.99, 'Portable Bluetooth speaker'),
    (13, 'Wireless Mouse', 29.99, 'Ergonomic wireless mouse'),
    (14, 'Keyboard', 49.99, 'Mechanical gaming keyboard'),
    (15, 'Fitness Tracker', 79.99, 'Activity and health tracker'),
    (16, 'VR Headset', 299.99, 'Virtual reality headset'),
    (17, 'Monitor', 249.99, '24-inch LED monitor'),
    (18, 'Projector', 599.99, 'HD home theater projector'),
    (19, 'Coffee Maker', 79.99, 'Programmable coffee maker'),
    (20, 'Microwave Oven', 129.99, 'Compact microwave oven'),
    (21, 'Blender', 39.99, 'High-speed blender'),
    (22, 'Toaster', 24.99, '2-slice toaster'),
    (23, 'Air Fryer', 89.99, 'Healthy cooking air fryer'),
    (24, 'Robot Vacuum', 249.99, 'Smart robotic vacuum cleaner'),
    (25, 'Hair Dryer', 49.99, 'Ionic hair dryer');


-- Insert data into Customers
INSERT INTO Customers (customer_id, first_name, last_name, email, phone, address)
VALUES
    (1, 'John', 'Doe', 'john@example.com', '123-456-7890', '123 Main St'),
    (2, 'Jane', 'Smith', 'jane@example.com', null, '456 Elm St'),
    (3, 'Michael', 'Johnson', 'michael@example.com', '555-123-4567', '789 Oak Ave'),
    (4, 'Emily', 'Williams', 'emily@example.com', '777-888-9999', '567 Pine Rd'),
    (5, 'David', 'Brown', 'david@example.com', '222-333-4444', '123 Main St'),
    (6, 'Sarah', 'Jones', 'sarah@example.com', '111-222-3333', '890 Cedar St'),
    (7, 'Christopher', 'Wilson', 'chris@example.com', '444-555-6666', '456 Birch Ave'),
    (8, 'Jessica', 'Martinez', 'jessica@example.com', '666-777-8888', '678 Elm St'),
    (9, 'Matthew', 'Anderson', 'matthew@example.com', null, '123 Main St'),
    (10, 'Amanda', 'Taylor', 'amanda@outlook.com', '333-444-5555', '123 Pine Ave'),
    (11, 'Daniel', 'Harris', 'daniel@example.com', '555-666-7777', '789 Maple St'),
    (12, 'Laura', 'Lee', 'laura@gmail.com', '777-888-9999', '456 Cedar Rd'),
    (13, 'Ryan', 'Martin', 'ryan@example.com', '222-333-4444', '234 Birch Ave'),
    (14, 'Melissa', 'Walker', 'melissa@example.com', '111-222-3333', '890 Elm St'),
    (15, 'Kevin', 'Thompson', 'kevin@outlook.com', null, '789 Maple St'),
    (16, 'Ashley', 'Garcia', 'ashley@example.com', '666-777-8888', '678 Pine St'),
    (17, 'Jacob', 'Miller', 'jacob@example.com', '888-999-0000', '345 Cedar Rd'),
    (18, 'Stephanie', 'Davis', 'stephanie@outlook.com', '333-444-5555', '123 Birch Ave'),
    (19, 'Joseph', 'Rodriguez', 'joseph@example.com', '555-666-7777', '789 Elm St'),
    (20, 'Megan', 'Lopez', 'megan@gmail.com', '777-888-9999', '456 Oak Rd'),
    (21, 'William', 'Perez', 'william@example.com', '222-333-4444', '234 Pine Ave'),
    (22, 'Nicole', 'Hernandez', 'nicole@example.com', '111-222-3333', '890 Cedar St'),
    (23, 'Charles', 'Gonzalez', 'charles@example.com', '444-555-6666', '456 Birch Ave'),
    (24, 'Elizabeth', 'Moore', 'elizabeth@example.com', '666-777-8888', '678 Elm St'),
    (25, 'Andrew', 'Jackson', 'andrew@gmail.com', '888-999-0000', '345 Oak Rd');



-- Insert data into Orders
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
    (1, 3, '2023-08-01', 999.99),
    (2, 5, '2023-08-02', 1599.00),
    (3, 7, '2023-08-03', 299.99),
    (4, 2, '2023-08-04', 799.99),
    (5, 9, '2023-08-05', 150.00),
    (6, 4, '2023-08-06', 199.99),
    (7, 6, '2023-08-07', 499.99),
    (8, 8, '2023-08-08', 399.99),
    (9, 10, '2023-08-09', 129.99),
    (10, 1, '2023-08-10', 89.99),
    (11, 12, '2023-08-11', 899.00),
    (12, 14, '2023-08-12', 69.99),
    (13, 16, '2023-08-13', 29.99),
    (14, 18, '2023-08-14', 49.99),
    (15, 20, '2023-08-15', 79.99),
    (16, 22, '2023-08-16', 299.99),
    (17, 24, '2023-08-17', 249.99),
    (18, 25, '2023-08-18', 599.99),
    (19, 23, '2023-08-19', 79.99),
    (20, 21, '2023-08-20', 129.99),
    (21, 19, '2023-08-21', 39.99),
    (22, 17, '2023-08-22', 25.00),
    (23, 15, '2023-08-23', 89.99),
    (24, 13, '2023-08-24', 249.99),
    (25, 11, '2023-08-25', 49.99),
    (26, 1, '2023-12-27', 150), 
    (27, 1, '2023-12-27', 180);


-- Insert data into OrderItems
INSERT INTO OrderItems (item_id, order_id, product_id, quantity, subtotal)
VALUES
    (1, 1, 3, 2, 599.98),
    (2, 2, 5, 1, 149.99),
    (3, 3, 8, 3, 1199.97),
    (4, 4, 12, 1, 69.99),
    (5, 5, 18, 2, 499.98),
    (6, 6, 23, 1, 89.99),
    (7, 7, 2, 1, 599.99),
    (8, 8, 15, 2, 159.98),
    (9, 9, 11, 1, 899.99),
    (10, 10, 1, 1, 999.99),
    (11, 11, 9, 1, 129.99),
    (12, 12, 14, 2, 99.98),
    (13, 13, 6, 1, 199.99),
    (14, 14, 4, 1, 799.99),
    (15, 15, 10, 3, 269.97),
    (16, 16, 7, 1, 499.99),
    (17, 17, 17, 2, 499.98),
    (18, 18, 20, 1, 129.99),
    (19, 19, 13, 1, 29.99),
    (20, 20, 21, 1, 39.99),
    (21, 21, 24, 2, 499.98),
    (22, 22, 25, 1, 49.99),
    (23, 23, 19, 3, 239.97),
    (24, 24, 3, 1, 299.99),
    (25, 25, 22, 1, 234.99);


-- Insert data into PaymentMethods
INSERT INTO PaymentMethods (method_id, customer_id, method_type, method_details)
VALUES
    (1, 3, 'Credit Card', 'john.doe@example.com'),
    (2, 5, 'PayPal', 'jane.smith@example.com'),
    (3, 7, 'Credit Card', 'michael.johnson@example.com'),
    (4, 2, 'PayPal', 'emily.williams@example.com'),
    (5, 9, 'Credit Card', 'david.brown@example.com'),
    (6, 4, 'Credit Card', 'sarah.jones@example.com'),
    (7, 6, 'PayPal', 'christopher.wilson@example.com'),
    (8, 8, 'Credit Card', 'jessica.martinez@example.com'),
    (9, 10, 'PayPal', 'matthew.anderson@example.com'),
    (10, 1, 'Credit Card', 'amanda.taylor@example.com'),
    (11, 12, 'Credit Card', 'daniel.harris@example.com'),
    (12, 14, 'PayPal', 'laura.lee@example.com'),
    (13, 16, 'Credit Card', 'ryan.martin@example.com'),
    (14, 18, 'Credit Card', 'melissa.walker@example.com'),
    (15, 20, 'PayPal', 'kevin.thompson@example.com'),
    (16, 22, 'Credit Card', 'ashley.garcia@example.com'),
    (17, 24, 'Credit Card', 'jacob.miller@example.com'),
    (18, 25, 'PayPal', 'stephanie.davis@example.com'),
    (19, 23, 'Credit Card', 'joseph.rodriguez@example.com'),
    (20, 21, 'Credit Card', 'megan.lopez@example.com'),
    (21, 19, 'PayPal', 'william.perez@example.com'),
    (22, 17, 'Credit Card', 'nicole.hernandez@example.com'),
    (23, 15, 'Credit Card', 'charles.gonzalez@example.com'),
    (24, 13, 'PayPal', 'elizabeth.moore@example.com'),
    (25, 11, 'Credit Card', 'andrew.jackson@example.com');


/*Exercise 1: Retrieve all columns from the Customers table.
*/


select * from customers;







/*Exercise 2: Retrieve the first name and last name of customers.
*/
select first_name, last_name from customers;



/*Exercise 3: Retrieve unique address from the Customers table.
*/
select distinct address from customers;


/*Exercise 4: Retrieve customers who have the email domain 'example.com'.
*/
SELECT * FROM customers WHERE email LIKE '%@example.com';



/*Exercise 5: Retrieve customers who have a phone number starting with '555'.
*/
SELECT * FROM customers WHERE phone LIKE '555%';



/*Exercise 6: Retrieve customers who live in 'Oak Rd' or 'Elm St'.
*/
SELECT * FROM customers 
WHERE address LIKE '%Oak Rd%' 
OR address LIKE '%Elm St%';


/*Exercise 7: Retrieve customers who don't have a phone number listed.
*/

select * from   customers WHERE phone is null;




/*Exercise 8: Retrieve orders with a total amount greater than $500.
*/

SELECT * FROM orders 
WHERE total_amount > 500;



/*Exercise 9: Retrieve orders placed on or after '2023-08-10'.
*/
SELECT * FROM orders 
WHERE order_date >= '2023-08-10';



/*Exercise 10: Retrieve orders with a total amount between $100 and $300.
*/
SELECT * FROM orders 
WHERE total_amount BETWEEN 100 AND 300;


/*Exercise 11: Retrieve products with a price less than $50.
*/
SELECT * FROM products 
WHERE price < 50;


/*Exercise 12: Retrieve products with the word 'Smart' in their name.
*/
SELECT * FROM products 
WHERE name LIKE '%Smart%';





/*Exercise 13: Retrieve products ordered by price in ascending order.
*/ 
SELECT * FROM products 
ORDER BY price ASC;



/*Exercise 14: Retrieve the highest price from the Products table.
*/
SELECT MAX(price) AS highest_price 
FROM products;


/*Exercise 15: Retrieve the total number of customers.
*/
SELECT COUNT(*) AS total_customers 
FROM customers;



/*Exercise 16: Retrieve the average total amount of orders.
*/
SELECT AVG(total_amount) AS average_order_total 
FROM orders;

/*Exercise 17: Retrieve the sum of quantities in OrderItems.
*/
SELECT SUM(quantity) AS total_quantity 
FROM order_items;


/*Exercise 18: Retrieve customers who have placed more than 2 orders.
*/
SELECT *
FROM customers
WHERE customer_id IN (
  SELECT customer_id
  FROM orders
  GROUP BY customer_id
  HAVING COUNT(*) > 2
);



/*Exercise 19: Retrieve the most expensive product.
*/

SELECT *
FROM products
ORDER BY price DESC
LIMIT 1;



/*Exercise 20: Retrieve the customer names and their total order amounts.
*/
SELECT c.name, SUM(o.total_amount) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;


/*Exercise 21: Retrieve products that have been ordered at least once.
*/
SELECT DISTINCT p.*
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id;


/*Exercise 22: Retrieve the number of orders placed by each customer.
*/
SELECT c.customer_id, c.name, COUNT(o.order_id) AS num_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

/*Exercise 23: Retrieve the total revenue for each product.
*/

SELECT p.product_id, p.name, SUM(oi.quantity * oi.price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name;


/*Exercise 24: Retrieve customers who have placed orders with a total amount over $1000.
*/
SELECT c.*
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(o.total_amount) > 1000;


/*Exercise 25: Retrieve the product names and their quantities sold.
*/
SELECT p.name, SUM(oi.quantity) AS quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name;



/*Exercise 26: Retrieve the total quantity of products in stock.
*/
SELECT SUM(quantity) AS total_quantity
FROM products;


/*Exercise 27: Retrieve the customer names who have placed orders in the month of May.
*/

SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE EXTRACT(MONTH FROM o.order_date) = 5;


/*Exercise 28: Retrieve products with a price that is a whole number.
*/
SELECT *
FROM products
WHERE price = ROUND(price);


/*Exercise 29: Retrieve the customer names and the total amounts of their orders, excluding those who have not placed any orders.
*/
SELECT c.name, SUM(o.total_amount) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING SUM(o.total_amount) > 0;


/*Exercise 30: Retrieve the product names that have been ordered at least five times.
*/

SELECT p.name
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name
HAVING COUNT(oi.product_id) >= 5;



/*Exercise 31: Retrieve customers who have placed orders on the first day of the month.
*/
SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE EXTRACT(DAY FROM o.order_date) = 1;


/*Exercise 32: Retrieve the product names and their corresponding prices, ordered by product ID in ascending order.
*/

SELECT p.name, p.price
FROM products p
ORDER BY p.product_id ASC;


/*Exercise 33: Retrieve the customer names who have placed orders with a total amount greater than the average total amount of all orders.
*/
SELECT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING SUM(o.total_amount) > (
  SELECT AVG(total_amount)
  FROM orders
);



/*Exercise 34: Retrieve the product names and the total amounts of their sales, ordered by total amounts in descending order.
*/
SELECT p.name, SUM(oi.quantity * oi.price) AS total_sales
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY total_sales DESC;


/*Exercise 35: Retrieve the customer names who have placed orders with a total amount greater than the highest total amount of all orders.
*/

SELECT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING SUM(o.total_amount) > (
  SELECT MAX(total_amount)
  FROM orders
);

/*Exercise 36: Retrieve the product names and their corresponding prices, rounded to two decimal places.
*/
SELECT p.name, ROUND(p.price, 2) AS price
FROM products p;


/*Exercise 37: Retrieve customers who have placed orders on the last day of the month.
*/
SELECT c.*
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE DATE(o.order_date) = LAST_DAY(o.order_date);


/*Exercise 38: Retrieve the product names and the total quantities sold, ordered by total quantities in descending order.
*/
SELECT p.name, SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY total_quantity DESC;



/*Exercise 39: Retrieve the customer names and the average total amount of their orders, ordered by average amount in descending order.
*/
SELECT c.name, AVG(o.total_amount) AS average_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY average_amount DESC;


/*Exercise 40: Retrieve customers who have placed orders in February and September.
*/

SELECT c.*
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE MONTH(o.order_date) IN (2, 9);


/*Exercise 41: Retrieve the customer names who have placed more than 3 orders in August.
*/
SELECT c.name
FROM customers c
JOIN (
  SELECT customer_id
  FROM orders
  WHERE MONTH(order_date) = 8
  GROUP BY customer_id
  HAVING COUNT(*) > 3
) o ON c.customer_id = o.customer_id;



/*Exercise 42: Retrieve products with a price in the range of $10 to $30, ordered by product name in ascending order.
*/
SELECT *
FROM products
WHERE price BETWEEN 10 AND 30
ORDER BY product_name ASC;


//*Exercise 43: Retrieve the customer names and their corresponding addresses, ordered by city in descending order.
*/
SELECT c.name, a.address, a.city
FROM customers c
JOIN addresses a ON c.customer_id = a.customer_id
ORDER BY a.city DESC;


/*Exercise 44: Retrieve customers who have placed orders with a total amount greater than $100 and sort them by their last names in ascending order.
*/
SELECT c.name, c.last_name
FROM customers c
JOIN (
  SELECT customer_id, SUM(total_amount) as total_spent
  FROM orders
  GROUP BY customer_id
  HAVING SUM(total_amount) > 100
) o ON c.customer_id = o.customer_id
ORDER BY c.last_name ASC;


/*Exercise 45: Retrieve the product names and their corresponding prices, ordered by product name in descending order.
*/
SELECT product_name, price
FROM products
WHERE price > 0
ORDER BY product_name DESC;

/*Exercise 46: Retrieve the customer names and the average total amount of their orders, excluding those with no orders, ordered by average amount in ascending order.
*/
SELECT c.name, AVG(o.total_amount) AS average_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) > 0
ORDER BY average_amount ASC;

/*Exercise 47: Retrieve the product names that have a name shorter than 15 characters.
*/
SELECT product_name
FROM products
WHERE LENGTH(product_name) < 15;


/*Exercise 48: Retrieve customers who have placed orders with a total amount greater than the average total amount of their orders.
*/

SELECT c.name
FROM customers c
JOIN (
  SELECT customer_id, AVG(total_amount) AS avg_amount
  FROM orders
  GROUP BY customer_id
) o ON c.customer_id = o.customer_id
JOIN orders o2 ON c.customer_id = o2.customer_id
WHERE o2.total_amount > o.avg_amount;


/*Exercise 49: Retrieve the product names and their corresponding prices, ordered by price in descending order.
*/
SELECT product_name, price
FROM products
WHERE price > 0
ORDER BY price DESC;



/*Exercise 50: Retrieve customers who have placed orders on an even-numbered day of the month.
*/
SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE DAY(o.order_date) % 2 = 0;






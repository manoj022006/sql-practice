CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    cust_id INT NOT NULL,
    order_amt DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL
);

INSERT INTO orders (order_id, cust_id, order_amt, order_date) VALUES
(101, 1001, 2500.00, '2024-01-15'),
(102, 1002, 1800.50, '2024-01-18'),
(103, 1003, 3200.75, '2024-02-05'),
(104, 1001, 4500.00, '2024-02-10'),
(105, 1004, 1200.25, '2024-02-15'),
(106, 1002, 5600.00, '2024-03-01'),
(107, 1005, 2750.80, '2024-03-08'),
(108, 1003, 890.00, '2024-03-15'),
(109, 1006, 4100.50, '2024-04-01'),
(110, 1004, 1500.00, '2024-04-12'),
(111, 1007, 6300.25, '2024-05-05'),
(112, 1001, 2950.00, '2024-05-20'),
(113, 1005, 3400.60, '2024-06-02'),
(114, 1008, 5100.75, '2024-06-18'),
(115, 1006, 2200.00, '2024-07-01');

SELECT * FROM orders;

-- Create Customer Table
CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO customer (cust_id, cust_name, city) VALUES
(1001, 'Amit Sharma', 'Delhi'),
(1002, 'Priya Verma', 'Mumbai'),
(1003, 'Rahul Kumar', 'Chennai'),
(1004, 'Sneha Reddy', 'Hyderabad'),
(1005, 'Arjun Singh', 'Bengaluru'),
(1006, 'Neha Patel', 'Ahmedabad'),
(1007, 'Karan Mehta', 'Pune'),
(1008, 'Divya Nair', 'Kochi');

-- normal subquery
select cust_name,
(select max(order_amt) from orders) as max_amt
from customer;

-- subquery in where condition
select cust_name from customer
where cust_id in (
                select cust_id
                from orders
                where order_amt >5000
                );
                
-- without using joining two tables using join
select cust_name ,city,
(select sum(order_amt) 
from orders o
where o.cust_id=c.cust_id) as total_orders
from customer c;





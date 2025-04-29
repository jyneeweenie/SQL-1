CREATE TABLE IF NOT EXISTS Salesman(
Salesman_id TEXT PRIMARY KEY,
name TEXT, 
city TEXT,
comission TEXT
);
INSERT INTO Salesman(Salesman_id, name, city, comission) VALUES
('501', 'James', 'New York', '0.15'),
('502', 'Nail', 'Paris', '0.13'),
('505', 'Alex', 'London', '0.11'),
('506', 'Lycon', 'Paris', '0.14'),
('507', 'Adam', 'Rome', '0.13'),
('503', 'Lauson', 'San JOse', '0.12');
CREATE TABLE IF NOT EXISTS Customer(
customer_id TEXT,
cust_name TEXT PRIMARY KEY,
city TEXT,
grade TEXT,
Salesman_id TEXT
);
INSERT INTO Customer (customer_id, cust_name, city, grade, Salesman_id) VALUES
('302', 'nick', 'new york', '100', '501'),
('307', 'brad', 'new york', '200', '501'),
('305', 'zusi', 'california', '200', '502'),
('308', 'paul', 'london', '300', '502'),
('304', 'troy', 'paris', '300', '506'),
('309', 'cameroon', 'berlin', '100', '503'),
('303', 'jozy', 'moscow', '200', '507'),
('301', 'guzan', 'london', '', '505');
CREATE TABLE IF NOT EXISTS Orders(
ord_no TEXT PRIMARY KEY,
purch_amt TEXT,
ord_date TEXT,
customer_id TEXT,
salesman_id TEXT
);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, Salesman_id) VALUES
('701', '150.5', '2012-10-05', '305', '502'),
('709', '150.5', '2012-10-10', '301', '501'),
('702', '150.5', '2012-10-05', '302', '503'),
('704', '150.5', '2012-10-17', '309', '507'),
('707', '150.5', '2012-10-10', '305', '505'),
('705', '150.5', '2012-10-27', '307', '5026');
--Queries
--matching customers and salesman by city
SELECT customer.cust_name, salesman.name, salesman.city
FROM Customer
JOIN Salesman ON Customer.city = Salesman.city;
--linking customers to their salesmen
SELECT Customer.cust_name, salesman.name
FROM Customer
JOIN Salesman ON Customer.Salesman_id = Salaesman.Salesman_id;
--fetching orders where customer's city does not match salesman's city
SELECT Orders.ord_no, Customer.cust_name, Orders.customer_id,
Orders.Salesman_id
FROM Orders
JOIN Customer ON Orders.customer_id = Customer.customer_id
JOIN Salesman ON Orders.Salesman_id = Salesman.Salesman_id
WHERE Customer.city <> Salesman.city;
--fetching all orders with customers names
SELECT Orders.ord_no, Customer.cust_name
FROM Orders
JOIN Customer ON Orders.customer_id = Customer.customer_id;
--customers with grades
SELECT Customer.cust_name, Customer.grade
FROM Orders
JOIN Salesman ON Orders.Salesman_id = Salesman.Salesman_id
JOIN Customer ON Orders.customer_id = Customer.customer_id
WHERE Customer.grade IS NOT NULL;
--Customers with salesmen where comission is between 0.12 and 0.14
SELECT Customer.cust_name,
Customer.city,
Salesman.name,
Salesman comission
FROM Customer
JOIN Salesman ON Customer.Salesman_id = Salesman.Salesman_id
WHERE Salesman.comission BETWEEN 0.12 AND 0.14;
--calculating comissions for orders where customer grade is 200 or more
SELECT Orders.ord_no, Custome.cust_name,
Salesman.comission,
Orders.purch_amt * Salesman.comission
FROM Orders
JOIN Salesman ON Orders.Salesman_id = Salesman.Salesman_id
JOIN Customer ON Orders.Customer_id = Customer.customer_id
WHERE Customer.grade >= 200;
-- orders on a specific date
SELECT *
FROM Customer
JOIN Customer ON Orders.Customer_id = Customer.customer_id
WHERE Orders.ord_date = '2012-10-05';
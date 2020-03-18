-- northwind

-- string filter
SELECT companyname
FROM suppliers
WHERE city = 'Berlin';

SELECT contactname, companyname
FROM customers
WHERE country = 'Mexico';

-- numeric filter
SELECT COUNT(*)
FROM orders
WHERE employeeid = 3;

SELECT COUNT(*)
FROM order_details
WHERE quantity > 20;

SELECT COUNT(*)
FROM orders
WHERE freight >= 250;

-- date filter
SELECT COUNT(*)
FROM orders
WHERE orderdate >= '1998-01-01';

SELECT COUNT(*)
FROM orders
WHERE shippeddate < '1997-07-05';

-- AND operator
SELECT COUNT(*)
FROM orders
WHERE freight > 100 AND shipcountry = 'Germany';

SELECT DISTINCT customerid
FROM orders
WHERE shipvia = 2 AND shipcountry = 'Brazil';

-- OR operator
SELECT COUNT(*)
FROM customers
WHERE country = 'USA' OR country = 'Canada';

SELECT COUNT(*)
FROM suppliers
WHERE country = 'Germany' OR country = 'Spain';

SELECT COUNT(*)
FROM orders
WHERE shipcountry = 'USA' OR shipcountry = 'Brazil' OR shipcountry = 'Argentina';

-- NOT operator
SELECT COUNT(*)
FROM customers
WHERE NOT country = 'France';

SELECT COUNT(*)
FROM suppliers
WHERE NOT country = 'USA';

-- combining operators
SELECT COUNT(*)
FROM orders
WHERE (freight < 50 OR freight > 175) AND shipcountry = 'Germany';

SELECT COUNT(*)
FROM orders
WHERE shippeddate > '1997-05-01' AND (shipcountry = 'Canada' OR shipcountry = 'Spain');

-- BETWEEN operator
SELECT COUNT(*)
FROM order_details
WHERE unitprice BETWEEN 10 AND 20;

SELECT COUNT(*)
FROM orders
WHERE shippeddate BETWEEN '1996-06-01' AND '1996-09-30';

-- IN operator
SELECT COUNT(*)
FROM suppliers
WHERE country IN ('Germany', 'France', 'Spain', 'Italy');

SELECT COUNT(*)
FROM products
WHERE categoryid IN (1,4,6,7);
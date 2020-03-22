-- northwind

-- ORDER BY
SELECT DISTINCT country
FROM suppliers
ORDER BY country ASC;

SELECT DISTINCT country
FROM suppliers
ORDER BY country DESC;

SELECT country, city
FROM suppliers
ORDER BY country ASC, city DESC;

SELECT productname, unitprice
FROM products
ORDER BY unitprice DESC, productname ASC;

-- MIN, MAX
SELECT MIN(orderdate)
FROM orders
WHERE shipcountry = 'Italy';

SELECT MAX(shippeddate)
FROM orders
WHERE shipcountry = 'Canada';

SELECT MAX(shippeddate - orderdate)
FROM orders
WHERE shipcountry = 'France';

-- AVG, SUM
SELECT AVG(freight)
FROM orders
WHERE shipcountry = 'Brazil';

SELECT SUM(quantity)
FROM order_details
WHERE productid = '14';

SELECT AVG(quantity)
FROM order_details
WHERE productid = '35';

-- LIKE
-- % is for 0 or more characters
SELECT *
FROM customers
WHERE contactname LIKE 'D%';

-- _ for 1 character
SELECT *
FROM suppliers
WHERE companyname LIKE '_or%';

SELECT *
FROM customers
WHERE companyname LIKE '%er';

-- AS
SELECT unitprice * quantity AS TotalSpent
FROM order_details

-- doesn't work as TotalSpent is not defined when WHERE is evaluated
-- SELECT unitprice * quantity AS TotalSpent
-- FROM order_details
-- WHERE TotalSpent > 10;

-- Works as ORDER BY is evaluated after the SELECT
SELECT unitprice * quantity AS TotalSpent
FROM order_details
ORDER BY TotalSpent DESC;

SELECT unitprice * unitsinstock AS TotalInventory
FROM products
ORDER BY TotalInventory DESC;

-- LIMIT
SELECT productid, unitprice * quantity AS Amount
FROM order_details
ORDER BY Amount DESC
LIMIT 1;

SELECT productname, unitprice * unitsinstock as TotalInventory
FROM products
ORDER BY TotalInventory ASC
LIMIT 2;

-- NULL
SELECT COUNT(*)
FROM customers
WHERE region IS NULL;

SELECT COUNT(*)
FROM suppliers
WHERE region IS NOT NULL;

SELECT COUNT(*)
FROM orders
WHERE shipregion IS NULL;




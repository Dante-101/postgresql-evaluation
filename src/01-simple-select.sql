-- northwind db
SELECT * FROM customers;

-- multiple columns
SELECT customerid, address, city 
FROM customers;

SELECT companyname, city, country 
FROM suppliers;

SELECT categoryname, description 
FROM categories;

-- distinct values
SELECT DISTINCT city, country
FROM customers;

SELECT DISTINCT region
FROM suppliers;

-- counting results
SELECT COUNT(*)
FROM products;

SELECT COUNT(*)
FROM orders;

-- distinct count
SELECT COUNT(DISTINCT city)
FROM suppliers;

SELECT COUNT(DISTINCT productid)
FROM order_details;

-- operations on the fields
SELECT customerid, shippeddate, orderdate, shippeddate - orderdate as ship_delay
FROM orders;

-- For the total amount
-- SELECT SUM(unitprice * quantity) as price
SELECT orderid, unitprice * quantity as price
FROM order_details;
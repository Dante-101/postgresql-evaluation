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


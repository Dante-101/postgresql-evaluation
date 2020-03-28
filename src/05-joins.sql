-- northwind

SELECT companyname, orderdate, shipcountry
FROM orders
JOIN customers ON customers.customerid = orders.customerid;

-- same as the prev one
SELECT customers.companyname, orders.orderdate, orders.shipcountry
FROM orders
JOIN customers ON customers.customerid = orders.customerid;

SELECT firstname, lastname, orderdate
FROM employees
JOIN orders ON employees.employeeid = orders.employeeid;

SELECT companyname, unitprice, unitsinstock
FROM products
JOIN suppliers ON products.supplierid = suppliers.supplierid;

-- multi table
SELECT 
    companyname,
    productname,
    categoryname,
    orderdate,
    order_details.unitprice,
    order_details.quantity
FROM orders
JOIN order_details ON orders.orderid = order_details.orderid
JOIN customers ON orders.customerid = customers.customerid
JOIN products ON products.productid = order_details.productid
JOIN categories ON products.categoryid = categories.categoryid
WHERE categories.categoryname = 'Seafood'
    AND order_details.unitprice * order_details.quantity >= 500;

-- LEFT JOIN
-- All fields of the first table and values of the matching rows of join table
SELECT companyname, orderid
FROM customers
LEFT JOIN orders ON customers.customerid = orders.customerid
WHERE orderid IS NULL;

SELECT productname, orderid
FROM products
LEFT JOIN order_details ON products.productid = order_details.productid
WHERE orderid IS NULL;

-- RIGHT JOIN
-- All fields of the join table and values of the matching rows of first table
SELECT companyname, orderid
FROM orders
RIGHT JOIN customers ON customers.customerid = orders.customerid
WHERE orderid IS NULL;

SELECT companyname, customercustomerdemo.customerid
FROM customercustomerdemo
RIGHT JOIN customers ON customers.customerid = customercustomerdemo.customerid;

-- FULL JOIN
-- All fields of both the tables
SELECT companyname, orderid
FROM customers
FULL JOIN orders ON customers.customerid = orders.customerid;

SELECT productname, categoryname
FROM products
FULL JOIN categories ON products.categoryid = categories.categoryid
WHERE productname IS NULL OR categoryname IS NULL;

-- SELF JOIN
SELECT c1.companyname AS C1Name, c2.companyname AS C2Name, c1.city
FROM customers AS c1
JOIN customers AS c2 ON c1.city = c2.city
WHERE c1.customerid <> c2.customerid
ORDER BY c1.city;

SELECT s1.companyname as S1Name, s2.companyname as S2Name, s1.country
FROM suppliers AS s1
JOIN suppliers AS s2 ON s1.country = s2.country
WHERE s1.supplierid <> s2.supplierid
ORDER BY s1.country;

-- USING - ensure that same column name exist on both the tables
SELECT *
FROM orders
JOIN order_details USING (orderid);

SELECT orders.orderid, productname
FROM orders
JOIN order_details USING (orderid)
JOIN products USING (productid);

-- NATURAL - ensure that there are columns with the same name
SELECT *
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details
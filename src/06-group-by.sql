-- northwind

-- GROUP BY
SELECT country, COUNT(*)
FROM customers
GROUP BY country
ORDER BY COUNT(*) DESC;

SELECT categoryname, COUNT(*) AS ProductCount
FROM categories
JOIN products USING (categoryid)
GROUP BY categoryid
ORDER BY ProductCount DESC;

SELECT country, COUNT(*)
FROM suppliers
GROUP BY country
ORDER BY COUNT(*) DESC;

SELECT productname, SUM(od.unitprice * od.quantity) AS Amount
FROM order_details AS od
JOIN orders USING (orderid)
JOIN products USING (productid)
WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY products.productid
ORDER BY Amount DESC;



-- GROUP BY + Aggregate
SELECT productname,
    ROUND(AVG(quantity)) AS AvgQty,
    ROUND(AVG(quantity * order_details.unitprice)) AS AvgAmount
FROM products
JOIN order_details USING (productid)
GROUP BY productid
ORDER BY AvgAmount DESC;

-- HAVING - runs after group by
SELECT productname, SUM(od.unitprice * od.quantity) AS Amount
FROM order_details AS od
JOIN products USING (productid)
GROUP BY products.productid
HAVING SUM(od.unitprice * od.quantity) < 2000;

SELECT companyname, SUM(od.unitprice * od.quantity) AS Amount
FROM customers AS c
JOIN orders USING (customerid)
JOIN order_details AS od USING (orderid)
WHERE orderdate BETWEEN '1997-01-01' AND '1997-06-30'
GROUP BY customerid
HAVING SUM(od.unitprice * od.quantity) > 5000
ORDER BY Amount DESC;

-- GROUPING SETS
SELECT productname, categoryname, SUM(od.unitprice * od.quantity) AS Amount
FROM categories
JOIN products USING (categoryid)
JOIN order_details AS od USING (productid)
GROUP BY GROUPING SETS (categoryname, (categoryname, productname))
ORDER BY categoryname, productname;


SELECT c.companyname AS Buyer, s.companyname AS Supplier, SUM(od.unitprice * od.quantity) AS Amount
FROM customers AS c
JOIN orders AS o USING (customerid)
JOIN order_details AS od USING(orderid)
JOIN products AS p USING(productid)
JOIN suppliers AS s USING (supplierid)
GROUP BY GROUPING SETS ((Buyer), (Supplier), (Buyer, Supplier))
ORDER BY Buyer, Supplier;

SELECT companyname, categoryname, SUM(od.unitprice * od.quantity) AS Amount
FROM customers
JOIN orders AS o USING (customerid)
JOIN order_details AS od USING(orderid)
JOIN products AS p USING(productid)
JOIN categories USING (categoryid)
GROUP BY GROUPING SETS ((companyname), (categoryname, companyname))
ORDER BY companyname, categoryname NULLS FIRST;

-- ROLL UP - figures out NULLS (else we have to do grouping set of individual fields)
SELECT companyname, categoryname, productname, SUM(od.unitprice * od.quantity) AS Amount
FROM customers
JOIN orders AS o USING (customerid)
JOIN order_details AS od USING(orderid)
JOIN products AS p USING(productid)
JOIN categories USING (categoryid)
GROUP BY ROLLUP (companyname, categoryname, productname)
-- equal to GROUPING SETS ((companyname, categoryname, productname), (companyname, categoryname), (companyname))
ORDER BY companyname, categoryname, productname;

SELECT s.companyname as Supplier, c.companyname as Buyer, productname, SUM(od.unitprice * od.quantity) AS Amount
FROM customers AS c
JOIN orders AS o USING (customerid)
JOIN order_details AS od USING(orderid)
JOIN products AS p USING(productid)
JOIN suppliers AS s USING(supplierid)
GROUP BY ROLLUP (Supplier, Buyer, productname)
ORDER BY Supplier, Buyer, productname;

-- CUBE figures out all the possible grouping set combinations - slices and dices by each possible combination, including null
SELECT companyname, categoryname, productname, SUM(od.unitprice * od.quantity) AS Amount
FROM customers
JOIN orders AS o USING (customerid)
JOIN order_details AS od USING(orderid)
JOIN products AS p USING(productid)
JOIN categories USING (categoryid)
GROUP BY CUBE (companyname, categoryname, productname)
ORDER BY companyname, categoryname, productname;

SELECT s.companyname as Supplier, c.companyname as Buyer, productname, SUM(od.unitprice * od.quantity) AS Amount
FROM customers AS c
JOIN orders AS o USING (customerid)
JOIN order_details AS od USING(orderid)
JOIN products AS p USING(productid)
JOIN suppliers AS s USING(supplierid)
GROUP BY CUBE (Supplier, Buyer, productname)
ORDER BY Supplier NULLS FIRST, Buyer NULLS FIRST, productname NULLS FIRST;
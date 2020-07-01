--northwind

-- using join instead of exists
SELECT DISTINCT(c.customerid), c.companyname
FROM customers as c
JOIN orders USING (customerid)
WHERE orderdate BETWEEN '1997-04-01' AND '1997-04-30'
ORDER BY c.customerid

-- same query using exists
SELECT customerid, companyname
FROM customers as c
WHERE EXISTS (
    SELECT *
    FROM orders as o
    WHERE (o.customerid = c.customerid) AND
    (orderdate BETWEEN '1997-04-01' AND '1997-04-30')
)
ORDER BY c.customerid

SELECT companyname
FROM suppliers as s
WHERE EXISTS (
    SELECT supplierid
    FROM products as p
    WHERE p.supplierid = s.supplierid AND unitprice > 200
)

-- join within exist subquery
SELECT productname
FROM products as p
WHERE NOT EXISTS (
    SELECT productid
    FROM orders as o
    JOIN order_details as od USING (orderid) 
    WHERE (od.productid = p.productid) AND
    (o.orderdate BETWEEN '1997-04-01' AND '1997-04-30')
)

SELECT companyname
FROM suppliers as s
WHERE NOT EXISTS (
    SELECT supplierid
    FROM products as p
    JOIN order_details as od USING (productid)
    JOIN orders as o USING (orderid)
    WHERE p.supplierid = s.supplierid AND 
    (o.orderdate BETWEEN '1996-12-01' AND '1996-12-31')
)

-- ANY
SELECT companyname
FROM customers
WHERE customerid = ANY (
    SELECT customerid
    FROM orders
    JOIN order_details USING (orderid)
    WHERE quantity > 50
)

SELECT companyname
FROM suppliers
WHERE supplierid = ANY(
    SELECT supplierid
    FROM order_details
    JOIN products USING (productid)
    WHERE quantity = 1
)

-- ALL
SELECT DISTINCT(productname)
FROM products as p
JOIN order_details as od USING(productid)
WHERE (od.unitprice * od.quantity) > ALL (
    SELECT AVG(unitprice * quantity)
    FROM order_details
    GROUP BY productid
)

SELECT DISTINCT(companyname)
FROM customers as c
JOIN orders as o USING(customerid)
JOIN order_details as od USING(orderid)
WHERE (od.quantity*od.unitprice) > ALL (
    SELECT AVG(unitprice*quantity)
    FROM order_details
    JOIN orders USING(orderid)
    GROUP BY customerid
)

-- IN
SELECT companyname
FROM customers
WHERE country IN (
    SELECT country
    FROM suppliers
) 
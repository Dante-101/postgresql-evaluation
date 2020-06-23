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
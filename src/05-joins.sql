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
SELECT companyname, orderid
FROM customers
LEFT JOIN orders ON customers.customerid = orders.customerid
WHERE orderid IS NULL;

SELECT *
FROM products
LEFT JOIN order_details ON products.productid = order_details.productid;
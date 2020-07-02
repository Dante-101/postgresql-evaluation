-- INSERT

-- INSERT INTO orders
-- (col1,col2)
-- VALUES (val1, val2)

INSERT INTO orders
(orderid,customerid, employeeid, orderdate, requireddate, shipvia,
 freight, shipname, shipaddress, shipcity, shippostalcode, shipcountry)
VALUES (11078, 'VINET', 4, '2017-09-16','2017-09-30',3,
        42.5, 'Vins et alcools Chevalier','59 rue de l''Abbaye', 'Reims', '51100', 'France');

INSERT INTO order_details
(orderid, productid, unitprice, quantity, discount)
VALUES (11078, 11, 14, 20, 0);

-- UPDATE
-- UPDATE orders
-- SET col1=val1, col2=val2
-- WHERE condition
UPDATE orders
SET requireddate='2017-09-20', freight=50
WHERE orderid=11078

UPDATE order_details
SET quantity=40, discount=0.05
WHERE orderid=11078 AND productid=11

-- DELETE
-- DELETE FROM table_name
-- WHERE condition

DELETE FROM order_details
WHERE orderid=11078 AND productid=11

-- SELECT INTO
-- creates new table of selected column
SELECT *
INTO suppliers_northamerica
FROM suppliers
WHERE country IN ('USA','Canada')

SELECT *
INTO orders_1997
FROM orders
WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31'

-- INSERT INTO SELECT
--  INSERT INTO table1(col1, col2)
--  SELECT col3, col4
--  FROM table2
--  WHERE condition

INSERT INTO suppliers_northamerica
SELECT *
FROM suppliers
WHERE country IN ('Brazil', 'Argentina')

INSERT INTO orders_1997
SELECT *
FROM orders
WHERE orderdate BETWEEN '1996-12-01' AND '1996-12-31'

-- RETURNING - to return the data
-- Add RETURNING fields to the end of the query
INSERT INTO employees
(firstname, lastname, title, employeeid, reportsto)
VALUES ('Bob', 'Smith', 'Mr', 50, 2)
RETURNING employeeid

UPDATE products
SET unitprice=unitprice*1.2
WHERE productid=1
RETURNING productid, unitprice

UPDATE order_details
SET quantity=quantity*2
WHERE orderid = 10248 AND productid=11
RETURNING quantity

DELETE FROM employees
WHERE employeeid=50
RETURNING *



--northwind

-- INDEX
CREATE INDEX index_name
ON table1(col1, col2)

CREATE INDEX idx_orders_customerid_orderid
ON orders (customerid, orderid)

-- UNIQUE
CREATE UNIQUE INDEX index_name
ON table1(col1, col2)

CREATE UNIQUE INDEX idx_employees_employeeid
ON employees (employeeid)

-- DROP INDEX
DROP INDEX idx_employees_employeeid
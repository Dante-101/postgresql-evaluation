-- northwind

-- UNION
SELECT companyname
FROM customers
UNION
SELECT companyname
FROM suppliers;

SELECT country
FROM customers
UNION
SELECT country
FROM suppliers
ORDER BY country DESC;

-- UNION ALL - doesn't dedupe
SELECT city
FROM customers
UNION ALL
SELECT city
FROM suppliers;

SELECT country
FROM customers
UNION ALL
SELECT country
FROM suppliers
ORDER BY country;

-- INTERSECT - only the values in both results
-- INTERSECT ALL - doesn't dedupe
SELECT country
FROM customers
INTERSECT
SELECT country
FROM suppliers
ORDER BY country;

SELECT country
FROM customers
INTERSECT ALL
SELECT country
FROM suppliers;

SELECT COUNT(*)
FROM
(SELECT country
FROM customers
INTERSECT ALL
SELECT country
FROM suppliers) as T

SELECT city
FROM customers
INTERSECT
SELECT city
FROM suppliers;

SELECT COUNT(*)
FROM
(SELECT city
FROM customers
INTERSECT ALL
SELECT city
FROM suppliers) as T

-- EXCEPT - set subtraction, with dedupe
-- EXCEPT ALL - without dedupe in both tables
SELECT country
FROM customers
EXCEPT
SELECT country
FROM suppliers

SELECT country
FROM customers
EXCEPT ALL
SELECT country
FROM suppliers
ORDER BY country

SELECT COUNT(*)
FROM
(SELECT country
FROM customers
EXCEPT ALL
SELECT country
FROM suppliers
ORDER BY country) AS T

SELECT city
FROM suppliers
EXCEPT
SELECT city
FROM customers

SELECT COUNT(*)
FROM
(SELECT city
FROM customers
EXCEPT ALL
SELECT city
FROM suppliers) AS T







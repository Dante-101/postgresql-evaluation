-- AdventureWorks

-- 1
SELECT name, weight, productnumber
FROM production.product
ORDER BY weight ASC;

-- 2
SELECT *
FROM purchasing.productvendor
WHERE productid=407
ORDER BY averageleadtime ASC;

-- 3
SELECT *
FROM sales.salesorderdetail
WHERE productid = 799
ORDER BY orderqty DESC;

-- 4
SELECT discountpct
FROM sales.specialoffer
ORDER BY discountpct DESC
LIMIT 1;

-- 5
SELECT sickleavehours as SLH
FROM humanresources.employee
ORDER BY SLH ASC
LIMIT 1;

-- 6
SELECT rejectedqty
FROM purchasing.purchaseorderdetail
ORDER BY rejectedqty DESC
LIMIT 1;

-- 7
SELECT AVG(rate)
FROM humanresources.employeepayhistory;

-- 8
SELECT AVG(standardcost)
FROM production.productcosthistory
WHERE productid = 738;

-- 9
SELECT SUM(scrappedqty)
FROM production.workorder
WHERE productid = 529;

-- 10
SELECT name
FROM purchasing.vendor
WHERE name LIKE 'G%';

-- 11
SELECT name
FROM purchasing.vendor
WHERE name LIKE '%Bike%';

-- 12
SELECT firstname
FROM person.person
WHERE firstname LIKE '_t%';

-- 13
SELECT *
FROM person.emailaddress
LIMIT 20;

-- 14
SELECT *
FROM production.productcategory
LIMIT 2;

-- 15
SELECT COUNT(*)
FROM production.product
WHERE weight IS NULL;

-- 16
SELECT COUNT(*)
FROM person.person
WHERE additionalcontactinfo IS NOT NULL;

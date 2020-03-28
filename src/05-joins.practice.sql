-- AdventureWorks

-- 01
SELECT firstname, middlename, lastname, Phone.phonenumber, PhoneType.name
FROM person.person AS Person
INNER JOIN person.businessentity AS Business ON Business.businessentityid = Person.businessentityid
INNER JOIN person.personphone AS Phone ON Phone.businessentityid = Person.businessentityid
INNER JOIN person.phonenumbertype AS PhoneType ON PhoneType.phonenumbertypeid = Phone.phonenumbertypeid
ORDER BY person.businessentityid DESC;

-- 02
SELECT
    PM.name AS ProductModelName,
    C.name AS CultureName,
    PD.description AS Description
FROM production.productmodel AS PM
INNER JOIN production.productmodelproductdescriptionculture USING (productmodelid)
INNER JOIN production.productdescription as PD USING (productdescriptionid)
INNER JOIN production.culture AS C USING (cultureid)
ORDER BY ProductModelName;

-- 03
SELECT
    P.name AS ProductName,
    PM.name AS ProductModelName,
    C.name AS CultureName,
    PD.description AS Description
FROM production.productmodel AS PM
INNER JOIN production.product AS P USING (productmodelid)
INNER JOIN production.productmodelproductdescriptionculture USING (productmodelid)
INNER JOIN production.productdescription as PD USING (productdescriptionid)
INNER JOIN production.culture AS C USING (cultureid)
ORDER BY ProductModelName;

-- 04
SELECT p.name AS ProductName, pr.rating, pr.comments
FROM production.product AS p
LEFT JOIN production.productreview AS pr USING (productid)
ORDER BY pr.rating ASC;

-- 05
SELECT p.name AS ProductName, wo.orderqty, wo.scrappedqty
FROM production.workorder AS wo
RIGHT JOIN production.product AS p USING (productid)
ORDER BY p.productid;



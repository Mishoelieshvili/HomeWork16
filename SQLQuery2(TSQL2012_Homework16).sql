--TSQL2012 

--1

SELECT e.firstname, e.lastname, e.city, o.orderdate
FROM HR.Employees e
JOIN Sales.Orders o ON e.empid = o.empid
WHERE e.city IN ('London','Madrid')

--2

SELECT UPPER(P.ProductName) AS ProductName_Uppercase, P.UnitPrice, C.CategoryName
FROM Production.Products P
JOIN Production.Categories C ON P.CategoryID = C.CategoryID
WHERE P.UnitPrice BETWEEN 20 AND 40

--3
SELECT e.lastname, e.firstname, o.orderid
FROM Sales.Orders o
JOIN HR.Employees e ON o.empid = e.empid
JOIN Sales.OrderDetails od ON o.orderid = od.orderid AND od.qty > 50

--4
SELECT o.orderdate AS Order_Date, c.contactname AS Last_Name, c.contacttitle AS First_Name, c.city AS City, c.address AS Address
FROM Sales.Orders o
JOIN Sales.Customers c ON o.custid = c.custid
WHERE YEAR(o.orderdate) = 2007 AND c.country = 'USA'

--5
SELECT DISTINCT shipcity AS City
FROM Sales.Orders
WHERE empid IN (SELECT empid FROM HR.Employees WHERE lastname = 'Cameron') AND shipcountry = 'USA' AND shipcity <> 'Virtue'

/*
SELECT DISTINCT o.shipcity AS City
FROM Sales.Orders o
JOIN HR.Employees e ON o.empid = e.empid
WHERE e.lastname = 'Cameron' AND o.shipcountry = 'USA' AND o.shipcity <> 'Virtue'
*/

--6

SELECT o.orderid, o.shipcountry, o.shipcity
FROM Sales.Orders o
JOIN Sales.Shippers s ON o.shipperid = s.shipperid
WHERE  IN ('Germany', 'Austria')

--7

SELECT p.ProductID, p.ProductName, s.CompanyName, s.Address, s.City, s.Region, s.Country, od.UnitPrice, od.Qty, od.Discount
FROM Production.Products p
INNER JOIN Production.Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN Sales.OrderDetails od ON p.ProductID = od.ProductID
WHERE s.City = 'Tokyo' AND od.Discount > 0

--8

SELECT ProductName, CategoryName
FROM Production.Products p
JOIN Production.Categories c ON p.CategoryID = c.CategoryID
WHERE p.SupplierID IN (
    SELECT SupplierID FROM Production.Suppliers WHERE Country = 'Japan'
)
AND CategoryName IN ('Seafood', 'Beverages')
ORDER BY CategoryName, ProductName

--9

SELECT e.LastName, e.FirstName, s.CompanyName
FROM HR.Employees e
INNER JOIN Sales.Orders o ON e.EmpID = o.EmpID
INNER JOIN Sales.Shippers s ON o.ShipperID = s.ShipperID
WHERE (e.LastName = 'Davis' AND e.FirstName = 'Sara')
   OR (e.LastName = 'Cameron' AND e.FirstName = 'Maria')
   AND YEAR(o.OrderDate) = 2007

--10

SELECT p.ProductName, c.CategoryName
FROM Production.Products p
INNER JOIN Production.Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN Production.Categories c ON p.CategoryID = c.CategoryID
WHERE s.Country = 'USA'
   AND c.CategoryName NOT IN ('Seafood', 'Juices')

--11



--12

SELECT DISTINCT c.ContactName AS FirstName, c.LastName
FROM Sales.Customers c
INNER JOIN Sales.Orders o ON c.CustomerID = o.CustomerID
INNER JOIN Sales.OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Production.Products p ON od.ProductID = p.ProductID
INNER JOIN Production.Categories cat ON p.CategoryID = cat.CategoryID
WHERE cat.CategoryName IN ('Beverages', 'Dairy Products')





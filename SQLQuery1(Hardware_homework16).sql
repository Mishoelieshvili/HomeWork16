--Subquery
--Hardware

--1

SELECT m.name AS manufacturer_name, p.name AS product_name, m.ManufacturerId AS product_cost
FROM Products p
JOIN Manufacturers m ON p.manufacturerid = m.manufacturerid
WHERE m.name = 'Hewlett-Packard'


--2

SELECT p.name AS product_name, m.ManufacturerId AS product_cost
FROM Products p
LEFT JOIN Manufacturers m ON p.manufacturerid = m.manufacturerid
WHERE m.name <> 'Fujitsu'

--3

SELECT m.name AS manufacturer_name, p.name AS product_name, m.ManufacturerId AS product_value
FROM Products p
JOIN Manufacturers m ON p.manufacturerid = m.manufacturerid
WHERE m.name IN ('Sony', 'Fujitsu', 'IBM', 'Intel')


--4

SELECT m.name AS manufacturer_name
FROM Products p
JOIN Manufacturers m ON p.manufacturerid = m.manufacturerid
GROUP BY m.name
HAVING MAX(Price) > 200

--5

SELECT m.name AS manufacturer_name, p.name AS product_name, price AS product_cost
FROM Products p
JOIN Manufacturers m ON p.manufacturerid = m.manufacturerid
WHERE m.name NOT IN ('Genius', 'Dell')

--6

SELECT COUNT(DISTINCT manufacturerid) AS num_drive_manufacturers
FROM Products
WHERE name LIKE '%drive%'

--7

SELECT COUNT(*) AS num_high_price_intel_products
FROM Products p
JOIN Manufacturers m ON p.manufacturerid = m.manufacturerid
WHERE m.name = 'Intel' AND p.price > (
  SELECT AVG(price) 
  FROM Products 
  WHERE manufacturerid = m.manufacturerid
)



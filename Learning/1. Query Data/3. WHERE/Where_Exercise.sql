--1. Write a query to retrieve all products with a unit price greater than $200 from the Products table.
select * from Products where UnitPrice > 200

--2. Write a query to find all customers from Columbus, OH from the Customers table.
select * from Customers
where City = 'Columbus' and State = 'OH'

--3. Write a query to list all orders placed after January 1, 2022 from the Orders table.
select * from Orders
where OrderDate > '2022-01-01'

--4. Write a query to find all products in the "Engine Parts" category (CategoryID = 1) that have fewer than 30 units in stock.
select ProductName, CategoryID, UnitsInStock 
from Products
where CategoryID = 1 and UnitsInStock < 30
order by UnitsInStock asc

--5. Write a query to retrieve all vehicles manufactured between 2018 and 2020 (inclusive) from the Vehicles table.
select * from Vehicles
where Year between 2018 and 2020 

--6. Write a query to find all suppliers with a credit rating of 4 or 5 from the Suppliers table.
select * from Suppliers
where CreditRating between 4 and 5

--7. Write a query to list all customers whose email address contains "gmail.com" from the Customers table.
select * from Customers
where Email like '%email.com'

--8. Write a query to find all employees hired in 2021 from the Employees table.
select * from Employees where Year(HireDate) = '2021'

--9. Write a query to retrieve all orders that have not been shipped yet 
-- (ShippedDate is NULL) from the Orders table.
select * from Orders
where ShippedDate is null

--10. Write a query to find all products that are either 
-- low in stock (UnitsInStock < 20) or discontinued (Discontinued = 1) from the Products table.
select ProductID, ProductName, UnitsInStock, Discontinued from Products
where UnitsInStock < 20 or Discontinued = 1
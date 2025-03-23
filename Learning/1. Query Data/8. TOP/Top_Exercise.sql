--1. Write a query to find the 5 most expensive products in the Products table.
select top 5 ProductID, ProductName, UnitPrice 
from Products 
order by UnitPrice desc

--2. Write a query to list the 10 most recently hired employees from the Employees table.
select top 10 FirstName, LastName, HireDate 
from Employees
order by HireDate desc

--3. Write a query to get the top 3 customers with the highest total purchases from the Customers table.
select top 3 CustomerID, FirstName, LastName, TotalPurchases 
from Customers
order by TotalPurchases desc

-- TODO: some research
--4. Write a query to find the 10% of products with the lowest inventory levels from the Products table.
select * from Products

--5. Write a query to list the 5 oldest orders that haven't been shipped yet from the Orders table.
select top 5 OrderID, CustomerID, ShippedDate 
from Orders
where ShippedDate is null

--6. Write a query to find the top 3 categories with the most products, including any that tie with the third.
select top 3 ProductName, CategoryID
from Products
order by UnitsInStock desc

--7. Write a query to get the 5 most recent payments received from the Payments table.
select top 5 PaymentDate 
from Payments
order by PaymentDate desc

--8. Write a query to find the top 10 products with the highest inventory value (UnitPrice * UnitsInStock).
select top 10 ProductName, UnitPrice, UnitsInStock, (UnitPrice * UnitsInStock) as InventoryValue
from Products
order by InventoryValue desc

--9. Write a query to list the 5 suppliers who provide the most products, including any that tie with the fifth.
select top 5 * from Suppliers

--10. Write a query to get the 7 most recent vehicles added to the database from the Vehicles table.
select top 7 Make, Model, Year, VIN, EngineType, DateAdded
from Vehicles
order by DateAdded desc
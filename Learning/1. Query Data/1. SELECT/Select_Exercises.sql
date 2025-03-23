--1. Write a query to display all columns from the Customers table.
select * from Customers

--2. Write a query to display only the FirstName, LastName, and Email columns from the Customers table.
select FirstName, LastName, Email from Customers

--3. Write a query to display the ProductName, UnitPrice, and UnitsInStock columns from the Products table.
select ProductName, UnitPrice, UnitsInStock from Products

--4. Write a query to display the OrderID, OrderDate, and CustomerID columns from the Orders table.
select OrderID, OrderDate, CustomerID from Orders

--5. Write a query to display the EmployeeID, FirstName, and 
-- LastName columns from the Employees table with more readable column names: 'ID', 'First Name', and 'Last Name'.
select EmployeeID, FirstName, LastName from Employees

--6. Write a query to display the ProductName 
-- and the total value of each product in inventory (UnitPrice * UnitsInStock) from the Products table. Name the calculated column 'Total Value'.
select ProductName, (UnitPrice * UnitsInStock) as TotalValue
from Products
order by TotalValue asc

--7. Write a query to display the FirstName and LastName columns from the Customers table combined into a single column called 'Full Name'.
select (FirstName + ' ' + LastName) as FullName 
from Customers

--8. Write a query to display the OrderID, OrderDate, and a new column showing the year of the order called 'Order Year' from the Orders table.
select OrderID, OrderDate, year(OrderDate) as OrderYear from Orders

--9. Write a query to display the ProductName and price with a 10% discount from the Products table. Label the discounted price as 'Sale Price'.
select ProductName, convert(decimal(10,2), (UnitPrice - (UnitPrice * 0.10))) as SalePrice from Products

--10. Write a query to display the VehicleID, Make, Model, and Year columns from the Vehicles table, 
-- along with a new column called 'Vehicle Description' that combines these values (e.g., "2019 Honda Civic").
select VehicleID, Make, Model, Year, concat('e.g.,',' "', Year, ' ', Make, ' ', Model, '"') as VehicleDescription
from Vehicles
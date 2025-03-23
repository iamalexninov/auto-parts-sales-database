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

-- TODO: Claude Sonnet or ChatGTP
/*
great but I saw something, we have empty tables. Now i will give you the tables, fill each table with 3 rows, that are the tables:
Inventory
OrderDetails
Orders
Payments
Promotions
ReturnDetails
Returns
Shipping
*/
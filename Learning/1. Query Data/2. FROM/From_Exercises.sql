--1. Write a query to retrieve all columns from the Suppliers table.
select * from Suppliers

--2. Write a query to retrieve the ProductName and UnitPrice from the Products table.
select ProductName, UnitPrice from Products

--3. Write a query to retrieve the FirstName and LastName columns from the Employees table using 'e' as a table alias.
select e.FirstName, e.LastName from Employees as e

--4. Write a query to retrieve the OrderID, OrderDate, and Status columns from the Orders table using an alias of 'o'.
select o.OrderID, o.OrderDate, o.Status from Orders as o

--5. Write a query to retrieve data from the Vehicles table, showing only the Make, Model, and Year columns.
select Make, Model, Year from Vehicles

--6. Write a query to retrieve data from the Categories table, showing the CategoryName and Description columns.
select CategoryName, Description from Categories

--7. Write a query to retrieve data from the OrderDetails table, showing the OrderID, ProductID, and Quantity columns.
select OrderID, ProductID, Quantity from OrderDetails

--8. Write a query to retrieve data from the Customers table using the alias 'cust', 
-- showing the CustomerID, FirstName, and LastName columns with the alias prefix.
select cust.CustomerID, cust.FirstName, cust.LastName from Customers cust

--9. Write a query to retrieve data from the Inventory table, showing all columns with and without using table aliases.
select * from Inventory

--10. Write a query to retrieve data from the Payments table using the alias 'pay', 
-- showing the PaymentID, OrderID, and Amount columns with the alias prefix.  
select pay.PaymentID, pay.OrderID, pay.Amount from Payments as pay
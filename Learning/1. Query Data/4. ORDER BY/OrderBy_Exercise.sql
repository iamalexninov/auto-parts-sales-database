--1. Write a query to retrieve the ProductName and UnitPrice from the Products table, sorted by price from lowest to highest.
select ProductName, UnitPrice 
from Products
order by UnitPrice asc

--2. Write a query to list all customers (FirstName, LastName, City, State) sorted alphabetically by last name.
select FirstName, LastName, City, State 
from Customers
order by LastName

--3. Write a query to display all orders (OrderID, OrderDate, TotalAmount) sorted by date, with the most recent orders first.v
select OrderID, OrderDate, TotalAmount 
from Orders
order by OrderDate desc

--4. Write a query to list products (ProductName, CategoryID, UnitPrice) 
-- sorted first by category (ascending) and then by price (descending) within each category.
select ProductName, CategoryID, UnitPrice 
from Products
order by CategoryID asc, UnitPrice desc

--5. Write a query to retrieve employees (FirstName, LastName, HireDate) 
-- sorted by their hire date, showing the longest-tenured employees first.
select FirstName, LastName, HireDate 
from Employees
order by HireDate asc

--6. Write a query to display suppliers (CompanyName, City, State) 
-- sorted alphabetically by state, and then by city within each state.
select CompanyName, City, State 
from Suppliers
order by State asc, City asc

--7. Write a query to list vehicles (Make, Model, Year) sorted first by Make alphabetically, then by Year from newest to oldest.
select Make, Model, Year 
from Vehicles
order by Make asc, Year asc

--8. Write a query to retrieve products (ProductName, UnitsInStock, ReorderLevel) 
-- sorted by the difference between current stock and reorder level, showing the most urgently needed restocks first.
select ProductName, UnitsInStock, ReorderLevel 
from Products
order by UnitsInStock - ReorderLevel asc

--9. Write a query to display orders (OrderID, CustomerID, OrderDate) placed in 2022, sorted by the customer ID and then by date.
select OrderID, CustomerID, OrderDate 
from Orders
order by CustomerID, OrderDate

--10. Write a query to list the top-selling products (ProductName, UnitPrice) 
-- sorted by price from highest to lowest, then alphabetically by name for products with the same price.
select ProductName, UnitPrice 
from Products
order by UnitPrice desc, ProductName asc
--1. Write a query to count the number of customers in each state from the Customers table.
select FirstName, LastName, count(CustomerID) as CustomerCount
from Customers
group by FirstName, LastName

--2. Write a query to calculate the total sales amount for each product from the OrderDetails table.
select OrderID, ProductID, sum(Quantity) as TotalSalesAmount 
from OrderDetails
group by OrderID, ProductID

--3. Write a query to find the average price of products for each supplier from the Products table.
select SupplierID, convert(decimal(10,2), avg(UnitPrice)) as AveragePrice 
from Products
group by SupplierID
order by AveragePrice asc

--4. Write a query to count the number of orders placed by each customer from the Orders table.
select CustomerID, count(OrderID) as NumberOfOrders
from Orders
group by CustomerID

--5. Write a query to calculate the total inventory value (UnitPrice * UnitsInStock) for each category from the Products table.
select 
	CategoryID, 
	convert(decimal(10, 2), sum(UnitPrice * UnitsInStock)) as TotalInventoryValue
from Products
group by CategoryID
order by CategoryID ,TotalInventoryValue;

--6. Write a query to find the number of vehicles of each make in the Vehicles table.
select Make, count(Make) as NumberOfManufatorers 
from Vehicles
group by Make
order by NumberOfManufatorers desc;

--7. Write a query to calculate the total salary expenditure for each job title from the Employees table.
select Title, sum(Salary) as TotalSalary 
from Employees
group by Title
order by TotalSalary asc

--8. Write a query to count the number of products in each category that are below their reorder level from the Products table.
select CategoryID, count(UnitsInStock) as NumberOfProducts
from Products
group by CategoryID

--9. Write a query to find the maximum, minimum, and average order amount for each month of 2022 from the Orders table.
select  
	month(OrderDate) as Month, 
	min(TotalAmount) as MinTotalAmount, 
	max(TotalAmount) as MaxTotalAmount, 
	avg(TotalAmount) as AverageTotalAmount
from Orders
where year(OrderDate) = '2025'
group by month(OrderDate)
order by Month;

--10. Write a query to calculate the number of orders 
-- and total revenue for each employee from the Orders table (join with OrderDetails if needed).
select 
	EmployeeID, 
	count(OrderID) as NumberOfOrders, 
	sum(TotalAmount) as TotalRevenue
from Orders
group by EmployeeID
order by TotalRevenue desc;
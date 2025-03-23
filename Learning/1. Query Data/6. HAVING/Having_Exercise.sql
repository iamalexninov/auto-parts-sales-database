--1. Write a query to find categories that have more than 5 products in the Products table.
select CategoryID, count(ProductID) as ProductsPerCategory
from Products
group by CategoryID
having COUNT(ProductID) >= 5

--2. Write a query to find customers who have placed orders totaling more than $300 using the Orders table.
select CustomerID, sum(TotalAmount)  
from Orders
group by CustomerID
having sum(TotalAmount) >= 300

--3. Write a query to find suppliers who provide products with an average price greater than $100 from the Products table.
select SupplierID, convert(decimal(10, 2), avg(UnitPrice)) as AvgPrice
from Products 
group by SupplierID
having avg(UnitPrice) > 100
order by AvgPrice asc


--4. Write a query to find states that have more than 2 customers from the Customers table.
select State, count(CustomerID) as CustomersInState
from Customers
group by State
having count(CustomerID) > 2

--5. Write a query to find product categories where the most expensive product costs 
-- at least twice as much as the cheapest product.
select CategoryID, min(UnitPrice), max(UnitPrice), count(ProductID) as CountProductsPerCategory 
from Products
group by CategoryID
having 2 * min(UnitPrice) = max(UnitPrice)

--6. Write a query to find customers who have placed at least 3 orders in 2022 from the Orders table.
select CustomerID, count(OrderID) as NumberOfOrders
from Orders
where year(OrderDate) = '2025'
group by CustomerID
having count(OrderID) > 1

--7. Write a query to find employees who have processed orders with a total value exceeding $400.
select EmployeeID, sum(TotalAmount) as OrderTotalValue
from Orders
group by EmployeeID
having sum(TotalAmount) > 400
 
--8. Write a query to find vehicle makes that appear more than twice in the Vehicles table.
select Make, Count(Make) as MakeCount 
from Vehicles
group by Make
order by MakeCount asc

--9. Write a query to find categories where the total inventory value (UnitPrice * UnitsInStock) is less than $5000.
select CategoryID, sum(UnitPrice * UnitsInStock) as TotalInventoryValue 
from Products
group by CategoryID
having sum(UnitPrice * UnitsInStock) < 5000
order by TotalInventoryValue

--10. Write a query to find months in 2025 with the average order amount.
select MONTH(OrderDate) as Month, avg(OrderID) as AverageOrderAmount 
from Orders
where YEAR(OrderDate) = '2025'
group by MONTH(OrderDate)
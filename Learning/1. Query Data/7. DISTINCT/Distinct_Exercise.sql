--1. Write a query to find all unique states where customers are located using the Customers table.
select distinct State from Customers

--2. Write a query to list all unique product categories that have at least one product in stock.
select distinct CategoryID from Products

--3. Write a query to find all unique combinations of make and model from the Vehicles table.
select distinct (Make + ' ' + Model) as MakeModel from Vehicles

--4. Write a query to list all distinct payment methods used by customers from the Payments table.
select distinct PaymentMethod from Payments

--5. Write a query to find all unique employee titles (job positions) from the Employees table.
select distinct Title from Employees

--6. Write a query to find all unique years represented in the vehicle inventory from the Vehicles table.
select distinct Year from Vehicles

--7. Write a query to count the number of distinct cities where suppliers are located.
select distinct City from Suppliers

--8. Write a query to list all unique order status values that exist in the Orders table.
select distinct Status from Orders

--9. Write a query to find all distinct combinations of category and supplier for products with a price greater than $100.
select distinct CategoryID, SupplierID from Products

--10. Write a query to list all unique shipping carriers used for orders from the Shipping table.
select distinct Carrier from Shipping
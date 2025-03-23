# SQL Query Data: TOP Clause

## Clause Explanation

The `TOP` clause in SQL Server is used to limit the number of rows returned by a query. It allows you to specify a fixed number or percentage of rows to retrieve from the result set.

### Basic Syntax:
```sql
SELECT TOP (n) [PERCENT] [WITH TIES] column1, column2, ...
FROM table_name
[ORDER BY column1 [ASC|DESC], ...];
```

### Key Points:
- TOP limits the number of rows returned in the result set
- It must be used with the SELECT statement
- TOP requires a positive integer or variable specifying how many rows to return
- You can use PERCENT to return a percentage of rows instead of a fixed number
- WITH TIES returns additional rows that tie with the last row in the result set (requires ORDER BY)
- Without ORDER BY, TOP returns an arbitrary set of rows
- TOP is SQL Server-specific (other databases may use LIMIT or FETCH)
- TOP is processed after the WHERE clause but before ORDER BY

## Clause Examples

### Example 1: Basic TOP usage
```sql
-- Get the 5 most expensive products
SELECT TOP 5 ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;
```

### Example 2: TOP with PERCENT
```sql
-- Get the top 10% most expensive products
SELECT TOP 10 PERCENT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;
```

### Example 3: TOP WITH TIES
```sql
-- Get the 5 most expensive products, including any that tie with the 5th
SELECT TOP 5 WITH TIES ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;
```

### Example 4: TOP without ORDER BY (not recommended)
```sql
-- Get any 10 products (order is not guaranteed)
SELECT TOP 10 ProductName, UnitPrice
FROM Products;
```

### Example 5: TOP with WHERE clause
```sql
-- Get the 3 most expensive products that are in stock
SELECT TOP 3 ProductName, UnitPrice, UnitsInStock
FROM Products
WHERE UnitsInStock > 0
ORDER BY UnitPrice DESC;
```

### Example 6: TOP for pagination
```sql
-- Get products 11-20 when sorted by price (requires SQL Server 2012+)
SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;
```

## Exercises

Practice these exercises to strengthen your understanding of the TOP clause.

### Exercise 1
Write a query to find the 5 most expensive products in the Products table.

### Exercise 2
Write a query to list the 10 most recently hired employees from the Employees table.

### Exercise 3
Write a query to get the top 3 customers with the highest total purchases from the Customers table.

### Exercise 4
Write a query to find the 10% of products with the lowest inventory levels from the Products table.

### Exercise 5
Write a query to list the 5 oldest orders that haven't been shipped yet from the Orders table.

### Exercise 6
Write a query to find the top 3 categories with the most products, including any that tie with the third.

### Exercise 7
Write a query to get the 5 most recent payments received from the Payments table.

### Exercise 8
Write a query to find the top 10 products with the highest inventory value (UnitPrice * UnitsInStock).

### Exercise 9
Write a query to list the 5 suppliers who provide the most products, including any that tie with the fifth.

### Exercise 10
Write a query to get the 7 most recent vehicles added to the database from the Vehicles table.

# SQL Query Data: GROUP BY Clause

## Clause Explanation

The `GROUP BY` clause in SQL is used to arrange identical data into groups. It is commonly used with aggregate functions (like COUNT, SUM, AVG, MAX, MIN) to perform calculations on each group of data.

### Basic Syntax:
```sql
SELECT column1, column2, ..., aggregate_function(column)
FROM table_name
[WHERE condition]
GROUP BY column1, column2, ...;
```

### Key Points:
- GROUP BY collects data across multiple records and groups the results by one or more columns
- Columns in the SELECT statement must either be included in the GROUP BY clause or be part of an aggregate function
- GROUP BY is processed after the WHERE clause but before the HAVING clause
- Multiple columns can be specified in the GROUP BY clause to create more specific groups
- GROUP BY is often used with aggregate functions like COUNT, SUM, AVG, MAX, and MIN
- NULL values are considered a group in GROUP BY operations

## Clause Examples

### Example 1: Simple grouping with COUNT
```sql
-- Count the number of products in each category
SELECT CategoryID, COUNT(*) AS ProductCount
FROM Products
GROUP BY CategoryID;
```

### Example 2: Grouping with SUM
```sql
-- Calculate total stock value by category
SELECT CategoryID, SUM(UnitPrice * UnitsInStock) AS TotalValue
FROM Products
GROUP BY CategoryID;
```

### Example 3: Grouping by multiple columns
```sql
-- Count products by category and supplier
SELECT CategoryID, SupplierID, COUNT(*) AS ProductCount
FROM Products
GROUP BY CategoryID, SupplierID;
```

### Example 4: Grouping with AVG
```sql
-- Calculate average price by category
SELECT CategoryID, AVG(UnitPrice) AS AveragePrice
FROM Products
GROUP BY CategoryID;
```

### Example 5: Using WHERE with GROUP BY
```sql
-- Count in-stock products by category
SELECT CategoryID, COUNT(*) AS ProductCount
FROM Products
WHERE UnitsInStock > 0
GROUP BY CategoryID;
```

### Example 6: Using GROUP BY with MAX and MIN
```sql
-- Find the price range (min and max) for each category
SELECT CategoryID, 
       MIN(UnitPrice) AS LowestPrice,
       MAX(UnitPrice) AS HighestPrice
FROM Products
GROUP BY CategoryID;
```

## Exercises

Practice these exercises to strengthen your understanding of the GROUP BY clause.

### Exercise 1
Write a query to count the number of customers in each state from the Customers table.

### Exercise 2
Write a query to calculate the total sales amount for each product from the OrderDetails table.

### Exercise 3
Write a query to find the average price of products for each supplier from the Products table.

### Exercise 4
Write a query to count the number of orders placed by each customer from the Orders table.

### Exercise 5
Write a query to calculate the total inventory value (UnitPrice * UnitsInStock) for each category from the Products table.

### Exercise 6
Write a query to find the number of vehicles of each make in the Vehicles table.

### Exercise 7
Write a query to calculate the total salary expenditure for each job title from the Employees table.

### Exercise 8
Write a query to count the number of products in each category that are below their reorder level from the Products table.

### Exercise 9
Write a query to find the maximum, minimum, and average order amount for each month of 2022 from the Orders table.

### Exercise 10
Write a query to calculate the number of orders and total revenue for each employee from the Orders table (join with OrderDetails if needed).

# SQL Query Data: DISTINCT Clause

## Clause Explanation

The `DISTINCT` keyword in SQL is used with SELECT to eliminate duplicate rows from a result set. It ensures that only unique values or combinations of values are returned.

### Basic Syntax:
```sql
SELECT DISTINCT column1, column2, ...
FROM table_name;
```

### Key Points:
- DISTINCT eliminates duplicate rows from the result set
- When used with multiple columns, DISTINCT considers the combination of all columns
- DISTINCT can significantly reduce the number of rows returned
- DISTINCT is applied to all columns in the SELECT list, not just one column
- DISTINCT can impact performance on large tables, as it requires additional processing
- NULL values are considered equal to each other for DISTINCT operations
- DISTINCT cannot be used with aggregate functions directly (use GROUP BY instead)

## Clause Examples

### Example 1: Basic DISTINCT usage
```sql
-- Get a list of all unique categories that have products
SELECT DISTINCT CategoryID
FROM Products;
```

### Example 2: DISTINCT with multiple columns
```sql
-- Get unique combinations of state and city
SELECT DISTINCT State, City
FROM Customers;
```

### Example 3: DISTINCT with WHERE clause
```sql
-- Get distinct product categories for items with more than 20 in stock
SELECT DISTINCT CategoryID
FROM Products
WHERE UnitsInStock > 20;
```

### Example 4: DISTINCT to find unique values
```sql
-- Find all unique job titles in the company
SELECT DISTINCT Title
FROM Employees;
```

### Example 5: Counting distinct values
```sql
-- Count how many different categories we have products for
SELECT COUNT(DISTINCT CategoryID) AS UniqueCategories
FROM Products;
```

### Example 6: DISTINCT with ORDER BY
```sql
-- Get all unique states where customers are located, in alphabetical order
SELECT DISTINCT State
FROM Customers
ORDER BY State;
```

## Exercises

Practice these exercises to strengthen your understanding of the DISTINCT clause.

### Exercise 1
Write a query to find all unique states where customers are located using the Customers table.

### Exercise 2
Write a query to list all unique product categories that have at least one product in stock.

### Exercise 3
Write a query to find all unique combinations of make and model from the Vehicles table.

### Exercise 4
Write a query to list all distinct payment methods used by customers from the Payments table.

### Exercise 5
Write a query to find all unique employee titles (job positions) from the Employees table.

### Exercise 6
Write a query to find all unique years represented in the vehicle inventory from the Vehicles table.

### Exercise 7
Write a query to count the number of distinct cities where suppliers are located.

### Exercise 8
Write a query to list all unique order status values that exist in the Orders table.

### Exercise 9
Write a query to find all distinct combinations of category and supplier for products with a price greater than $100.

### Exercise 10
Write a query to list all unique shipping carriers used for orders from the Shipping table.

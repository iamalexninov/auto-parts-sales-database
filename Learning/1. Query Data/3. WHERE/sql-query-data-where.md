# SQL Query Data: WHERE Clause

## Clause Explanation

The `WHERE` clause in SQL is used to filter the results of a query based on specified conditions. It allows you to retrieve only the records that match your criteria.

### Basic Syntax:
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

### Key Points:
- The WHERE clause filters rows based on a specified condition
- Multiple conditions can be combined using AND, OR, and NOT operators
- Common comparison operators include: =, <>, <, >, <=, >=
- You can use special operators like BETWEEN, IN, LIKE, and IS NULL
- The WHERE clause is applied before GROUP BY and HAVING
- Conditions are evaluated for each row individually

## Clause Examples

### Example 1: Simple comparison
```sql
-- Retrieve products with a price greater than $100
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > 100;
```

### Example 2: Multiple conditions with AND
```sql
-- Retrieve products with price between $50 and $100
SELECT ProductName, UnitPrice, UnitsInStock
FROM Products
WHERE UnitPrice >= 50 AND UnitPrice <= 100;
```

### Example 3: Using the BETWEEN operator
```sql
-- Same query using BETWEEN operator
SELECT ProductName, UnitPrice, UnitsInStock
FROM Products
WHERE UnitPrice BETWEEN 50 AND 100;
```

### Example 4: Using the IN operator
```sql
-- Retrieve products from specific categories
SELECT ProductName, CategoryID
FROM Products
WHERE CategoryID IN (1, 3, 5);
```

### Example 5: Using the LIKE operator for pattern matching
```sql
-- Find products with names starting with 'P'
SELECT ProductName
FROM Products
WHERE ProductName LIKE 'P%';
```

### Example 6: Using the IS NULL condition
```sql
-- Find orders that have not been shipped
SELECT OrderID, CustomerID, OrderDate
FROM Orders
WHERE ShippedDate IS NULL;
```

### Example 7: Combining multiple conditions
```sql
-- Find active products with low stock
SELECT ProductID, ProductName, UnitsInStock
FROM Products
WHERE Discontinued = 0 
  AND UnitsInStock < ReorderLevel;
```

## Exercises

Practice these exercises to strengthen your understanding of the WHERE clause.

### Exercise 1
Write a query to retrieve all products with a unit price greater than $200 from the Products table.

### Exercise 2
Write a query to find all customers from Columbus, OH from the Customers table.

### Exercise 3
Write a query to list all orders placed after January 1, 2022 from the Orders table.

### Exercise 4
Write a query to find all products in the "Engine Parts" category (CategoryID = 1) that have fewer than 30 units in stock.

### Exercise 5
Write a query to retrieve all vehicles manufactured between 2018 and 2020 (inclusive) from the Vehicles table.

### Exercise 6
Write a query to find all suppliers with a credit rating of 4 or 5 from the Suppliers table.

### Exercise 7
Write a query to list all customers whose email address contains "gmail.com" from the Customers table.

### Exercise 8
Write a query to find all employees hired in 2021 from the Employees table.

### Exercise 9
Write a query to retrieve all orders that have not been shipped yet (ShippedDate is NULL) from the Orders table.

### Exercise 10
Write a query to find all products that are either low in stock (UnitsInStock < 20) or discontinued (Discontinued = 1) from the Products table.

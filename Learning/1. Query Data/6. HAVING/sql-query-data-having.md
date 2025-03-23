# SQL Query Data: HAVING Clause

## Clause Explanation

The `HAVING` clause in SQL is used to filter the results of a GROUP BY. While the WHERE clause filters individual rows before grouping, HAVING filters the groups after they are formed.

### Basic Syntax:
```sql
SELECT column1, column2, ..., aggregate_function(column)
FROM table_name
[WHERE condition]
GROUP BY column1, column2, ...
HAVING condition;
```

### Key Points:
- HAVING is used to specify a condition for groups created by the GROUP BY clause
- HAVING is often used with aggregate functions (COUNT, SUM, AVG, MAX, MIN)
- The HAVING clause is applied after the GROUP BY operation
- WHERE filters rows before they are grouped, while HAVING filters groups after they are formed
- HAVING can reference aggregate functions, whereas WHERE cannot
- If you're not using GROUP BY, use WHERE instead of HAVING
- HAVING is processed after SELECT and GROUP BY but before ORDER BY

## Clause Examples

### Example 1: Basic HAVING with COUNT
```sql
-- Find categories with more than 5 products
SELECT CategoryID, COUNT(*) AS ProductCount
FROM Products
GROUP BY CategoryID
HAVING COUNT(*) > 5;
```

### Example 2: HAVING with SUM
```sql
-- Find suppliers whose products have total stock value over $5000
SELECT SupplierID, SUM(UnitPrice * UnitsInStock) AS TotalValue
FROM Products
GROUP BY SupplierID
HAVING SUM(UnitPrice * UnitsInStock) > 5000;
```

### Example 3: Using WHERE and HAVING together
```sql
-- Find categories of non-discontinued products with average price > $50
SELECT CategoryID, AVG(UnitPrice) AS AveragePrice
FROM Products
WHERE Discontinued = 0
GROUP BY CategoryID
HAVING AVG(UnitPrice) > 50;
```

### Example 4: HAVING with multiple conditions
```sql
-- Find categories with more than 5 products and average price > $100
SELECT CategoryID, COUNT(*) AS ProductCount, AVG(UnitPrice) AS AveragePrice
FROM Products
GROUP BY CategoryID
HAVING COUNT(*) > 5 AND AVG(UnitPrice) > 100;
```

### Example 5: HAVING with MIN and MAX
```sql
-- Find categories where price range (max-min) is greater than $200
SELECT CategoryID, MIN(UnitPrice) AS MinPrice, MAX(UnitPrice) AS MaxPrice
FROM Products
GROUP BY CategoryID
HAVING MAX(UnitPrice) - MIN(UnitPrice) > 200;
```

### Example 6: HAVING with COUNT DISTINCT
```sql
-- Find customers who ordered more than 3 different products
SELECT CustomerID, COUNT(DISTINCT ProductID) AS UniqueProducts
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY CustomerID
HAVING COUNT(DISTINCT ProductID) > 3;
```

## Exercises

Practice these exercises to strengthen your understanding of the HAVING clause.

### Exercise 1
Write a query to find categories that have more than 5 products in the Products table.

### Exercise 2
Write a query to find customers who have placed orders totaling more than $1000 using the Orders table.

### Exercise 3
Write a query to find suppliers who provide products with an average price greater than $100 from the Products table.

### Exercise 4
Write a query to find states that have more than 2 customers from the Customers table.

### Exercise 5
Write a query to find product categories where the most expensive product costs at least twice as much as the cheapest product.

### Exercise 6
Write a query to find customers who have placed at least 3 orders in 2022 from the Orders table.

### Exercise 7
Write a query to find employees who have processed orders with a total value exceeding $5000.

### Exercise 8
Write a query to find vehicle makes that appear more than twice in the Vehicles table.

### Exercise 9
Write a query to find categories where the total inventory value (UnitPrice * UnitsInStock) is less than $1000.

### Exercise 10
Write a query to find months in 2022 where the average order amount was higher than the yearly average.

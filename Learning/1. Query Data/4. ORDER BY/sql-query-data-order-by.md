# SQL Query Data: ORDER BY Clause

## Clause Explanation

The `ORDER BY` clause in SQL is used to sort the result set of a query based on one or more columns. It allows you to control the order in which rows appear in your query results.

### Basic Syntax:
```sql
SELECT column1, column2, ...
FROM table_name
[WHERE condition]
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;
```

### Key Points:
- By default, ORDER BY sorts in ascending order (ASC)
- Use DESC keyword to sort in descending order
- You can sort by multiple columns (secondary sort)
- You can sort by columns that are not in the SELECT list
- You can sort by column position (e.g., ORDER BY 1, 2)
- NULL values are considered the lowest values in ascending sorts
- ORDER BY is typically the last clause in a SELECT statement (except for OFFSET/FETCH)

## Clause Examples

### Example 1: Simple ascending sort
```sql
-- Sort products by price (lowest to highest)
SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice;
```

### Example 2: Descending sort
```sql
-- Sort products by price (highest to lowest)
SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;
```

### Example 3: Sort by multiple columns
```sql
-- Sort customers by state, then by last name
SELECT FirstName, LastName, State, City
FROM Customers
ORDER BY State, LastName;
```

### Example 4: Mixing ascending and descending sorts
```sql
-- Sort by category ascending, then by price descending
SELECT ProductName, CategoryID, UnitPrice
FROM Products
ORDER BY CategoryID ASC, UnitPrice DESC;
```

### Example 5: Sorting by column that's not in SELECT list
```sql
-- Sort by units in stock, even though it's not displayed
SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitsInStock DESC;
```

### Example 6: Sorting by column position
```sql
-- Sort by the second column (UnitPrice)
SELECT ProductName, UnitPrice
FROM Products
ORDER BY 2 DESC;
```

### Example 7: Using ORDER BY with complex expressions
```sql
-- Sort by inventory value
SELECT ProductName, UnitPrice, UnitsInStock, 
       UnitPrice * UnitsInStock AS InventoryValue
FROM Products
ORDER BY UnitPrice * UnitsInStock DESC;
```

## Exercises

Practice these exercises to strengthen your understanding of the ORDER BY clause.

### Exercise 1
Write a query to retrieve the ProductName and UnitPrice from the Products table, sorted by price from lowest to highest.

### Exercise 2
Write a query to list all customers (FirstName, LastName, City, State) sorted alphabetically by last name.

### Exercise 3
Write a query to display all orders (OrderID, OrderDate, TotalAmount) sorted by date, with the most recent orders first.

### Exercise 4
Write a query to list products (ProductName, CategoryID, UnitPrice) sorted first by category (ascending) and then by price (descending) within each category.

### Exercise 5
Write a query to retrieve employees (FirstName, LastName, HireDate) sorted by their hire date, showing the longest-tenured employees first.

### Exercise 6
Write a query to display suppliers (CompanyName, City, State) sorted alphabetically by state, and then by city within each state.

### Exercise 7
Write a query to list vehicles (Make, Model, Year) sorted first by Make alphabetically, then by Year from newest to oldest.

### Exercise 8
Write a query to retrieve products (ProductName, UnitsInStock, ReorderLevel) sorted by the difference between current stock and reorder level, showing the most urgently needed restocks first.

### Exercise 9
Write a query to display orders (OrderID, CustomerID, OrderDate) placed in 2022, sorted by the customer ID and then by date.

### Exercise 10
Write a query to list the top-selling products (ProductName, UnitPrice) sorted by price from highest to lowest, then alphabetically by name for products with the same price.

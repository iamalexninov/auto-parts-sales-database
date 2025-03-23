# SQL Query Data: FROM Clause

## Clause Explanation

The `FROM` clause in SQL specifies the table or tables from which to retrieve data. It follows the SELECT statement and defines the source of the data for your query.

### Basic Syntax:
```sql
SELECT column1, column2, ...
FROM table_name;
```

### Key Points:
- The FROM clause indicates which table(s) to query
- You can query from a single table, multiple tables, or derived tables
- Table names are usually case-insensitive, but using the correct case improves readability
- You can use table aliases to give tables shorter names in your query
- The FROM clause is required for most SELECT statements (except for simple expressions)

## Clause Examples

### Example 1: Select from a single table
```sql
-- Retrieve data from the Products table
SELECT ProductName, UnitPrice
FROM Products;
```

### Example 2: Using a table alias
```sql
-- Use 'p' as an alias for the Products table
SELECT p.ProductName, p.UnitPrice
FROM Products AS p;
```

### Example 3: Selecting from multiple tables (will be covered more in JOIN lessons)
```sql
-- Retrieve data from both Orders and Customers tables
SELECT o.OrderID, c.FirstName, c.LastName
FROM Orders AS o, Customers AS c
WHERE o.CustomerID = c.CustomerID;
```

### Example 4: Selecting from a derived table (subquery)
```sql
-- Retrieve data from a derived table
SELECT temp.ProductName, temp.Price
FROM 
    (SELECT ProductName, UnitPrice AS Price 
     FROM Products 
     WHERE CategoryID = 1) AS temp;
```

### Example 5: Using schema name with table
```sql
-- Using the schema name with the table name
SELECT ProductName, UnitPrice
FROM dbo.Products;
```

## Exercises

Practice these exercises to strengthen your understanding of the FROM clause.

### Exercise 1
Write a query to retrieve all columns from the Suppliers table.

### Exercise 2
Write a query to retrieve the ProductName and UnitPrice from the Products table.

### Exercise 3
Write a query to retrieve the FirstName and LastName columns from the Employees table using 'e' as a table alias.

### Exercise 4
Write a query to retrieve the OrderID, OrderDate, and Status columns from the Orders table using an alias of 'o'.

### Exercise 5
Write a query to retrieve data from the Vehicles table, showing only the Make, Model, and Year columns.

### Exercise 6
Write a query to retrieve data from the Categories table, showing the CategoryName and Description columns.

### Exercise 7
Write a query to retrieve data from the OrderDetails table, showing the OrderID, ProductID, and Quantity columns.

### Exercise 8
Write a query to retrieve data from the Customers table using the alias 'cust', showing the CustomerID, FirstName, and LastName columns with the alias prefix.

### Exercise 9
Write a query to retrieve data from the Inventory table, showing all columns with and without using table aliases.

### Exercise 10
Write a query to retrieve data from the Payments table using the alias 'pay', showing the PaymentID, OrderID, and Amount columns with the alias prefix.

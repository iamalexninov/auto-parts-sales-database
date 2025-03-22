# SQL Query Data: SELECT Clause

## Clause Explanation

The `SELECT` statement is the most fundamental SQL command used to retrieve data from a database. It specifies which columns you want to see in your query results.

### Basic Syntax:
```sql
SELECT column1, column2, ...
FROM table_name;
```

### Key Points:
- Use `SELECT *` to retrieve all columns from a table (not recommended for production code)
- You can select specific columns by listing them after the SELECT keyword
- You can rename columns in the output using column aliases with the AS keyword
- You can perform calculations or use functions in the SELECT clause
- Column names are usually case-insensitive, but using the correct case improves readability

## Clause Examples

### Example 1: Select all columns from a table
```sql
-- Retrieve all columns from the Products table
SELECT *
FROM Products;
```

### Example 2: Select specific columns
```sql
-- Retrieve only product name and price
SELECT ProductName, UnitPrice
FROM Products;
```

### Example 3: Using column aliases
```sql
-- Rename columns in the result set
SELECT ProductName AS 'Product', 
       UnitPrice AS 'Retail Price'
FROM Products;
```

### Example 4: Performing calculations
```sql
-- Calculate the total value of inventory
SELECT ProductName, 
       UnitPrice, 
       UnitsInStock, 
       UnitPrice * UnitsInStock AS 'Inventory Value'
FROM Products;
```

### Example 5: Using built-in functions
```sql
-- Get product names in uppercase
SELECT ProductID,
       UPPER(ProductName) AS 'Product Name in Capitals',
       UnitPrice
FROM Products;
```

## Exercises

Practice these exercises to strengthen your understanding of the SELECT clause.

### Exercise 1
Write a query to display all columns from the Customers table.

### Exercise 2
Write a query to display only the FirstName, LastName, and Email columns from the Customers table.

### Exercise 3
Write a query to display the ProductName, UnitPrice, and UnitsInStock columns from the Products table.

### Exercise 4
Write a query to display the OrderID, OrderDate, and CustomerID columns from the Orders table.

### Exercise 5
Write a query to display the EmployeeID, FirstName, and LastName columns from the Employees table with more readable column names: 'ID', 'First Name', and 'Last Name'.

### Exercise 6
Write a query to display the ProductName and the total value of each product in inventory (UnitPrice * UnitsInStock) from the Products table. Name the calculated column 'Total Value'.

### Exercise 7
Write a query to display the FirstName and LastName columns from the Customers table combined into a single column called 'Full Name'.

### Exercise 8
Write a query to display the OrderID, OrderDate, and a new column showing the year of the order called 'Order Year' from the Orders table.

### Exercise 9
Write a query to display the ProductName and price with a 10% discount from the Products table. Label the discounted price as 'Sale Price'.

### Exercise 10
Write a query to display the VehicleID, Make, Model, and Year columns from the Vehicles table, along with a new column called 'Vehicle Description' that combines these values (e.g., "2019 Honda Civic").

# Auto Parts Sales Database Documentation

## Database Overview

The AutoPartsSales database is a comprehensive system designed for managing an auto parts retail business. It tracks inventory, customer information, orders, returns, payments, and more. This documentation provides details about each table in the database and how they are interconnected.

## Database Schema Diagram

```
[Suppliers] ←───────┐
     ↓              │
[Products] ←─┐      │
     ↓      │       │
[Inventory]  │       │
             │       │
[Categories] ┘       │
                     │
[Customers] ──→ [Vehicles]
     ↓              ↓
[Orders] ←───── [Employees]
     ↓              
[OrderDetails] → [Returns] → [ReturnDetails]
     ↓
[Payments]
     ↓
[Shipping]
     
[Promotions]
```

## Table Descriptions and Relationships

### Suppliers

**Purpose**: Stores information about the companies that supply auto parts to the business.

**Primary Key**: SupplierID

**Key Fields**:
- SupplierID: Unique identifier for each supplier
- CompanyName: Name of the supplier company
- ContactName: Name of the primary contact person
- CreditRating: Rating from 1-5 indicating the supplier's credit reliability

**Relationships**:
- One-to-Many with Products (One supplier can provide many products)

### Categories

**Purpose**: Classifies products into different categories for easier organization and searching.

**Primary Key**: CategoryID

**Key Fields**:
- CategoryID: Unique identifier for each category
- CategoryName: Name of the category (e.g., "Engine Parts", "Brake System")
- Description: Detailed description of the category

**Relationships**:
- One-to-Many with Products (One category can contain many products)
- One-to-Many with Promotions (Promotions can apply to specific categories)

### Products

**Purpose**: Contains details about all auto parts available in the inventory.

**Primary Key**: ProductID

**Key Fields**:
- ProductID: Unique identifier for each product
- ProductName: Name of the product
- CategoryID: Foreign key linking to Categories table
- SupplierID: Foreign key linking to Suppliers table
- UnitPrice: Price per unit
- UnitsInStock: Current inventory count
- YearCompatibilityStart/End: Years the part is compatible with

**Relationships**:
- Many-to-One with Categories (Many products belong to one category)
- Many-to-One with Suppliers (Many products are supplied by one supplier)
- One-to-Many with OrderDetails (One product can appear in many order details)
- One-to-Many with Inventory (One product can have many inventory movements)
- One-to-Many with ReturnDetails (One product can be in many return details)
- One-to-Many with Promotions (Promotions can apply to specific products)

### Customers

**Purpose**: Stores information about customers who purchase auto parts.

**Primary Key**: CustomerID

**Key Fields**:
- CustomerID: Unique identifier for each customer
- FirstName/LastName: Customer's name
- Email: Customer's email address (unique)
- TotalPurchases: Total amount spent by the customer
- LoyaltyPoints: Points earned through purchases
- IsWholesale: Flag indicating if the customer is a wholesale buyer

**Relationships**:
- One-to-Many with Vehicles (One customer can have many vehicles)
- One-to-Many with Orders (One customer can place many orders)
- One-to-Many with Returns (One customer can make many returns)

### Vehicles

**Purpose**: Records information about customer vehicles for part compatibility.

**Primary Key**: VehicleID

**Key Fields**:
- VehicleID: Unique identifier for each vehicle
- CustomerID: Foreign key linking to Customers table
- Make/Model/Year: Vehicle identification details
- VIN: Vehicle Identification Number
- EngineType/Transmission: Technical details for part matching

**Relationships**:
- Many-to-One with Customers (Many vehicles belong to one customer)
- One-to-Many with Orders (Vehicle information can be linked to orders)

### Employees

**Purpose**: Contains information about staff members who process orders and handle customer service.

**Primary Key**: EmployeeID

**Key Fields**:
- EmployeeID: Unique identifier for each employee
- FirstName/LastName: Employee's name
- Title: Job title
- HireDate: When the employee was hired
- ReportsTo: Foreign key to the same table (self-reference) for manager relationship
- Salary: Base salary
- Commission: Commission percentage for sales staff

**Relationships**:
- One-to-Many with Orders (One employee can handle many orders)
- One-to-Many with Returns (One employee can process many returns)
- Self-referencing relationship for organizational hierarchy (manager/subordinate)

### Orders

**Purpose**: Tracks customer purchases.

**Primary Key**: OrderID

**Key Fields**:
- OrderID: Unique identifier for each order
- CustomerID: Foreign key linking to Customers table
- EmployeeID: Foreign key linking to Employees table
- VehicleID: Foreign key linking to Vehicles table (optional)
- OrderDate: When the order was placed
- ShippedDate: When the order was shipped
- Status: Current status of the order
- TotalAmount: Total cost of the order

**Relationships**:
- Many-to-One with Customers (Many orders are placed by one customer)
- Many-to-One with Employees (Many orders are processed by one employee)
- Many-to-One with Vehicles (Many orders may be for parts for one vehicle)
- One-to-Many with OrderDetails (One order contains many order details)
- One-to-Many with Returns (One order can have many returns)
- One-to-Many with Payments (One order can have many payments)
- One-to-Many with Shipping (One order can have many shipping records)

### OrderDetails

**Purpose**: Contains the specific items included in each order.

**Primary Key**: OrderDetailID

**Key Fields**:
- OrderDetailID: Unique identifier for each order detail
- OrderID: Foreign key linking to Orders table
- ProductID: Foreign key linking to Products table
- UnitPrice: Price of the product at time of order
- Quantity: Number of units ordered
- Discount: Discount applied to this line item
- LineTotal: Calculated total for the line (UnitPrice * Quantity * (1-Discount))

**Relationships**:
- Many-to-One with Orders (Many order details belong to one order)
- Many-to-One with Products (Many order details reference one product)

### Inventory

**Purpose**: Tracks all inventory movements (additions, subtractions) for stock management.

**Primary Key**: InventoryID

**Key Fields**:
- InventoryID: Unique identifier for each inventory movement
- ProductID: Foreign key linking to Products table
- ChangeDate: When the inventory change occurred
- ChangeType: Type of inventory movement ('Purchase', 'Sale', 'Return', 'Adjustment')
- Quantity: Amount of change (positive for additions, negative for removals)
- SourceDocument: Reference to the originating document (order, return, etc.)

**Relationships**:
- Many-to-One with Products (Many inventory movements affect one product)

### Returns

**Purpose**: Tracks customer returns of purchased items.

**Primary Key**: ReturnID

**Key Fields**:
- ReturnID: Unique identifier for each return
- OrderID: Foreign key linking to Orders table
- CustomerID: Foreign key linking to Customers table
- ReturnDate: When the return was made
- Reason: Reason for the return
- RefundAmount: Amount refunded to customer
- ProcessedBy: Foreign key linking to Employees table

**Relationships**:
- Many-to-One with Orders (Many returns are for one order)
- Many-to-One with Customers (Many returns are made by one customer)
- Many-to-One with Employees (Many returns are processed by one employee)
- One-to-Many with ReturnDetails (One return contains many return details)

### ReturnDetails

**Purpose**: Contains specific items included in each return.

**Primary Key**: ReturnDetailID

**Key Fields**:
- ReturnDetailID: Unique identifier for each return detail
- ReturnID: Foreign key linking to Returns table
- ProductID: Foreign key linking to Products table
- Quantity: Number of units returned
- Reason: Specific reason for returning this item
- RefundAmount: Amount refunded for this specific item

**Relationships**:
- Many-to-One with Returns (Many return details belong to one return)
- Many-to-One with Products (Many return details reference one product)

### Promotions

**Purpose**: Tracks special offers and discounts on products or categories.

**Primary Key**: PromotionID

**Key Fields**:
- PromotionID: Unique identifier for each promotion
- PromotionName: Name of the promotion
- DiscountType: Type of discount ('Percentage', 'FixedAmount')
- DiscountValue: Value of the discount
- CategoryID: Foreign key linking to Categories table (optional)
- ProductID: Foreign key linking to Products table (optional)
- StartDate/EndDate: Duration of the promotion
- IsActive: Flag indicating if the promotion is currently active

**Relationships**:
- Many-to-One with Categories (Many promotions can apply to one category)
- Many-to-One with Products (Many promotions can apply to one product)

### Payments

**Purpose**: Tracks all payments received for orders.

**Primary Key**: PaymentID

**Key Fields**:
- PaymentID: Unique identifier for each payment
- OrderID: Foreign key linking to Orders table
- PaymentDate: When the payment was made
- PaymentMethod: Method used for payment
- Amount: Amount paid
- TransactionID: External payment system reference ID
- Status: Current status of the payment

**Relationships**:
- Many-to-One with Orders (Many payments can be made for one order)

### Shipping

**Purpose**: Tracks shipping information for orders.

**Primary Key**: ShippingID

**Key Fields**:
- ShippingID: Unique identifier for each shipping record
- OrderID: Foreign key linking to Orders table
- ShipDate: When the order was shipped
- Carrier: Shipping company used
- TrackingNumber: Tracking ID for the shipment
- EstimatedDelivery: Estimated delivery date
- ActualDelivery: Actual delivery date
- Status: Current status of the shipment

**Relationships**:
- Many-to-One with Orders (Many shipping records can exist for one order)

## Database Indexes

The database includes several indexes to optimize query performance:

1. Products:
   - IDX_Products_Category: Improves queries that filter or join by category

2. Vehicles:
   - IDX_Vehicles_Customer: Improves lookups of vehicles by customer

3. Orders:
   - IDX_Orders_Customer: Optimizes retrieval of a customer's orders
   - IDX_Orders_Date: Improves date-based queries and reports

4. OrderDetails:
   - IDX_OrderDetails_Order: Speeds up retrieval of details for a specific order
   - IDX_OrderDetails_Product: Optimizes queries about which orders contain a specific product

5. Inventory:
   - IDX_Inventory_Product: Improves product inventory history lookup
   - IDX_Inventory_Date: Optimizes date-based inventory reports

6. Returns:
   - IDX_Returns_Order: Speeds up finding returns associated with an order

7. Payments:
   - IDX_Payments_Order: Optimizes lookup of payments for a specific order

8. Shipping:
   - IDX_Shipping_Order: Improves retrieval of shipping information for an order

## Key Business Rules and Constraints

1. Product prices must be non-negative (CHECK constraint on UnitPrice)
2. Inventory levels cannot be negative (CHECK constraint on UnitsInStock)
3. Unique customer email addresses (UNIQUE constraint on Email column)
4. Promotions must have valid date ranges (CHECK constraint ensuring EndDate > StartDate)
5. Order quantities must be greater than zero (CHECK constraint on Quantity)
6. Supplier credit ratings must be between 1 and 5 (CHECK constraint on CreditRating)

## Computed Columns

- OrderDetails.LineTotal: Automatically calculates the total price for each line item based on the formula: UnitPrice * Quantity * (1 - Discount)

## Data Integrity Features

1. Foreign key constraints ensure referential integrity between related tables
2. Default values provide sensible defaults (e.g., order status defaults to 'Pending')
3. NOT NULL constraints ensure required data is always provided
4. CHECK constraints enforce business rules and data validation

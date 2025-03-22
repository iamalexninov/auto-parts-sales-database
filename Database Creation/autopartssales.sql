-- Create the AutoPartsSales database
CREATE DATABASE AutoPartsSales;
GO

USE AutoPartsSales;
GO

-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    CompanyName NVARCHAR(100) NOT NULL,
    ContactName NVARCHAR(100),
    ContactTitle NVARCHAR(50),
    Address NVARCHAR(255),
    City NVARCHAR(50),
    State NVARCHAR(20),
    ZipCode NVARCHAR(10),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    DateJoined DATE DEFAULT GETDATE(),
    CreditRating INT CHECK (CreditRating BETWEEN 1 AND 5)
);

-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255)
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
    SupplierID INT FOREIGN KEY REFERENCES Suppliers(SupplierID),
    UnitPrice DECIMAL(10, 2) NOT NULL CHECK (UnitPrice >= 0),
    UnitsInStock INT NOT NULL DEFAULT 0 CHECK (UnitsInStock >= 0),
    ReorderLevel INT DEFAULT 10,
    Discontinued BIT DEFAULT 0,
    ManufacturerPartNumber NVARCHAR(50),
    YearCompatibilityStart INT,
    YearCompatibilityEnd INT,
    LastUpdated DATETIME DEFAULT GETDATE(),
    INDEX IDX_Products_Category (CategoryID)
);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(20),
    Address NVARCHAR(255),
    City NVARCHAR(50),
    State NVARCHAR(20),
    ZipCode NVARCHAR(10),
    DateRegistered DATE DEFAULT GETDATE(),
    TotalPurchases DECIMAL(12, 2) DEFAULT 0,
    LoyaltyPoints INT DEFAULT 0,
    IsWholesale BIT DEFAULT 0
);

-- Create Vehicles table
CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    Make NVARCHAR(50) NOT NULL,
    Model NVARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    VIN NVARCHAR(17),
    Color NVARCHAR(30),
    EngineType NVARCHAR(50),
    Transmission NVARCHAR(20),
    DateAdded DATE DEFAULT GETDATE(),
    INDEX IDX_Vehicles_Customer (CustomerID)
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Title NVARCHAR(50),
    HireDate DATE NOT NULL,
    BirthDate DATE,
    Address NVARCHAR(255),
    City NVARCHAR(50),
    State NVARCHAR(20),
    ZipCode NVARCHAR(10),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    ReportsTo INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    Salary DECIMAL(10, 2),
    Commission DECIMAL(5, 2)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    VehicleID INT FOREIGN KEY REFERENCES Vehicles(VehicleID),
    OrderDate DATETIME DEFAULT GETDATE(),
    RequiredDate DATETIME,
    ShippedDate DATETIME,
    ShipVia NVARCHAR(50),
    Freight DECIMAL(10, 2) DEFAULT 0,
    ShipAddress NVARCHAR(255),
    ShipCity NVARCHAR(50),
    ShipState NVARCHAR(20),
    ShipZipCode NVARCHAR(10),
    Status NVARCHAR(20) DEFAULT 'Pending',
    PaymentMethod NVARCHAR(30),
    TotalAmount DECIMAL(12, 2),
    INDEX IDX_Orders_Customer (CustomerID),
    INDEX IDX_Orders_Date (OrderDate)
);

-- Create Order Details table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL DEFAULT 1 CHECK (Quantity > 0),
    Discount DECIMAL(5, 2) DEFAULT 0,
    LineTotal AS (UnitPrice * Quantity * (1 - Discount)) PERSISTED,
    WarrantyMonths INT DEFAULT 0,
    INDEX IDX_OrderDetails_Order (OrderID),
    INDEX IDX_OrderDetails_Product (ProductID)
);

-- Create Inventory table (for inventory movements)
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    ChangeDate DATETIME DEFAULT GETDATE(),
    ChangeType NVARCHAR(20) NOT NULL, -- 'Purchase', 'Sale', 'Return', 'Adjustment'
    Quantity INT NOT NULL,
    BatchNumber NVARCHAR(50),
    SourceDocument NVARCHAR(50),
    SourceID INT,
    Notes NVARCHAR(255),
    INDEX IDX_Inventory_Product (ProductID),
    INDEX IDX_Inventory_Date (ChangeDate)
);

-- Create Returns table
CREATE TABLE Returns (
    ReturnID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ReturnDate DATETIME DEFAULT GETDATE(),
    Reason NVARCHAR(255),
    Status NVARCHAR(20) DEFAULT 'Pending',
    RefundAmount DECIMAL(10, 2),
    ProcessedBy INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    INDEX IDX_Returns_Order (OrderID)
);

-- Create Return Details table
CREATE TABLE ReturnDetails (
    ReturnDetailID INT PRIMARY KEY IDENTITY(1,1),
    ReturnID INT FOREIGN KEY REFERENCES Returns(ReturnID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT NOT NULL,
    Reason NVARCHAR(255),
    Condition NVARCHAR(50),
    RefundAmount DECIMAL(10, 2)
);

-- Create Promotions table
CREATE TABLE Promotions (
    PromotionID INT PRIMARY KEY IDENTITY(1,1),
    PromotionName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    DiscountType NVARCHAR(20) NOT NULL, -- 'Percentage', 'FixedAmount'
    DiscountValue DECIMAL(10, 2) NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    MinimumOrderAmount DECIMAL(10, 2),
    MaximumDiscount DECIMAL(10, 2),
    IsActive BIT DEFAULT 1,
    CHECK (EndDate > StartDate)
);

-- Create Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    PaymentDate DATETIME DEFAULT GETDATE(),
    PaymentMethod NVARCHAR(30) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    TransactionID NVARCHAR(100),
    Status NVARCHAR(20) DEFAULT 'Completed',
    Notes NVARCHAR(255),
    INDEX IDX_Payments_Order (OrderID)
);

-- Create Shipping table
CREATE TABLE Shipping (
    ShippingID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ShipDate DATETIME,
    Carrier NVARCHAR(50),
    TrackingNumber NVARCHAR(100),
    ShippingCost DECIMAL(10, 2),
    EstimatedDelivery DATETIME,
    ActualDelivery DATETIME,
    Status NVARCHAR(20) DEFAULT 'Pending',
    INDEX IDX_Shipping_Order (OrderID)
);

-- Insert sample data into Suppliers
INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, Address, City, State, ZipCode, Phone, Email, DateJoined, CreditRating)
VALUES 
    ('AutoTech Parts', 'Robert Johnson', 'Sales Manager', '123 Main St', 'Detroit', 'MI', '48201', '313-555-1234', 'sales@autotechparts.com', '2020-01-15', 5),
    ('Premium Components Inc', 'Sarah Williams', 'Account Executive', '456 Oak Avenue', 'Chicago', 'IL', '60607', '312-555-5678', 'swilliams@premiumcomp.com', '2020-03-22', 4),
    ('Global Auto Supply', 'Michael Chen', 'CEO', '789 Industrial Blvd', 'Cleveland', 'OH', '44113', '216-555-9012', 'mchen@globalauto.com', '2020-05-10', 5),
    ('Precision Parts Ltd', 'Jennifer Davis', 'Purchasing Director', '321 Tech Drive', 'Pittsburgh', 'PA', '15222', '412-555-3456', 'jdavis@precisionparts.com', '2020-08-05', 3),
    ('Elite Manufacturers', 'Thomas Wilson', 'Sales Representative', '654 Market Street', 'Indianapolis', 'IN', '46204', '317-555-7890', 'twilson@elitemanuf.com', '2021-01-20', 4),
    ('Reliable Auto Parts', 'Amanda Brown', 'Owner', '987 Liberty Road', 'Columbus', 'OH', '43215', '614-555-2345', 'abrown@reliableauto.com', '2021-04-12', 3),
    ('Performance Products', 'Daniel Martinez', 'VP Sales', '159 Speed Way', 'Nashville', 'TN', '37203', '615-555-6789', 'dmartinez@perfproducts.com', '2021-07-30', 5),
    ('Quality Components Co', 'Lisa Thompson', 'Regional Manager', '753 Quality Lane', 'Cincinnati', 'OH', '45202', '513-555-0123', 'lthompson@qualitycomp.com', '2021-10-05', 4),
    ('FastTrack Suppliers', 'Kevin Garcia', 'Account Manager', '852 Raceway Drive', 'Louisville', 'KY', '40202', '502-555-4567', 'kgarcia@fasttrack.com', '2022-02-15', 3),
    ('AutoParts Wholesale', 'Emily Rodriguez', 'Sales Director', '426 Warehouse Ave', 'St. Louis', 'MO', '63103', '314-555-8901', 'erodriguez@autopartswholesale.com', '2022-05-20', 4);

-- Insert sample data into Categories
INSERT INTO Categories (CategoryName, Description)
VALUES 
    ('Engine Parts', 'Components related to the engine and its functioning'),
    ('Brake System', 'Parts for vehicle braking systems including pads, rotors, and calipers'),
    ('Transmission', 'Manual and automatic transmission components'),
    ('Electrical', 'Electrical components including batteries, alternators, and wiring'),
    ('Suspension', 'Shock absorbers, struts, and other suspension components'),
    ('Exhaust', 'Mufflers, catalytic converters, and other exhaust system parts'),
    ('Cooling System', 'Radiators, coolant, and other cooling system components'),
    ('Filters', 'Air, oil, fuel, and cabin filters'),
    ('Lubricants', 'Engine oils, transmission fluids, and other lubricants'),
    ('Accessories', 'Interior and exterior accessories');

-- Insert sample data into Products
INSERT INTO Products (ProductName, CategoryID, SupplierID, UnitPrice, UnitsInStock, ReorderLevel, Discontinued, ManufacturerPartNumber, YearCompatibilityStart, YearCompatibilityEnd)
VALUES 
    ('Premium Oil Filter', 8, 1, 12.99, 150, 30, 0, 'OF-101', 2010, 2023),
    ('Performance Brake Pads', 2, 3, 89.95, 85, 20, 0, 'BP-202', 2015, 2025),
    ('Standard Spark Plug Set', 1, 2, 45.50, 200, 40, 0, 'SP-303', 2012, 2022),
    ('Heavy Duty Alternator', 4, 5, 189.99, 30, 10, 0, 'ALT-404', 2014, 2024),
    ('Sport Suspension Kit', 5, 7, 349.99, 15, 5, 0, 'SSK-505', 2018, 2025),
    ('Stainless Steel Exhaust', 6, 4, 275.00, 25, 8, 0, 'EXH-606', 2016, 2025),
    ('All-Weather Wiper Blades', 10, 6, 29.99, 120, 25, 0, 'WB-707', 2010, 2025),
    ('High-Flow Air Filter', 8, 1, 34.95, 95, 20, 0, 'AF-808', 2015, 2025),
    ('Synthetic Motor Oil 5W-30', 9, 10, 49.99, 200, 50, 0, 'OIL-909', 2010, 2025),
    ('Ceramic Brake Rotors', 2, 3, 129.95, 40, 10, 0, 'BR-1010', 2017, 2025),
    ('Fuel Pump Assembly', 1, 2, 159.99, 35, 10, 0, 'FP-1111', 2013, 2023),
    ('Transmission Fluid Kit', 3, 8, 89.95, 60, 15, 0, 'TF-1212', 2012, 2025),
    ('Battery with 3-Year Warranty', 4, 5, 149.99, 50, 15, 0, 'BAT-1313', 2015, 2025),
    ('Complete Gasket Set', 1, 9, 179.99, 25, 8, 0, 'GS-1414', 2014, 2022),
    ('Power Steering Pump', 5, 7, 129.95, 30, 8, 0, 'PSP-1515', 2015, 2024),
    ('Oxygen Sensor', 4, 4, 89.99, 70, 15, 0, 'OS-1616', 2013, 2024),
    ('Radiator with Cap', 7, 6, 189.95, 25, 8, 0, 'RAD-1717', 2014, 2023),
    ('Timing Belt Kit', 1, 1, 159.95, 40, 10, 0, 'TBK-1818', 2012, 2022),
    ('Premium Cabin Filter', 8, 10, 24.99, 100, 25, 0, 'CF-1919', 2015, 2025),
    ('Headlight Assembly', 4, 3, 249.99, 20, 5, 0, 'HA-2020', 2016, 2025),
    ('Performance Camshaft', 1, 2, 299.95, 15, 5, 0, 'CAM-2121', 2018, 2025),
    ('Catalytic Converter', 6, 5, 349.99, 20, 5, 0, 'CC-2222', 2015, 2023),
    ('Shock Absorber Set', 5, 7, 199.95, 30, 8, 0, 'SA-2323', 2017, 2025),
    ('CV Axle Assembly', 3, 4, 189.95, 25, 8, 0, 'CVA-2424', 2016, 2024),
    ('Ignition Coil Pack', 4, 6, 129.99, 45, 10, 0, 'IC-2525', 2014, 2023),
    ('Coolant Reservoir', 7, 1, 49.99, 60, 15, 0, 'CR-2626', 2012, 2025),
    ('Differential Fluid', 9, 10, 39.95, 80, 20, 0, 'DF-2727', 2010, 2025),
    ('Wheel Bearing Kit', 5, 3, 89.95, 50, 10, 0, 'WB-2828', 2015, 2025),
    ('Water Pump', 7, 2, 129.95, 35, 10, 0, 'WP-2929', 2013, 2023),
    ('Performance Air Intake', 1, 7, 249.99, 20, 5, 0, 'PAI-3030', 2018, 2025);

-- Insert sample data into Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, State, ZipCode, DateRegistered, TotalPurchases, LoyaltyPoints, IsWholesale)
VALUES 
    ('John', 'Smith', 'john.smith@email.com', '614-555-1234', '123 Maple Street', 'Columbus', 'OH', '43220', '2021-03-10', 1250.45, 125, 0),
    ('Mary', 'Johnson', 'mary.johnson@email.com', '216-555-5678', '456 Oak Avenue', 'Cleveland', 'OH', '44106', '2021-04-22', 2345.78, 234, 0),
    ('David', 'Williams', 'david.williams@email.com', '513-555-9012', '789 Pine Road', 'Cincinnati', 'OH', '45202', '2021-05-15', 3560.25, 356, 0),
    ('Linda', 'Brown', 'linda.brown@email.com', '937-555-3456', '321 Cedar Lane', 'Dayton', 'OH', '45402', '2021-06-20', 890.50, 89, 0),
    ('Robert', 'Jones', 'robert.jones@email.com', '330-555-7890', '654 Birch Boulevard', 'Akron', 'OH', '44308', '2021-07-05', 1675.30, 167, 0),
    ('Patricia', 'Miller', 'patricia.miller@email.com', '419-555-2345', '987 Spruce Street', 'Toledo', 'OH', '43604', '2021-08-12', 2780.15, 278, 0),
    ('Michael', 'Davis', 'michael.davis@email.com', '614-555-6789', '159 Elm Court', 'Columbus', 'OH', '43215', '2021-09-08', 4250.75, 425, 1),
    ('Elizabeth', 'Garcia', 'elizabeth.garcia@email.com', '440-555-0123', '753 Walnut Drive', 'Mentor', 'OH', '44060', '2021-10-18', 1890.45, 189, 0),
    ('William', 'Rodriguez', 'william.rodriguez@email.com', '216-555-4567', '852 Ash Street', 'Cleveland', 'OH', '44115', '2021-11-25', 3120.95, 312, 0),
    ('Jennifer', 'Martinez', 'jennifer.martinez@email.com', '513-555-8901', '426 Hickory Lane', 'Cincinnati', 'OH', '45203', '2021-12-30', 2670.80, 267, 0),
    ('James', 'Hernandez', 'james.hernandez@email.com', '937-555-2345', '973 Sycamore Avenue', 'Dayton', 'OH', '45403', '2022-01-15', 1450.25, 145, 0),
    ('Susan', 'Lopez', 'susan.lopez@email.com', '330-555-6789', '153 Redwood Road', 'Akron', 'OH', '44307', '2022-02-22', 2950.65, 295, 0),
    ('Charles', 'Gonzalez', 'charles.gonzalez@email.com', '419-555-0123', '741 Poplar Street', 'Toledo', 'OH', '43605', '2022-03-10', 3780.30, 378, 1),
    ('Margaret', 'Wilson', 'margaret.wilson@email.com', '614-555-4567', '369 Dogwood Path', 'Columbus', 'OH', '43220', '2022-04-18', 1290.75, 129, 0),
    ('Joseph', 'Anderson', 'joseph.anderson@email.com', '440-555-8901', '258 Juniper Way', 'Lorain', 'OH', '44052', '2022-05-25', 2560.40, 256, 0),
    ('Dorothy', 'Thomas', 'dorothy.thomas@email.com', '216-555-2345', '147 Beech Court', 'Cleveland', 'OH', '44114', '2022-06-12', 3450.95, 345, 0),
    ('Richard', 'Taylor', 'richard.taylor@email.com', '513-555-6789', '963 Magnolia Boulevard', 'Cincinnati', 'OH', '45202', '2022-07-20', 1870.55, 187, 0),
    ('Carol', 'Moore', 'carol.moore@email.com', '937-555-0123', '852 Willow Street', 'Dayton', 'OH', '45402', '2022-08-15', 2760.85, 276, 0),
    ('Daniel', 'Jackson', 'daniel.jackson@email.com', '330-555-4567', '741 Cypress Avenue', 'Akron', 'OH', '44308', '2022-09-22', 4120.30, 412, 1),
    ('Ruth', 'Martin', 'ruth.martin@email.com', '419-555-8901', '369 Olive Lane', 'Toledo', 'OH', '43604', '2022-10-10', 1930.70, 193, 0);

-- Insert sample data into Vehicles
INSERT INTO Vehicles (CustomerID, Make, Model, Year, VIN, Color, EngineType, Transmission, DateAdded)
VALUES 
    (1, 'Honda', 'Civic', 2019, '1HGCM82633A123456', 'Blue', '1.5L Turbo', 'Automatic', '2021-03-10'),
    (2, 'Toyota', 'Camry', 2020, '4T1BF1FK5LU123456', 'Silver', '2.5L 4-cylinder', 'Automatic', '2021-04-22'),
    (3, 'Ford', 'F-150', 2018, '1FTEW1EP7JFA12345', 'Black', '3.5L EcoBoost', 'Automatic', '2021-05-15'),
    (4, 'Chevrolet', 'Malibu', 2021, '1G1ZD5ST4MF123456', 'White', '1.5L Turbo', 'Automatic', '2021-06-20'),
    (5, 'Nissan', 'Altima', 2019, '1N4BL4BV0LC123456', 'Red', '2.5L 4-cylinder', 'CVT', '2021-07-05'),
    (6, 'Hyundai', 'Sonata', 2020, '5NPE24AF3LH123456', 'Gray', '2.4L 4-cylinder', 'Automatic', '2021-08-12'),
    (7, 'Jeep', 'Grand Cherokee', 2018, '1C4RJFAG4JC123456', 'Green', '3.6L V6', 'Automatic', '2021-09-08'),
    (8, 'Subaru', 'Outback', 2021, '4S4BTANC3M3123456', 'Blue', '2.5L 4-cylinder', 'CVT', '2021-10-18'),
    (9, 'Kia', 'Sorento', 2020, '5XYPG4A57LG123456', 'Black', '2.4L 4-cylinder', 'Automatic', '2021-11-25'),
    (10, 'Mazda', 'CX-5', 2019, 'JM3KFBDM7K0123456', 'White', '2.5L 4-cylinder', 'Automatic', '2021-12-30'),
    (1, 'Honda', 'Accord', 2016, '1HGCR2F54GA123456', 'Gray', '2.4L 4-cylinder', 'CVT', '2022-01-15'),
    (12, 'Volkswagen', 'Jetta', 2020, '3VWC57BU4LM123456', 'Silver', '1.4L Turbo', 'Automatic', '2022-02-22'),
    (13, 'GMC', 'Sierra', 2018, '3GTU2NEC9JG123456', 'Black', '5.3L V8', 'Automatic', '2022-03-10'),
    (14, 'Audi', 'A4', 2019, 'WAUENAF46KA123456', 'Blue', '2.0L Turbo', 'Automatic', '2022-04-18'),
    (15, 'BMW', '3 Series', 2020, 'WBA5R7C57LFH12345', 'Black', '2.0L Turbo', 'Automatic', '2022-05-25'),
    (16, 'Lexus', 'RX', 2018, '2T2BZMCA6JC123456', 'White', '3.5L V6', 'Automatic', '2022-06-12'),
    (17, 'Mercedes-Benz', 'C-Class', 2019, '55SWF8EB0KU123456', 'Silver', '2.0L Turbo', 'Automatic', '2022-07-20'),
    (18, 'Dodge', 'Charger', 2020, '2C3CDXBG5LH123456', 'Red', '3.6L V6', 'Automatic', '2022-08-15'),
    (19, 'Chrysler', '300', 2018, '2C3CCAEG5JH123456', 'Black', '3.6L V6', 'Automatic', '2022-09-22'),
    (20, 'Buick', 'Encore', 2021, 'KL4CJASB9MB123456', 'White', '1.4L Turbo', 'Automatic', '2022-10-10'),
    (5, 'Toyota', 'RAV4', 2017, '2T3RFREV4HW123456', 'Silver', '2.5L 4-cylinder', 'Automatic', '2022-11-15'),
    (8, 'Honda', 'CR-V', 2018, '2HKRW6H36JH123456', 'Gray', '1.5L Turbo', 'CVT', '2022-12-20'),
    (11, 'Ford', 'Escape', 2019, '1FMCU9GD4KUA12345', 'Blue', '1.5L EcoBoost', 'Automatic', '2023-01-25'),
    (14, 'Chevrolet', 'Equinox', 2020, '2GNAXSEV4L6123456', 'Black', '1.5L Turbo', 'Automatic', '2023-02-28'),
    (17, 'Hyundai', 'Tucson', 2018, 'KM8J3CA46JU123456', 'Red', '2.0L 4-cylinder', 'Automatic', '2023-03-15');

-- Insert sample data into Employees
INSERT INTO Employees (FirstName, LastName, Title, HireDate, BirthDate, Address, City, State, ZipCode, Phone, Email, ReportsTo, Salary, Commission)
VALUES 
    ('James', 'Smith', 'General Manager', '2020-01-15', '1975-06-15', '123 Business Rd', 'Columbus', 'OH', '43215', '614-555-1234', 'jsmith@autopartssales.com', NULL, 80000.00, 0.00),
    ('Emily', 'Johnson', 'Sales Manager', '2020-02-20', '1980-04-23', '456 Commerce St', 'Columbus', 'OH', '43215', '614-555-5678', 'ejohnson@autopartssales.com', 1, 65000.00, 0.05),
    ('Michael', 'Williams', 'Inventory Manager', '2020-03-10', '1978-09-12', '789 Supply Ave', 'Columbus', 'OH', '43215', '614-555-9012', 'mwilliams@autopartssales.com', 1, 62000.00, 0.00),
    ('Sarah', 'Brown', 'Sales Associate', '2020-05-15', '1985-11-30', '321 Market Blvd', 'Columbus', 'OH', '43215', '614-555-3456', 'sbrown@autopartssales.com', 2, 45000.00, 0.03),
    ('Robert', 'Jones', 'Sales Associate', '2020-06-22', '1988-02-15', '654 Retail Ln', 'Columbus', 'OH', '43215', '614-555-7890', 'rjones@autopartssales.com', 2, 45000.00, 0.03)
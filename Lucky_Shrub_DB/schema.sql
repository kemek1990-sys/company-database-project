CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(200),
    City VARCHAR(50),
    Country VARCHAR(50),
    RegistrationDate DATE
);
 
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100)
);
 
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10,2),
    StockQuantity INT,
    SupplierID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
 
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
 
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
 
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    ContactEmail VARCHAR(100),
    Phone VARCHAR(20)
);
 
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    StockLevel INT,
    LastRestockDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
 
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
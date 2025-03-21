-- Customers Table: Stores customer information including name, email, phone, and address.
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address TEXT,
    RegisteredDate DATE
);

-- Shipments Table: Contains details of shipments such as tracking number, source, destination, delivery status, and customer reference.
CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY,
    TrackingNumber VARCHAR(20) UNIQUE NOT NULL,
    CustomerID INT,
    SourceLocation VARCHAR(100),
    DestinationLocation VARCHAR(100),
    Status VARCHAR(50),
    ShippedDate DATE,
    ExpectedDeliveryDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Packages Table: Stores package details like weight, size, and type, linked to a shipment.
CREATE TABLE Packages (
    PackageID INT PRIMARY KEY,
    ShipmentID INT,
    Weight DECIMAL(10,2),
    Dimensions VARCHAR(50),
    PackageType VARCHAR(50),
    Contents TEXT,
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID)
);

CREATE TABLE TrackingHistory (
    TrackingID INT PRIMARY KEY,
    ShipmentID INT,
    Status VARCHAR(50),
    Location VARCHAR(100),
    UpdatedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID)
);


CREATE DATABASE ParcelTrackDB;
USE ParcelTrackDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address TEXT,
    RegisteredDate DATE
);

INSERT INTO Customers VALUES 
(1, 'John Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street, NY', '2024-01-15'),
(2, 'Alice Smith', 'alice.smith@example.com', '987-654-3210', '456 Oak Street, CA', '2024-02-10'),
(3, 'Bob Johnson', 'bob.johnson@example.com', '555-123-6789', '789 Pine Avenue, TX', '2024-03-05'),
(4, 'Emma Davis', 'emma.davis@example.com', '444-555-6666', '101 Maple Road, FL', '2024-03-20'),
(5, 'Michael Brown', 'michael.brown@example.com', '333-222-1111', '202 Birch Lane, IL', '2024-04-01');

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

INSERT INTO Shipments VALUES
(1, 'UPS123456789', 1, 'New York, NY', 'Los Angeles, CA', 'In Transit', '2024-03-10', '2024-03-15'),
(2, 'UPS987654321', 2, 'Chicago, IL', 'Houston, TX', 'Delivered', '2024-03-08', '2024-03-13'),
(3, 'UPS555666777', 3, 'Seattle, WA', 'Denver, CO', 'Out for Delivery', '2024-03-12', '2024-03-17'),
(4, 'UPS888999000', 4, 'Miami, FL', 'Atlanta, GA', 'Pending Pickup', '2024-03-14', '2024-03-19'),
(5, 'UPS112233445', 5, 'San Francisco, CA', 'Boston, MA', 'Shipped', '2024-03-16', '2024-03-21');

CREATE TABLE Packages (
    PackageID INT PRIMARY KEY,
    ShipmentID INT,
    Weight DECIMAL(10,2),
    Dimensions VARCHAR(50),
    PackageType VARCHAR(50),
    Contents TEXT,
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID)
);

INSERT INTO Packages VALUES
(1, 1, 2.5, '12x8x4', 'Box', 'Books'),
(2, 2, 1.2, '10x6x3', 'Envelope', 'Documents'),
(3, 3, 5.0, '15x10x6', 'Box', 'Electronics'),
(4, 4, 3.8, '14x9x5', 'Box', 'Clothing'),
(5, 5, 7.2, '18x12x8', 'Box', 'Kitchenware');

CREATE TABLE TrackingHistory (
    TrackingID INT PRIMARY KEY,
    ShipmentID INT,
    Status VARCHAR(50),
    Location VARCHAR(100),
    UpdatedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID)
);

INSERT INTO TrackingHistory VALUES
(1, 1, 'Arrived at Facility', 'Chicago, IL', '2024-03-11 08:30:00'),
(2, 2, 'Delivered', 'Houston, TX', '2024-03-13 15:00:00'),
(3, 3, 'Out for Delivery', 'Denver, CO', '2024-03-17 10:45:00'),
(4, 4, 'Picked Up', 'Miami, FL', '2024-03-14 14:20:00'),
(5, 5, 'Shipped', 'San Francisco, CA', '2024-03-16 12:10:00');



-- #Find All Shipments for a Specific Customer
-- #Scenario: A customer wants to check all their shipments.

USE ParcelTrackDB;
SELECT s.ShipmentID, s.TrackingNumber, s.SourceLocation, s.DestinationLocation, 
       s.Status, s.ShippedDate, s.ExpectedDeliveryDate
FROM Shipments s
JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE c.Email = 'john.doe@example.com';



-- #Get the Latest Status of a Specific Shipment
-- #Scenario: A customer enters their Tracking Number to get the latest status update.

USE ParcelTrackDB;
SELECT th.TrackingID, th.Status, th.Location, th.UpdatedTime
FROM TrackingHistory th
JOIN Shipments s ON th.ShipmentID = s.ShipmentID
WHERE s.TrackingNumber = 'UPS123456789' -- Change the tracking number as needed
ORDER BY th.UpdatedTime DESC
LIMIT 1;



-- #Identify Customers with the Most Shipments
-- #Scenario: The company wants to find the top customers based on the number of shipments.


USE ParcelTrackDB;
-- Identify Customers with the Most Shipments
SELECT c.CustomerID, c.Name, COUNT(s.ShipmentID) AS TotalShipments
FROM Customers c
JOIN Shipments s ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalShipments DESC
LIMIT 5; -- Get the top 5 customers


-- #Average Number of Shipments per Customer
-- #Scenario: The business wants to calculate the average shipments per customer.

USE ParcelTrackDB;
-- Calculate the Average Number of Shipments per Customer
SELECT AVG(ShipmentCount) AS AvgShipmentsPerCustomer
FROM (
    SELECT CustomerID, COUNT(ShipmentID) AS ShipmentCount
    FROM Shipments
    GROUP BY CustomerID
) AS CustomerShipmentCounts;
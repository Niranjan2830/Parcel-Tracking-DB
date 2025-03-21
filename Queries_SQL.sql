-- Queries.sql: Common SQL Queries for Parcel-Tracking-DB
-- This file contains frequently used queries for managing shipments, payments, and logistics.

/* ====================================================== */
/*  Query 1: Retrieve All Customers and Their Details  */
/* ====================================================== */
SELECT * FROM Customers;

/* ====================================================== */
/*  Query 2: Fetch All Shipments with Current Status  */
/* ====================================================== */
SELECT TrackingNumber, Source, Destination, DeliveryStatus FROM Shipments;

/* ====================================================== */
/*  Query 3: List All Packages and Their Weights  */
/* ====================================================== */
SELECT PackageID, ShipmentID, Weight, Size, PackageType FROM Packages;

/* ====================================================== */
/*  Query 4: Get All Couriers and Their Assigned Shipments  */
/* ====================================================== */
SELECT C.CourierID, C.Name, COUNT(S.ShipmentID) AS AssignedShipments 
FROM Couriers C 
LEFT JOIN Shipments S ON C.CourierID = S.CourierID 
GROUP BY C.CourierID, C.Name;

/* ====================================================== */
/*  Query 5: Retrieve All Warehouses and Their Locations  */
/* ====================================================== */
SELECT * FROM Warehouse;

/* ====================================================== */
/*  Query 6: Fetch Tracking History for a Specific Package  */
/* ====================================================== */
SELECT * FROM Tracking_History WHERE PackageID = 1 ORDER BY Timestamp DESC;

/* ====================================================== */
/*  Query 7: Get Total Payments Made by Each Customer  */
/* ====================================================== */
SELECT C.Name, SUM(P.Amount) AS TotalPaid 
FROM Payments P 
JOIN Customers C ON P.CustomerID = C.CustomerID 
GROUP BY C.Name;

/* ====================================================== */
/*  Query 8: Retrieve Shipments Delivered in the Last 7 Days  */
/* ====================================================== */
SELECT * FROM Shipments WHERE DeliveryStatus = 'Delivered' AND DeliveryDate >= NOW() - INTERVAL 7 DAY;

/* ====================================================== */
/*  Query 9: Find Customers Who Haven't Made Any Shipments Yet  */
/* ====================================================== */
SELECT * FROM Customers WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Shipments);

/* ====================================================== */
/*  Query 10: Identify Packages that Exceed a Certain Weight Limit  */
/* ====================================================== */
SELECT * FROM Packages WHERE Weight > 20; -- Adjust weight as needed


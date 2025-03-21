-- Queries.sql: Common SQL Queries for Parcel Tracking Database
-- Each query is separated by a clear section for better readability.

/* ====================================================== */
/*  Query 1: Get all shipments that are currently in transit */
/* ====================================================== */
SELECT * FROM Shipments WHERE DeliveryStatus = 'In Transit';

/* ====================================================== */
/*  Query 2: Retrieve the total number of shipments per customer */
/* ====================================================== */
SELECT C.Name, COUNT(S.ShipmentID) AS TotalShipments 
FROM Customers C 
JOIN Shipments S ON C.CustomerID = S.CustomerID 
GROUP BY C.Name;

/* ====================================================== */
/*  Query 3: Get all packages assigned to a specific shipment */
/* ====================================================== */
SELECT * FROM Packages WHERE ShipmentID = 1;

/* ====================================================== */
/*  Query 4: Find couriers handling more than 5 shipments */
/* ====================================================== */
SELECT C.CourierID, C.Name, COUNT(S.ShipmentID) AS AssignedShipments
FROM Couriers C
JOIN Shipments S ON C.CourierID = S.CourierID
GROUP BY C.CourierID, C.Name
HAVING COUNT(S.ShipmentID) > 5;

/* ====================================================== */
/*  Query 5: Check payment details for a specific customer */
/* ====================================================== */
SELECT P.*, C.Name 
FROM Payments P
JOIN Customers C ON P.CustomerID = C.CustomerID
WHERE C.Name = 'John Doe';

/* ====================================================== */
/*  Query 6: Get tracking history for a specific package */
/* ====================================================== */
SELECT * FROM Tracking_History WHERE PackageID = 1
ORDER BY Timestamp DESC;

/* ====================================================== */
/*  Query 7: Identify shipments stored in a specific warehouse location */
/* ====================================================== */
SELECT S.* FROM Shipments S
JOIN Warehouse W ON S.WarehouseID = W.WarehouseID
WHERE W.Location = 'New York';

/* ====================================================== */
/*  Query 8: Retrieve the latest shipment status for a specific tracking number */
/* ====================================================== */
SELECT TrackingNumber, DeliveryStatus 
FROM Shipments
WHERE TrackingNumber = 'TRK123456';

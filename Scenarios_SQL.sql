-- Scenarios.SQL: Real-World Business Use Cases & Solutions
-- This file provides SQL queries for practical logistics and parcel tracking scenarios.

/* ====================================================== */
/*  Scenario 1: Find All Shipments That Are Currently in Transit  */
/* ====================================================== */
/*  
   📌 Business Problem: 
   A logistics manager needs to track all shipments that are still in transit.
   ✅ Solution: Retrieve shipments where the DeliveryStatus is 'In Transit'.
*/
SELECT * FROM Shipments WHERE DeliveryStatus = 'In Transit';

/* ====================================================== */
/*  Scenario 2: Count the Total Number of Shipments per Customer  */
/* ====================================================== */
/*  
   📌 Business Problem:
   A business analyst wants to generate a report on the total shipments made by each customer.
   ✅ Solution: Use COUNT() to calculate shipments per customer.
*/
SELECT C.Name, COUNT(S.ShipmentID) AS TotalShipments 
FROM Customers C 
JOIN Shipments S ON C.CustomerID = S.CustomerID 
GROUP BY C.Name;

/* ====================================================== */
/*  Scenario 3: Get All Packages Belonging to a Specific Shipment  */
/* ====================================================== */
/*  
   📌 Business Problem:
   A customer service representative wants to check the contents of a particular shipment.
   ✅ Solution: Retrieve all package details for a given ShipmentID.
*/
SELECT * FROM Packages WHERE ShipmentID = 1;

/* ====================================================== */
/*  Scenario 4: Find Couriers Handling More Than 5 Shipments  */
/* ====================================================== */
/*  
   📌 Business Problem:
   A logistics coordinator wants to monitor workload distribution among couriers.
   ✅ Solution: Identify couriers with more than 5 assigned shipments.
*/
SELECT C.CourierID, C.Name, COUNT(S.ShipmentID) AS AssignedShipments
FROM Couriers C
JOIN Shipments S ON C.CourierID = S.CourierID
GROUP BY C.CourierID, C.Name
HAVING COUNT(S.ShipmentID) > 5;

/* ====================================================== */
/*  Scenario 5: Retrieve Payment Details for a Specific Customer  */
/* ====================================================== */
/*  
   📌 Business Problem:
   The finance team needs to verify payment transactions for a particular customer.
   ✅ Solution: Fetch all payment records linked to the customer’s name.
*/
SELECT P.*, C.Name 
FROM Payments P
JOIN Customers C ON P.CustomerID = C.CustomerID
WHERE C.Name = 'John Doe';

/* ====================================================== */
/*  Scenario 6: Get the Complete Tracking History of a Package  */
/* ====================================================== */
/*  
   📌 Business Problem:
   A customer wants to track their parcel’s full journey from pickup to delivery.
   ✅ Solution: Fetch tracking history ordered by timestamp.
*/
SELECT * FROM Tracking_History WHERE PackageID = 1 ORDER BY Timestamp DESC;

/* ====================================================== */
/*  Scenario 7: Identify Shipments Stored in a Specific Warehouse  */
/* ====================================================== */
/*  
   📌 Business Problem:
   A warehouse manager needs to check which shipments are currently stored in a given location.
   ✅ Solution: Retrieve shipments linked to a specific warehouse location.
*/
SELECT S.* FROM Shipments S
JOIN Warehouse W ON S.WarehouseID = W.WarehouseID
WHERE W.Location = 'New York';

/* ====================================================== */
/*  Scenario 8: Retrieve the Latest Status of a Specific Shipment  */
/* ====================================================== */
/*  
   📌 Business Problem:
   A customer wants to check the latest update on their shipment using a tracking number.
   ✅ Solution: Retrieve tracking number and current delivery status.
*/
SELECT TrackingNumber, DeliveryStatus 
FROM Shipments
WHERE TrackingNumber = 'TRK123456';

/* ====================================================== */
/*  Scenario 9: Find Customers Who Haven’t Made Any Shipments  */
/* ====================================================== */
/*  
   📌 Business Problem:
   The company wants to identify customers who registered but haven’t used the service yet.
   ✅ Solution: Retrieve customers without shipment records.
*/
SELECT * FROM Customers WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Shipments);

/* ====================================================== */
/*  Scenario 10: Identify Packages that Exceed a Certain Weight Limit  */
/* ====================================================== */
/*  
   📌 Business Problem:
   A logistics manager wants to find heavy packages that might require special handling.
   ✅ Solution: Retrieve packages where weight exceeds a given limit.
*/
SELECT * FROM Packages WHERE Weight > 20; -- Adjust weight as needed


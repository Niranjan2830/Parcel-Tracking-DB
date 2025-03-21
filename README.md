# 📦 Parcel Track DB

## 👤 Author
**Niranjan Gole**  
LinkedIn: (https://www.linkedin.com/in/niranjan-gole-03b987210/)  
GitHub: (https://github.com/Niranjan2830)

## Overview
Parcel Track DB is a database management system designed for tracking parcels and shipments efficiently. It helps customers monitor their shipments, track their movement, and view package details. This project was developed entirely using SQL with no additional programming languages.

## 🗂 Key Tables & Entities

### 1. Customers Table 🏠
Stores customer details.
- **Primary Key:** Customer ID
- **Key Attributes:** Name, Email, Phone, Address, Registered Date

### 2. Shipments Table 📦
Stores parcel shipment details.
- **Primary Key:** Shipment ID
- **Foreign Key:** Customer ID (References Customers)
- **Key Attributes:** Tracking Number, Source Location, Destination Location, Status, Shipped Date, Expected Delivery Date

### 3. Packages Table 📂
Stores package details within shipments.
- **Primary Key:** Package ID
- **Foreign Key:** Shipment ID (References Shipments)
- **Key Attributes:** Weight, Dimensions, Package Type, Contents

### 4. Tracking History Table 🚚
Logs each scan or movement of a shipment.
- **Primary Key:** Tracking ID
- **Foreign Key:** Shipment ID (References Shipments)
- **Key Attributes:** Status, Location, Updated Time

## 🔗 Relationships Between Tables
- **One-to-Many:** A Customer can have multiple Shipments.
- **One-to-Many:** A Shipment can contain multiple Packages.
- **One-to-Many:** A Shipment can have multiple Tracking History entries.

## 🚀 Key Features
- **End-to-End Parcel Tracking:** Customers can track shipments using unique tracking numbers.
- **Shipment Status Updates:** Every shipment movement is logged in Tracking History.
- **Package-Level Details:** Each shipment can contain multiple packages with different sizes and weights.
- **Customer-Based Shipment Management:** Customers can view all their shipments with delivery statuses.

## 🔧 Installation
To set up the database:
1. Clone the repository:
   ```sh
   git clone https://github.com/Niranjan2830/Parcel-Tracking-DB.git
   ```
2. Open MySQL and create the database:
   ```sql
   CREATE DATABASE ParcelTrackDB;
   USE ParcelTrackDB;
   ```
3. Import the SQL script:
   ```sh
   mysql -u your_username -p ParcelTrackDB < Complete_Program.sql
   ```

## 📊 Usage Examples
Run the following queries to interact with the database:

- Get all shipments in transit:
  ```sql
  SELECT * FROM Shipments WHERE Status = 'In Transit';
  ```
- Count total shipments per customer:
  ```sql
  SELECT C.Name, COUNT(S.ShipmentID) AS TotalShipments 
  FROM Customers C 
  JOIN Shipments S ON C.CustomerID = S.CustomerID 
  GROUP BY C.Name;
  ```

For more queries, check **Queries.sql** and **Scenarios.sql**.

## 🔮 Possible Enhancements
- **Courier Table:** Store details of delivery personnel.
- **Warehouse Table:** Store package storage locations.
- **Payments Table:** Manage customer payments for shipping services.




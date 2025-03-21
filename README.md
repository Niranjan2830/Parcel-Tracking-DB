# Parcel-Tracking-DB
A SQL-based logistics and parcel tracking database management system.
<br>
📝 Author: Niranjan Gole
<br>
LinkedIn: https://www.linkedin.com/in/niranjan-gole-03b987210/
<br>
📅 Created in: 2025
🔗 Project Type: SQL Database

## 📖 Project Overview
Parcel-Tracking-DB is a structured database designed to manage logistics, shipments, packages, couriers, and tracking history. It provides a robust foundation for parcel tracking systems.

## 🚀 Features
- Stores customer, shipment, and package details.
- Manages courier and warehouse information.
- Tracks package movements and payment records.
- Provides useful SQL queries for reporting and analysis.

## 📂 Files in This Repository
- **Schema.sql** → Contains all `CREATE TABLE` statements with explanations.
- **SeedData.sql** → Preloaded sample data (`INSERT INTO` statements) for testing.
- **Queries.sql** → Frequently used queries for tracking shipments, payments, etc.

## 🏗 Database Schema
The database consists of the following tables:
1. **Customers** – Stores customer details.
2. **Shipments** – Contains tracking numbers, source, destination, and delivery status.
3. **Packages** – Details of each package in a shipment (weight, size, type).
4. **Couriers** – Information about delivery personnel handling shipments.
5. **Warehouse** – Storage locations for packages in transit.
6. **Tracking_History** – Logs each scan or movement of a package.
7. **Payments** – Records payments for shipping services.

## 🔧 How to Use
1. **Set up the database**  
   - Run `Schema.sql` to create the tables.  
   - Run `SeedData.sql` to insert sample data.  

2. **Execute sample queries**  
   - Use `Queries.sql` to test and analyze parcel tracking data.

## 📊 Example Query
To find all shipments that are currently "In Transit":
```sql
SELECT * FROM Shipments WHERE DeliveryStatus = 'In Transit';

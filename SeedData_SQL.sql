-- Sample Data for Customers Table: Adding example customers with Name, Email, Phone, and Address.
INSERT INTO Customers VALUES 
(1, 'John Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street, NY', '2024-01-15'),
(2, 'Alice Smith', 'alice.smith@example.com', '987-654-3210', '456 Oak Street, CA', '2024-02-10'),
(3, 'Bob Johnson', 'bob.johnson@example.com', '555-123-6789', '789 Pine Avenue, TX', '2024-03-05'),
(4, 'Emma Davis', 'emma.davis@example.com', '444-555-6666', '101 Maple Road, FL', '2024-03-20'),
(5, 'Michael Brown', 'michael.brown@example.com', '333-222-1111', '202 Birch Lane, IL', '2024-04-01');

-- Sample Data for Shipments Table: Adding shipments with tracking numbers, source, destination, status, and linked customers.
INSERT INTO Shipments VALUES
(1, 'UPS123456789', 1, 'New York, NY', 'Los Angeles, CA', 'In Transit', '2024-03-10', '2024-03-15'),
(2, 'UPS987654321', 2, 'Chicago, IL', 'Houston, TX', 'Delivered', '2024-03-08', '2024-03-13'),
(3, 'UPS555666777', 3, 'Seattle, WA', 'Denver, CO', 'Out for Delivery', '2024-03-12', '2024-03-17'),
(4, 'UPS888999000', 4, 'Miami, FL', 'Atlanta, GA', 'Pending Pickup', '2024-03-14', '2024-03-19'),
(5, 'UPS112233445', 5, 'San Francisco, CA', 'Boston, MA', 'Shipped', '2024-03-16', '2024-03-21');

-- Sample Data for Packages Table: Adding package details such as weight, size, and type, associated with shipments.
INSERT INTO Packages VALUES
(1, 1, 2.5, '12x8x4', 'Box', 'Books'),
(2, 2, 1.2, '10x6x3', 'Envelope', 'Documents'),
(3, 3, 5.0, '15x10x6', 'Box', 'Electronics'),
(4, 4, 3.8, '14x9x5', 'Box', 'Clothing'),
(5, 5, 7.2, '18x12x8', 'Box', 'Kitchenware');

INSERT INTO TrackingHistory VALUES
(1, 1, 'Arrived at Facility', 'Chicago, IL', '2024-03-11 08:30:00'),
(2, 2, 'Delivered', 'Houston, TX', '2024-03-13 15:00:00'),
(3, 3, 'Out for Delivery', 'Denver, CO', '2024-03-17 10:45:00'),
(4, 4, 'Picked Up', 'Miami, FL', '2024-03-14 14:20:00'),
(5, 5, 'Shipped', 'San Francisco, CA', '2024-03-16 12:10:00');


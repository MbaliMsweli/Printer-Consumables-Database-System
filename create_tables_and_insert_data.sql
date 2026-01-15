CREATE DATABASE SandavTonerBusiness;

---create table Supplier and insert data
CREATE TABLE Suppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName VARCHAR(150) NOT NULL,
    Location VARCHAR(100),
    YearsInBusiness INT,
    Email VARCHAR(150),
    Phone VARCHAR(50),
    Country VARCHAR(100),
    TypeOfConsumables VARCHAR(150)
);

INSERT INTO[SandavTonerBusiness].[dbo].[Suppliers]
(SupplierName, Location, YearsInBusiness, Email, Phone, Country, TypeOfConsumables)
VALUES
('ChinaPrint Supplies Ltd', 'Shenzhen', 12, 'sales@chinaprint.com', '+86-755-1234567', 'China', 'Toners, Ink Cartridges'),
('Asia Office Solutions', 'Guangzhou', 9, 'contact@asiaoffice.cn', '+86-20-8765432', 'China', 'Toners, Drums'),
('Global Toner Distributors', 'Johannesburg', 15, 'info@globaltoner.co.za', '011-456-7890', 'South Africa', 'Toners'),
('InkWorld Africa', 'Cape Town', 8, 'support@inkworld.co.za', '021-654-3210', 'South Africa', 'Ink Cartridges'),
('MegaPrint Imports', 'Shanghai', 14, 'export@megaprint.cn', '+86-21-555-8899', 'China', 'Toners, Ink, Spare Parts'),
('OfficePro Suppliers', 'Pretoria', 10, 'sales@officepro.co.za', '012-888-4321', 'South Africa', 'Toners, Paper'),
('SmartPrint Technologies', 'Hangzhou', 7, 'info@smartprinttech.cn', '+86-571-333-2211', 'China', 'Ink, Toners'),
('EcoToner Manufacturing', 'Suzhou', 11, 'contact@ecotoner.cn', '+86-512-777-9900', 'China', 'Eco-friendly Toners'),
('FastTrack Office Supplies', 'Durban', 6, 'orders@fasttrackoffice.co.za', '031-222-1100', 'South Africa', 'Toners, Ink'),
('Universal Print Distributors', 'Beijing', 18, 'export@universalprint.cn', '+86-10-9999-8888', 'China', 'Toners, Drums, Spare Parts');


---create table Reseller and insert data
USE [SandavTonerBusiness]

CREATE TABLE Reseller (
    ResellerID INT PRIMARY KEY,
    SupplierID INT NOT NULL,
    ResellerName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    YearsInBusiness INT,
    Email VARCHAR(100),
    Phone VARCHAR(30),
    Country VARCHAR(50)
);

INSERT INTO[SandavTonerBusiness].[dbo].[Reseller]
(ResellerID, SupplierID, ResellerName, Location, YearsInBusiness, Email, Phone, Country)
VALUES
(1, 101, 'Sandav Toner Business', 'Johannesburg', 1, 'info@sandavtoner.co.za', '071-234-5678', 'South Africa');

---create table Product and insert data

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    SupplierID INT NOT NULL,
    ResellerID INT NOT NULL,

    ProductName VARCHAR(150) NOT NULL,
    ProductType VARCHAR(50),        -- e.g., Drum, Toner, Ink
    Colour VARCHAR(30),             -- Black, Cyan, Magenta, Yellow
    PageYield INT,                  -- number of pages
    Brand VARCHAR(100),             -- e.g., HP Compatible

    SupplierPrice DECIMAL(10,2),
    MOQ INT,
    SupplierBulkDiscount20Units DECIMAL(10,2),

    ResellerPrice DECIMAL(10,2),
    ResellerBulkDiscount20Units DECIMAL(10,2),

    Warranty VARCHAR(50),           -- e.g., 6 months, 1 year
    StockAvailability INT           -- units in stock
);

INSERT INTO Products
(
    ProductID, SupplierID, ResellerID, ProductName, ProductType, Colour,
    PageYield, Brand, SupplierPrice, MOQ, SupplierBulkDiscount20Units,
    ResellerPrice, ResellerBulkDiscount20Units, Warranty, StockAvailability
)
VALUES
-- TONERS
(1, 101, 1, 'HP CF259A Compatible Toner', 'Toner', 'Black', 3000, 'HP Compatible', 620, 20, 580, 1150, 1050, '6 Months', 75),

(2, 101, 1, 'HP CE285A Compatible Toner', 'Toner', 'Black', 1600, 'HP Compatible', 480, 20, 450, 900, 850, '6 Months', 60),

(3, 101, 1, 'HP CF226A Compatible Toner', 'Toner', 'Black', 3100, 'HP Compatible', 650, 20, 610, 1200, 1100, '6 Months', 50),

(4, 101, 1, 'Canon 047 Compatible Toner', 'Toner', 'Black', 1600, 'Canon Compatible', 520, 20, 490, 980, 900, '6 Months', 40),

(5, 101, 1, 'Brother TN-2320 Compatible Toner', 'Toner', 'Black', 2600, 'Brother Compatible', 540, 20, 500, 1050, 980, '6 Months', 55),

-- DRUM UNITS
(6, 101, 1, 'Brother DR-2320 Compatible Drum Unit', 'Drum', 'Black', 12000, 'Brother Compatible', 850, 10, 800, 1550, 1450, '6 Months', 30),

(7, 101, 1, 'HP CF219A Compatible Drum Unit', 'Drum', 'Black', 12000, 'HP Compatible', 900, 10, 850, 1650, 1550, '6 Months', 25),

-- INK CARTRIDGES
(8, 101, 1, 'HP 963XL Compatible Ink Cartridge', 'Ink', 'Black', 2000, 'HP Compatible', 350, 20, 320, 750, 700, '6 Months', 80),

(9, 101, 1, 'Canon PG-245 Compatible Ink Cartridge', 'Ink', 'Black', 1800, 'Canon Compatible', 330, 20, 300, 720, 680, '6 Months', 70),

(10, 101, 1, 'Epson 603XL Compatible Ink Cartridge', 'Ink', 'Cyan', 1500, 'Epson Compatible', 310, 20, 290, 700, 660, '6 Months', 65);


---create table Shipping and insert data

CREATE TABLE SupplierShipping (
    SupplierShippingID INT PRIMARY KEY,
    SupplierID INT NOT NULL,
    ResellerID INT NOT NULL,
    ProductID INT NOT NULL,

    ProductName VARCHAR(150) NOT NULL,

    DeliveryFee_1_5Units DECIMAL(10,2),
    BulkDeliveryFee_6_20Units DECIMAL(10,2),

    DeliveryTimeLocalDays INT,
    CourierName VARCHAR(100),
    TrackingNumber VARCHAR(100),
    DeliveryStatus VARCHAR(50),
    DeliveryDate DATE
);

INSERT INTO SupplierShipping
(
    SupplierShippingID, SupplierID, ResellerID, ProductID, ProductName,
    DeliveryFee_1_5Units, BulkDeliveryFee_6_20Units,
    DeliveryTimeLocalDays, CourierName, TrackingNumber,
    DeliveryStatus, DeliveryDate
)
VALUES
(1, 101, 1, 1, 'HP CF259A Compatible Toner', 120, 300, 2, 'The Courier Guy', 'TCG001234ZA', 'Delivered', '2026-01-05'),

(2, 101, 1, 2, 'HP CE285A Compatible Toner', 120, 300, 2, 'Fastway', 'FW998234ZA', 'Delivered', '2026-01-06'),

(3, 101, 1, 3, 'HP CF226A Compatible Toner', 130, 320, 3, 'DHL Express', 'DHL778899ZA', 'Delivered', '2026-01-07'),

(4, 101, 1, 4, 'Canon 047 Compatible Toner', 120, 300, 2, 'Aramex', 'ARAM556677ZA', 'Delivered', '2026-01-08'),

(5, 101, 1, 5, 'Brother TN-2320 Compatible Toner', 120, 300, 2, 'The Courier Guy', 'TCG009988ZA', 'Delivered', '2026-01-09'),

(6, 101, 1, 6, 'Brother DR-2320 Compatible Drum Unit', 150, 350, 3, 'DHL Express', 'DHL445566ZA', 'In Transit', '2026-01-11'),

(7, 101, 1, 7, 'HP CF219A Compatible Drum Unit', 150, 350, 3, 'Aramex', 'ARAM223344ZA', 'In Transit', '2026-01-11'),

(8, 101, 1, 8, 'HP 963XL Compatible Ink Cartridge', 100, 250, 2, 'Fastway', 'FW112233ZA', 'Delivered', '2026-01-10'),

(9, 101, 1, 9, 'Canon PG-245 Compatible Ink Cartridge', 100, 250, 2, 'The Courier Guy', 'TCG776655ZA', 'Delivered', '2026-01-10'),

(10, 101, 1, 10, 'Epson 603XL Compatible Ink Cartridge', 100, 250, 2, 'Fastway', 'FW554433ZA', 'Pending', '2026-01-12');


---create table SupplierStock and insert data
CREATE TABLE SupplierStock (
    SupplierStockID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    ProductName VARCHAR(150) NOT NULL,

    SupplierID INT NOT NULL,
    SupplierName VARCHAR(150) NOT NULL,
    Location VARCHAR(100),

    Quantity_Available INT,
    Last_Updated DATETIME
);

INSERT INTO SupplierStock
(
    SupplierStockID, ProductID, ProductName,
    SupplierID, SupplierName, Location,
    Quantity_Available, Last_Updated
)
VALUES
(1, 1, 'HP CF259A Compatible Toner', 101, 'ChinaTech Supplies SA', 'Johannesburg Warehouse', 420, '2026-01-12 09:15:00'),

(2, 2, 'HP CE285A Compatible Toner', 101, 'ChinaTech Supplies SA', 'Johannesburg Warehouse', 380, '2026-01-12 09:15:00'),

(3, 3, 'HP CF226A Compatible Toner', 101, 'ChinaTech Supplies SA', 'Johannesburg Warehouse', 310, '2026-01-12 09:15:00'),

(4, 4, 'Canon 047 Compatible Toner', 101, 'ChinaTech Supplies SA', 'Johannesburg Warehouse', 260, '2026-01-12 09:15:00'),

(5, 5, 'Brother TN-2320 Compatible Toner', 101, 'ChinaTech Supplies SA', 'Johannesburg Warehouse', 340, '2026-01-12 09:15:00'),

(6, 6, 'Brother DR-2320 Compatible Drum Unit', 101, 'ChinaTech Supplies SA', 'Johannesburg Warehouse', 190, '2026-01-12 09:15:00'),

(7, 7, 'HP CF219A Compatible Drum Unit', 101, 'ChinaTech Supplies SA', 'Johannesburg Warehouse', 175, '2026-01-12 09:15:00'),

(8, 8, 'HP 963XL Compatible Ink Cartridge', 101, 'ChinaTech Supplies SA', 'Johannesburg Warehouse', 500, '2026-01-12 09:15:00'),

(9, 9, 'Canon PG-245 Compatible Ink Cartridge', 101, 'ChinaTech Supplies SA', 'Johannesburg Warehouse', 460, '2026-01-12 09:15:00'),

(10, 10, 'Epson 603XL Compatible Ink Cartridge', 101, 'ChinaTech Supplies SA', 'Johannesburg Warehouse', 430, '2026-01-12 09:15:00');


---create table Customers and insert data
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(150) NOT NULL,
    Phone VARCHAR(30),
    ContactPerson VARCHAR(100),
    Email VARCHAR(150),
    Location VARCHAR(100),
    CustomerType VARCHAR(50)   -- e.g. School, Office, Print Shop
);

INSERT INTO Customers
(CustomerID, CustomerName, Phone, ContactPerson, Email, Location, CustomerType)
VALUES
(1, 'Holy Family Junior School', '011-234-1001', 'Mrs Dlamini', 'admin@holyfamilyjs.co.za', 'Johannesburg', 'School'),

(2, 'Greenfield Primary School', '012-345-2002', 'Mr Nkosi', 'office@greenfieldprimary.co.za', 'Pretoria', 'School'),

(3, 'Sunrise High School', '031-555-3003', 'Ms Naidoo', 'info@sunrisehigh.co.za', 'Durban', 'School'),

(4, 'TechWorks Solutions', '011-777-4004', 'Mr Botha', 'support@techworks.co.za', 'Johannesburg', 'Office'),

(5, 'BlueSky Accounting', '021-888-5005', 'Ms Jacobs', 'contact@blueskyacc.co.za', 'Cape Town', 'Office'),

(6, 'EduSmart College', '051-666-6006', 'Mr Molefe', 'admin@edusmart.co.za', 'Bloemfontein', 'School'),

(7, 'FastPrint Centre', '043-999-7007', 'Ms Mbeki', 'orders@fastprint.co.za', 'East London', 'Print Shop'),

(8, 'OfficePlus Supplies', '013-222-8008', 'Mr Khumalo', 'sales@officeplus.co.za', 'Nelspruit', 'Office'),

(9, 'Northview Secondary School', '014-333-9009', 'Mrs van Wyk', 'northview@school.co.za', 'Rustenburg', 'School'),

(10, 'QuickCopy Printing', '053-444-1010', 'Mr Daniels', 'quickcopy@printing.co.za', 'Kimberley', 'Print Shop');


---create table Orders and insert data
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ResellerID INT NOT NULL,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    OrderStatus VARCHAR(50),     -- Pending, Paid, Shipped, Delivered, Cancelled
    TotalAmount DECIMAL(12,2)
);

INSERT INTO Orders
(OrderID, ResellerID, CustomerID, OrderDate, OrderStatus, TotalAmount)
VALUES
(1, 1, 1, '2026-01-03', 'Delivered', 3450.00),

(2, 1, 2, '2026-01-04', 'Delivered', 2300.00),

(3, 1, 3, '2026-01-05', 'Paid', 5750.00),

(4, 1, 4, '2026-01-06', 'Delivered', 1800.00),

(5, 1, 5, '2026-01-07', 'Shipped', 2950.00),

(6, 1, 6, '2026-01-08', 'Pending', 1200.00),

(7, 1, 7, '2026-01-09', 'Delivered', 4100.00),

(8, 1, 8, '2026-01-10', 'Paid', 2600.00),

(9, 1, 9, '2026-01-11', 'Cancelled', 1500.00),

(10, 1, 10, '2026-01-12', 'Delivered', 3900.00);


---create table OrderItems and insert data

CREATE TABLE OrderItems (
    OrderItemsID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ResellerID INT NOT NULL,
    ProductID INT NOT NULL,

    ProductName VARCHAR(150) NOT NULL,
    OrderDate DATE NOT NULL,

    Quantity INT NOT NULL,
    ResellerPrice DECIMAL(10,2) NOT NULL,
    TotalAmount DECIMAL(12,2) NOT NULL
);

INSERT INTO OrderItems
(
    OrderItemsID, OrderID, ResellerID, ProductID,
    ProductName, OrderDate, Quantity, ResellerPrice, TotalAmount
)
VALUES
(1, 1, 1, 1, 'HP CF259A Compatible Toner', '2026-01-03', 3, 1150.00, 3450.00),

(2, 2, 1, 2, 'HP CE285A Compatible Toner', '2026-01-04', 2, 1150.00, 2300.00),

(3, 3, 1, 3, 'HP CF226A Compatible Toner', '2026-01-05', 5, 1150.00, 5750.00),

(4, 4, 1, 4, 'Canon 047 Compatible Toner', '2026-01-06', 2, 900.00, 1800.00),

(5, 5, 1, 5, 'Brother TN-2320 Compatible Toner', '2026-01-07', 2, 1475.00, 2950.00),

(6, 6, 1, 6, 'Brother DR-2320 Compatible Drum Unit', '2026-01-08', 1, 1200.00, 1200.00),

(7, 7, 1, 7, 'HP CF219A Compatible Drum Unit', '2026-01-09', 2, 2050.00, 4100.00),

(8, 8, 1, 8, 'HP 963XL Compatible Ink Cartridge', '2026-01-10', 4, 650.00, 2600.00),

(9, 9, 1, 9, 'Canon PG-245 Compatible Ink Cartridge', '2026-01-11', 3, 500.00, 1500.00),

(10, 10, 1, 10, 'Epson 603XL Compatible Ink Cartridge', '2026-01-12', 6, 650.00, 3900.00);



CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    OrderItemID INT NOT NULL,

    PaymentMethod VARCHAR(50),     -- Cash, EFT, Card, Bank Transfer
    TotalAmount DECIMAL(12,2) NOT NULL,
    PaymentStatus VARCHAR(50),     -- Paid, Pending, Failed, Refunded
    PaymentDate DATE,
    Reference VARCHAR(100)
);


---create table Payments and insert data
INSERT INTO Payments
(
    PaymentID, OrderID, OrderItemID, PaymentMethod,
    TotalAmount, PaymentStatus, PaymentDate, Reference
)
VALUES
(1, 1, 1, 'EFT', 3450.00, 'Paid', '2026-01-03', 'EFT-ORD-001'),

(2, 2, 2, 'Card', 2300.00, 'Paid', '2026-01-04', 'CARD-ORD-002'),

(3, 3, 3, 'Bank Transfer', 5750.00, 'Pending', '2026-01-05', 'BT-ORD-003'),

(4, 4, 4, 'Cash', 1800.00, 'Paid', '2026-01-06', 'CASH-ORD-004'),

(5, 5, 5, 'EFT', 2950.00, 'Paid', '2026-01-07', 'EFT-ORD-005'),

(6, 6, 6, 'Card', 1200.00, 'Pending', '2026-01-08', 'CARD-ORD-006'),

(7, 7, 7, 'Bank Transfer', 4100.00, 'Paid', '2026-01-09', 'BT-ORD-007'),

(8, 8, 8, 'EFT', 2600.00, 'Paid', '2026-01-10', 'EFT-ORD-008'),

(9, 9, 9, 'EFT', 1500.00, 'Refunded', '2026-01-11', 'REF-ORD-009'),

(10, 10, 10, 'Card', 3900.00, 'Paid', '2026-01-12', 'CARD-ORD-010');


---create table ResellerShipping and insert data

CREATE TABLE ResellerShipping (
    ResellerShippingID INT PRIMARY KEY,
    ResellerID INT NOT NULL,
    ProductID INT NOT NULL,

    ProductName VARCHAR(150) NOT NULL,

    DeliveryFee_1_5Units DECIMAL(10,2),
    BulkDeliveryFee_6_20Units DECIMAL(10,2),

    DeliveryTimeLocalDays INT,
    CourierName VARCHAR(100),
    TrackingNumber VARCHAR(100),
    DeliveryStatus VARCHAR(50),
    DeliveryDate DATE
);

INSERT INTO ResellerShipping
(
    ResellerShippingID, ResellerID, ProductID, ProductName,
    DeliveryFee_1_5Units, BulkDeliveryFee_6_20Units,
    DeliveryTimeLocalDays, CourierName, TrackingNumber,
    DeliveryStatus, DeliveryDate
)
VALUES
(1, 1, 1, 'HP CF259A Compatible Toner', 80, 200, 1, 'The Courier Guy', 'RS-TCG-001', 'Delivered', '2026-01-06'),

(2, 1, 2, 'HP CE285A Compatible Toner', 80, 200, 1, 'Fastway', 'RS-FW-002', 'Delivered', '2026-01-07'),

(3, 1, 3, 'HP CF226A Compatible Toner', 90, 220, 2, 'DHL Express', 'RS-DHL-003', 'Delivered', '2026-01-08'),

(4, 1, 4, 'Canon 047 Compatible Toner', 80, 200, 1, 'Aramex', 'RS-ARAM-004', 'Delivered', '2026-01-09'),

(5, 1, 5, 'Brother TN-2320 Compatible Toner', 80, 200, 1, 'The Courier Guy', 'RS-TCG-005', 'Delivered', '2026-01-10'),

(6, 1, 6, 'Brother DR-2320 Compatible Drum Unit', 100, 250, 2, 'DHL Express', 'RS-DHL-006', 'In Transit', '2026-01-12'),

(7, 1, 7, 'HP CF219A Compatible Drum Unit', 100, 250, 2, 'Aramex', 'RS-ARAM-007', 'In Transit', '2026-01-12'),

(8, 1, 8, 'HP 963XL Compatible Ink Cartridge', 70, 180, 1, 'Fastway', 'RS-FW-008', 'Delivered', '2026-01-11'),

(9, 1, 9, 'Canon PG-245 Compatible Ink Cartridge', 70, 180, 1, 'The Courier Guy', 'RS-TCG-009', 'Delivered', '2026-01-11'),

(10, 1, 10, 'Epson 603XL Compatible Ink Cartridge', 70, 180, 1, 'Fastway', 'RS-FW-010', 'Pending', '2026-01-13');

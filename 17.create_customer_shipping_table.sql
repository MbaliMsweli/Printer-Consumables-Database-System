
USE [SandavTonerDB]

IF OBJECT_ID('CustomerShipping', 'U') IS NULL
BEGIN
    CREATE TABLE CustomerShipping (
        CustomerShippingID INT IDENTITY(1,1) PRIMARY KEY,
        CustomerOrderID INT NOT NULL,
        CustomerID INT NOT NULL,
        DeliveryFee_1_5Units DECIMAL(12,2),
        BulkDeliveryFee_6_20Units DECIMAL(12,2),
        CourierName VARCHAR(100),
        DeliveryStatus VARCHAR(50),
        DeliveryDate DATE,
        TrackingNumber VARCHAR(150)
    );
END
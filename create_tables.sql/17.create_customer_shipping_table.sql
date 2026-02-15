USE [SandavTonerDB]

IF OBJECT_ID('SandavTonerDB.dbo.CustomerShipping', 'U') IS NULL BEGIN 

CREATE TABLE SandavTonerDB.dbo.CustomerShipping (
    CustomerShippingID INT IDENTITY(1, 1) PRIMARY KEY,
    CustomerOrderID INT NOT NULL,
    CustomerID INT NOT NULL,
    DeliveryFee_1_5Units DECIMAL(12, 2),
    BulkDeliveryFee_6_20Units DECIMAL(12, 2),
    CourierName VARCHAR(100),
    DeliveryStatus VARCHAR(50),
    DeliveryDate DATE,
    TrackingNumber VARCHAR(150)
);

END

---altered this table to add Load Date and Last run check date column
ALTER TABLE [SandavTonerDB].[dbo].[CustomerShipping]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[CustomerShipping]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;

---This Updates the date and time of the last successful data load.
UPDATE [SandavTonerDB].[dbo].[CustomerShipping]
SET LastRunCheckDate = GETDATE();


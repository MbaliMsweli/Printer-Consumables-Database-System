USE [SandavTonerDB]

IF OBJECT_ID('SupplierShipping', 'U') IS NULL
BEGIN
    CREATE TABLE SupplierShipping (
        SupplierShippingID INT IDENTITY(1,1) PRIMARY KEY,
        CompanyOrderID INT NOT NULL,
        SupplierID INT NOT NULL,
        SupplierDeliveryFee_1_5Units DECIMAL(12,2),
        SupplierBulkDeliveryFee_6_20Units DECIMAL(12,2),
        SupplierCourierName VARCHAR(100),
        SupplierDeliveryStatus VARCHAR(50),
        SupplierDeliveryDate DATE,
        SupplierTrackingNumber VARCHAR(150)
    );
END

---altered this table to add Load Date and Last run check date column
ALTER TABLE [SandavTonerDB].[dbo].[SupplierShipping]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[SupplierShipping]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;

---This Updates the date and time of the last successful data load.
UPDATE [SandavTonerDB].[dbo].[SupplierShipping]
SET LastRunCheckDate = GETDATE();


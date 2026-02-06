USE [SandavTonerDB]

IF OBJECT_ID('SupplierPrice', 'U') IS NULL
BEGIN
    CREATE TABLE SupplierPrice (
        SupplierPriceID INT IDENTITY(1,1) PRIMARY KEY,
        SupplierID INT NOT NULL,
        ProductID INT NOT NULL,
        SupplierProductPrice DECIMAL(12,2),
        SupplierMOQ INT,
        SupplierBulkDiscount DECIMAL(5,2)
    );
END


---altered this table to add Load Date and Last run check date column
ALTER TABLE [SandavTonerDB].[dbo].[SupplierPrice]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[SupplierPrice]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;

---This Updates the date and time of the last successful data load.
UPDATE [SandavTonerDB].[dbo].[SupplierPrice]
SET LastRunCheckDate = GETDATE();



USE [SandavTonerDB]

IF OBJECT_ID('SupplierStock', 'U') IS NULL
BEGIN
    CREATE TABLE SupplierStock (
        SupplierStockID INT IDENTITY(1,1) PRIMARY KEY,
        SupplierID INT NOT NULL,
        ProductID INT NOT NULL,
        SupplierQuantityAvailable INT,
        SupplierLastDateUpdated DATETIME
    );
END

---altered this table to add Load Date and Last run check date column
ALTER TABLE [SandavTonerDB].[dbo].[SupplierStock]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[SupplierStock]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;

---This Updates the date and time of the last successful data load.
UPDATE [SandavTonerDB].[dbo].[SupplierStock]
SET LastRunCheckDate = GETDATE();


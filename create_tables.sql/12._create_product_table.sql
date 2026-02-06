USE [SandavTonerDB]

IF OBJECT_ID('Product', 'U') IS NULL
BEGIN
    CREATE TABLE Product (
        ProductID INT IDENTITY(1,1) PRIMARY KEY,
        SupplierID INT NOT NULL,
        CompanyID INT NOT NULL,
        ProductName VARCHAR(150),
        ProductType VARCHAR(100),
        CompatiblePrinterModels VARCHAR(255),
        Brand VARCHAR(100),
        PageYield INT,
        Colour VARCHAR(50),
        Warranty VARCHAR(100)
    );
END

---altered this table to add Load Date and Last run check date column
ALTER TABLE [SandavTonerDB].[dbo].[Product]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[Product]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;

---This Updates the date and time of the last successful data load.
UPDATE [SandavTonerDB].[dbo].[Product]
SET LastRunCheckDate = GETDATE();


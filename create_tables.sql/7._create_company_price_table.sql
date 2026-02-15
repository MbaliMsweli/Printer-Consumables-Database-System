USE [SandavTonerDB]

IF OBJECT_ID('SandavTonerDB.dbo.CompanyPrice', 'U') IS NULL
BEGIN
    CREATE TABLE SandavTonerDB.dbo.CompanyPrice (
        CompanyPriceID INT IDENTITY(1,1) PRIMARY KEY,
        SupplierID INT NOT NULL,
        ProductID INT NOT NULL,
        CompanyProductPrice DECIMAL(12,2),
        CompanyMOQ INT,
        CompanyBulkDiscount DECIMAL(5,2)
    );
END

---altered this table to add Load Date and Last run check date column
ALTER TABLE [SandavTonerDB].[dbo].[CompanyPrice]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[CompanyPrice]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;

---This Updates the date and time of the last successful data load.
UPDATE [SandavTonerDB].[dbo].[CompanyPrice]
SET LastRunCheckDate = GETDATE();


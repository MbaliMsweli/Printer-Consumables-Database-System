
USE [SandavTonerDB]

IF OBJECT_ID('CompanyStock', 'U') IS NULL
BEGIN
    CREATE TABLE CompanyStock (
        CompanyStockID INT IDENTITY(1,1) PRIMARY KEY,
        SupplierID INT NOT NULL,
        ProductID INT NOT NULL,
        CompanyQuantityAvailable INT,
        CompanyLastDateUpdated DATETIME
    );
END

---altered this table to add Load Date and Last run check date column
ALTER TABLE [SandavTonerDB].[dbo].[CompanyStock]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[CompanyStock]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;
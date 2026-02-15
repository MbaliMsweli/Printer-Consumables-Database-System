USE [SandavTonerDB]

IF OBJECT_ID('SandavTonerDB.dbo.Customer', 'U') IS NULL
BEGIN
    CREATE TABLE SandavTonerDB.dbo.Customer (
        CustomerID INT IDENTITY(1,1) PRIMARY KEY,
        CustomerName VARCHAR(150),
        CustomerEmail VARCHAR(150),
        CustomerPhone VARCHAR(50),
        CustomerProvince VARCHAR(100),
        CustomerCity VARCHAR(100),
        CustomerCountry VARCHAR(100),
        CustomerType VARCHAR(50)
    );
END

---altered this table to add Load Date and Last run check date column
ALTER TABLE [SandavTonerDB].[dbo].[Customer]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[Customer]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;

---This Updates the date and time of the last successful data load.
UPDATE [SandavTonerDB].[dbo].[Customer]
SET LastRunCheckDate = GETDATE();


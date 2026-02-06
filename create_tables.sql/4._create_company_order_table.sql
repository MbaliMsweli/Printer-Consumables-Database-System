USE [SandavTonerDB]

IF OBJECT_ID('CompanyOrder', 'U') IS NULL
BEGIN
    CREATE TABLE CompanyOrder (
        CompanyOrderID INT IDENTITY(1,1) PRIMARY KEY,
        CompanyID INT NOT NULL,
        SupplierID INT NOT NULL,
        OrderDate DATE,
        TotalAmount DECIMAL(12,2),
        OrderStatus VARCHAR(50)
    );
END

---altered this table to add Load Date and Last run check date column
 ALTER TABLE [SandavTonerDB].[dbo].[CompanyOrder]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[CompanyOrder]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;
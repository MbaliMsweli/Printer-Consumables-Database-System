
USE [SandavTonerDB]

IF OBJECT_ID('CompanyOrderItem', 'U') IS NULL
BEGIN
    CREATE TABLE CompanyOrderItem (
        CompanyOrderItemID INT IDENTITY(1,1),
        CompanyOrderID INT NOT NULL,
        ProductID INT NOT NULL,
        Quantity INT,
        Price DECIMAL(12,2)
    );
END

---altered this table to add Load Date and Last run check date column
ALTER TABLE [SandavTonerDB].[dbo].[CompanyOrderItem]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;


---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[CompanyOrderItem]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;
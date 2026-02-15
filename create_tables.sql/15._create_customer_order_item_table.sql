USE [SandavTonerDB]

IF OBJECT_ID('SandavTonerDB.dbo.CustomerOrderItem', 'U') IS NULL
BEGIN
    CREATE TABLE SandavTonerDB.dbo.CustomerOrderItem (
        CustomerOrderItemID INT IDENTITY(1,1),
        CustomerOrderID INT NOT NULL,
        ProductID INT NOT NULL,
        Quantity INT,
        Price DECIMAL(12,2)
    );
END

---altered this table to add Load Date and Last run check date column
ALTER TABLE [SandavTonerDB].[dbo].[CustomerOrderItem]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[CustomerOrderItem]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;

---This Updates the date and time of the last successful data load.
UPDATE [SandavTonerDB].[dbo].[CustomerOrderItem]
SET LastRunCheckDate = GETDATE();


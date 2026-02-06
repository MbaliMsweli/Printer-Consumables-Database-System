

USE [SandavTonerDB]

IF OBJECT_ID('CustomerPayment', 'U') IS NULL
BEGIN
    CREATE TABLE CustomerPayment (
        CustomerPaymentID INT IDENTITY(1,1) PRIMARY KEY,
        CustomerOrderID INT NOT NULL,
        CustomerID INT NOT NULL,
        CustomerPaymentMethod VARCHAR(50),
        CustomerTotalAmount DECIMAL(12,2),
        PaymentDate DATE,
        PaymentStatus VARCHAR(50),
        Reference VARCHAR(150)
    );
END

---altered this table to add Load Date and Last run check date column
ALTER TABLE [SandavTonerDB].[dbo].[CustomerPayment]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[CustomerPayment]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;
USE [SandavTonerDB]

IF OBJECT_ID('CompanyPayment', 'U') IS NULL
BEGIN
    CREATE TABLE CompanyPayment (
        CompanyPaymentID INT IDENTITY(1,1) PRIMARY KEY,
        CompanyOrderID INT NOT NULL,
        SupplierID INT NOT NULL,
        CompanyPaymentMethod VARCHAR(50),
        PaidAmount DECIMAL(12,2),
        PaymentDate DATE,
        PaymentStatus VARCHAR(50),
        Reference VARCHAR(150)
    );
END


---altered this table to add Load Date and Last run check date column
ALTER TABLE [SandavTonerDB].[dbo].[CompanyPayment]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[CompanyPayment]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;
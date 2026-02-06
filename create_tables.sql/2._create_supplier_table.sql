USE [SandavTonerDB]

IF OBJECT_ID('Supplier', 'U') IS NULL
BEGIN
    CREATE TABLE Supplier (
        SupplierID INT IDENTITY(1,1) PRIMARY KEY,
        SupplierName VARCHAR(150),
        SupplierEmail VARCHAR(150),
        SupplierPhone VARCHAR(50),
        SupplierProvince VARCHAR(100),
        SupplierCity VARCHAR(100),
        SupplierCountry VARCHAR(100),
        SupplierYearsInBusiness INT
    );
END

---altered the this table to add Load Date and Last run check date column
 ALTER TABLE [SandavTonerDB].[dbo].[Supplier]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;


---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[Supplier]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;





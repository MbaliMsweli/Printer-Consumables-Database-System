USE [SandavTonerDB];

IF OBJECT_ID('Supplier', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Supplier (
        SupplierID INT IDENTITY(1,1) PRIMARY KEY,
        SupplierName VARCHAR(100) NOT NULL,
        Email VARCHAR(100),
        Phone VARCHAR(30),
        Location VARCHAR(100),
        YearsInBusiness INT,
        Country VARCHAR(50),
        TypeOfConsumables VARCHAR(100)
    );
END

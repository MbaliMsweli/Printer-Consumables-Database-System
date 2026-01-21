USE [SandavTonerDB]

IF OBJECT_ID('Product', 'U') IS NULL
BEGIN
    CREATE TABLE Product (
        ProductID INT IDENTITY(1,1) PRIMARY KEY,
        SupplierID INT NOT NULL,
        CompanyID INT NOT NULL,
        ProductName VARCHAR(150),
        ProductType VARCHAR(100),
        CompatiblePrinterModels VARCHAR(255),
        Brand VARCHAR(100),
        PageYield INT,
        Colour VARCHAR(50),
        Warranty VARCHAR(100)
    );
END


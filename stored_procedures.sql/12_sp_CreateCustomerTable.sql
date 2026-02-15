
CREATE OR ALTER PROCEDURE dbo.sp_Customer
AS
BEGIN    SET NOCOUNT ON;

IF OBJECT_ID('Customer', 'U') IS NULL
BEGIN
    CREATE TABLE Customer (
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
END;

EXEC dbo.sp_Customer;
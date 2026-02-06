
CREATE OR ALTER PROCEDURE dbo.sp_CreateSupplierTable
AS
BEGIN
    SET NOCOUNT ON;

    IF OBJECT_ID('dbo.Supplier', 'U') IS NULL
    BEGIN
        CREATE TABLE dbo.Supplier (
            SupplierID INT IDENTITY(1,1) PRIMARY KEY,
            SupplierName VARCHAR(150) NOT NULL,
            SupplierEmail VARCHAR(150) NULL,
            SupplierPhone VARCHAR(50) NULL,
            SupplierProvince VARCHAR(100) NULL,
            SupplierCity VARCHAR(100) NULL,
            SupplierCountry VARCHAR(100) NULL,
            SupplierYearsInBusiness INT NULL
        );
    END
END;

EXEC dbo.sp_CreateSupplierTable;
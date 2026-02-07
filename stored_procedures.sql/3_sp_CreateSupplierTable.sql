CREATE OR ALTER PROCEDURE dbo.sp_CreateSupplierTable AS BEGIN
SET
    NOCOUNT ON;

IF OBJECT_ID('dbo.Supplier', 'U') IS NULL 
BEGIN 
CREATE TABLE SandavTonerDB.dbo.Supplier (
    [SupplierID] [int] IDENTITY(1, 1) NOT NULL,
    [SupplierName] [varchar](150) NULL,
    [SupplierEmail] [varchar](150) NULL,
    [SupplierPhone] [varchar](50) NULL,
    [SupplierProvince] [varchar](100) NULL,
    [SupplierCity] [varchar](100) NULL,
    [SupplierCountry] [varchar](100) NULL,
    [SupplierYearsInBusiness] [int] NULL,
    [LoadDate] [datetime] NULL,
    [LastRunCheckDate] [datetime] NULL,
);

END
END;

EXEC dbo.sp_CreateSupplierTable;
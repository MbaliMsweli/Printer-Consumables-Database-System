
CREATE OR ALTER PROCEDURE dbo.sp_CompanyPrice
AS
BEGIN
    SET NOCOUNT ON;

IF OBJECT_ID('SandavTonerDB.dbo.CompanyPrice', 'U') IS NULL
BEGIN
    CREATE TABLE [SandavTonerDB].dbo.CompanyPrice (
        CompanyPriceID INT IDENTITY(1,1) PRIMARY KEY,
        SupplierID INT NOT NULL,
        ProductID INT NOT NULL,
        CompanyProductPrice DECIMAL(12,2),
        CompanyMOQ INT,
        CompanyBulkDiscount DECIMAL(5,2)
    );
END
END;

EXEC dbo.sp_CompanyPrice;
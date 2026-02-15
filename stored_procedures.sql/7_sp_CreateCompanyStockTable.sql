
CREATE OR ALTER PROCEDURE dbo.sp_CompanyStock
AS
BEGIN
    SET NOCOUNT ON;

IF OBJECT_ID('CompanyStock', 'U') IS NULL
BEGIN
    CREATE TABLE[SandavTonerDB].dbo.CompanyStock (
        CompanyStockID INT IDENTITY(1,1) PRIMARY KEY,
        SupplierID INT NOT NULL,
        ProductID INT NOT NULL,
        CompanyQuantityAvailable INT,
        CompanyLastDateUpdated DATETIME
    );
END
END;

EXEC dbo.sp_CompanyStock;
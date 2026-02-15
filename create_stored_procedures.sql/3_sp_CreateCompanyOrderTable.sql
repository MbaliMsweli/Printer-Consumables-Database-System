
CREATE OR ALTER PROCEDURE dbo.sp_CompanyOrder
AS
BEGIN
    SET NOCOUNT ON;

    
IF OBJECT_ID('SandavTonerDB.dbo.CompanyOrder', 'U') IS NULL
BEGIN
    CREATE TABLE SandavTonerDB.dbo.CompanyOrder (
        CompanyOrderID INT IDENTITY(1,1) PRIMARY KEY,
        CompanyID INT NOT NULL,
        SupplierID INT NOT NULL,
        OrderDate DATE,
        TotalAmount DECIMAL(12,2),
        OrderStatus VARCHAR(50)
    );
END
END;

EXEC dbo.sp_CompanyOrder;
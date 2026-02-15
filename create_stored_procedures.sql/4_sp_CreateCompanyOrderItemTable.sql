
CREATE OR ALTER PROCEDURE dbo.sp_CompanyOrderItem
AS
BEGIN
    SET NOCOUNT ON;

    
IF OBJECT_ID('SandavTonerDB.dbo.CompanyOrderItem', 'U') IS NULL
BEGIN
    CREATE TABLE SandavTonerDB.dbo.CompanyOrderItem (
        CompanyOrderItemID INT IDENTITY(1,1),
        CompanyOrderID INT NOT NULL,
        ProductID INT NOT NULL,
        Quantity INT,
        Price DECIMAL(12,2)
    );
END
END;

EXEC dbo.sp_CompanyOrderItem;
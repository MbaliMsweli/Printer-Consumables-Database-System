
CREATE OR ALTER PROCEDURE dbo.sp_CustomerOrderItem
AS
BEGIN    SET NOCOUNT ON;

IF OBJECT_ID('SandavTonerDB.dbo.CustomerOrderItem', 'U') IS NULL
BEGIN
    CREATE TABLE SandavTonerDB.dbo.CustomerOrderItem (
        CustomerOrderItemID INT IDENTITY(1,1),
        CustomerOrderID INT NOT NULL,
        ProductID INT NOT NULL,
        Quantity INT,
        Price DECIMAL(12,2)
    );
END
END;

EXEC dbo.sp_CustomerOrderItem;
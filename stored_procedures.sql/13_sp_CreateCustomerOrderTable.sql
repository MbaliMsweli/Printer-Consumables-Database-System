
CREATE OR ALTER PROCEDURE dbo.sp_CustomerOrder
AS
BEGIN    SET NOCOUNT ON;

IF OBJECT_ID('SandavTonerDB.dbo.CustomerOrder', 'U') IS NULL
BEGIN
    CREATE TABLE SandavTonerDB.dbo.CustomerOrder (
        CustomerOrderID INT IDENTITY(1,1) PRIMARY KEY,
        CustomerID INT NOT NULL,
        CustomerOrderDate DATE,
        CustomerTotalAmount DECIMAL(12,2),
        CustomerOrderStatus VARCHAR(50)
    );
END
END;

EXEC dbo.sp_CustomerOrder;
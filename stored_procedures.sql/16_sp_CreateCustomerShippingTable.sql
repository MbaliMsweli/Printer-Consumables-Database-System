
CREATE OR ALTER PROCEDURE dbo.sp_CustomerShipping
AS
BEGIN    SET NOCOUNT ON;

IF OBJECT_ID('SandavTonerDB.dbo.CustomerShipping', 'U') IS NULL BEGIN 

CREATE TABLE SandavTonerDB.dbo.CustomerShipping (
    CustomerShippingID INT IDENTITY(1, 1) PRIMARY KEY,
    CustomerOrderID INT NOT NULL,
    CustomerID INT NOT NULL,
    DeliveryFee_1_5Units DECIMAL(12, 2),
    BulkDeliveryFee_6_20Units DECIMAL(12, 2),
    CourierName VARCHAR(100),
    DeliveryStatus VARCHAR(50),
    DeliveryDate DATE,
    TrackingNumber VARCHAR(150)
);

END
END;

EXEC dbo.sp_CustomerShipping;
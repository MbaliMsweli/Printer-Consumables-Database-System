
CREATE OR ALTER PROCEDURE dbo.sp_SupplierShipping
AS
BEGIN    SET NOCOUNT ON;

IF OBJECT_ID('SupplierShipping', 'U') IS NULL
BEGIN
    CREATE TABLE SupplierShipping (
        SupplierShippingID INT IDENTITY(1,1) PRIMARY KEY,
        CompanyOrderID INT NOT NULL,
        SupplierID INT NOT NULL,
        SupplierDeliveryFee_1_5Units DECIMAL(12,2),
        SupplierBulkDeliveryFee_6_20Units DECIMAL(12,2),
        SupplierCourierName VARCHAR(100),
        SupplierDeliveryStatus VARCHAR(50),
        SupplierDeliveryDate DATE,
        SupplierTrackingNumber VARCHAR(150)
    );
END
END;

EXEC dbo.sp_SupplierShipping;
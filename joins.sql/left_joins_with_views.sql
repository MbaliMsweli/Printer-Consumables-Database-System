USE [SandavTonerDB] 

-----creating a view to see supplier's product prices 

CREATE VIEW ProductSupplierPrices AS
SELECT 
    p.ProductName,
    p.CompatiblePrinterModels,
    sp.SupplierID,
    sp.SupplierProductPrice,
    sp.SupplierMOQ,
    sp.SupplierBulkDiscount
FROM Product AS p
LEFT JOIN SupplierPrice AS sp
    ON p.ProductID = sp.ProductID
   AND p.SupplierID = sp.SupplierID;

   SELECT * FROM ProductSupplierPrices;


-----checkung customer order shipping status
   CREATE VIEW CustomerOrderShippingStatus AS
SELECT 
    c.CustomerID,
    c.CustomerOrderID,
    c.CustomerOrderStatus,
    s.DeliveryStatus,
    s.TrackingNumber,
    s.CourierName
FROM [dbo].[CustomerOrder] AS c
LEFT JOIN [dbo].[CustomerShipping] AS s
    ON c.CustomerOrderID = s.CustomerOrderID

SELECT * FROM CustomerOrderShippingStatus; 



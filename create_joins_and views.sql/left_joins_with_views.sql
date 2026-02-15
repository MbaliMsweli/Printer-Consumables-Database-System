--LEFT JOIN
--Shows everything from the left table
--Shows all rows from the first table
--Adds matching data from the second table
--If no match → the second table shows NULL


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
    s.CourierName,
    c.LoadDate,
    c.LastRunCheckDate
FROM [dbo].[CustomerOrder] AS c
LEFT JOIN [dbo].[CustomerShipping] AS s
    ON c.CustomerOrderID = s.CustomerOrderID

SELECT * FROM CustomerOrderShippingStatus; 


-- This view joins customer order data with the date dimension to add calendar details such as weekends and public holidays.
CREATE VIEW vw_CustomerOrders_WithDates AS
SELECT TOP (1000) [CustomerOrderID]
      ,[CustomerID]
      ,[CustomerOrderDate]
      ,[CustomerTotalAmount]
      ,[CustomerOrderStatus]
      ,[Order_Year]
      ,[Order_Day]
      ,[Order_Month_Actual]
      ,[Order_Month_Number]
      ,b.[Is_Weekend]
      ,b.[Day_in_Week_Desc]
      ,b.[Is_Public_Holiday]
  FROM [SandavTonerDB].[dbo].[CustomerOrder] AS a
   LEFT JOIN [SandavTonerDB].[dbo].[Dim_Date] AS b
  ON a.[Order_Year] = b.[Year] AND
 a.[Order_Month_Number] = b.[Month_in_Year]

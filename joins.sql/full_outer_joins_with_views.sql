-----Creating a View to check stock availability from all suppliers 
USE [SandavTonerDB]

SELECT * FROM [dbo].[SupplierStock];
SELECT * FROM [dbo].[Product];


CREATE VIEW SupplierProductStockAvaiilability AS
SELECT 
    p.SupplierID,
    p.ProductID,
    p.ProductName,
    p.CompatiblePrinterModels,
    p.PageYield,
    p.Colour,
    s.SupplierQuantityAvailable,
    s.SupplierLastDateUpdated
FROM  [dbo].[Product] AS p
FULL OUTER JOIN [dbo].[SupplierStock] AS s
    ON p.ProductID = s.ProductID
    AND p.SupplierID = s.SupplierID

 SELECT* FROM CustomersWithPendingOrder;


-----Creating a View to check stock availability from the company


SELECT * FROM[dbo].[CompanyStock];
SELECT * FROM [dbo].[Product];


CREATE VIEW CompanyProductStockAvaiilability AS
SELECT 
    p.CompanyID,
    p.ProductID,
    p.ProductName,
    p.CompatiblePrinterModels,
    p.PageYield,
    p.Colour,
    c.CompanyQuantityAvailable,
    c.CompanyLastDateUpdated
FROM  [dbo].[Product] AS p
FULL OUTER JOIN [dbo].[CompanyStock] AS c
    ON p.ProductID = c.ProductID
   

 SELECT * FROM CompanyProductStockAvaiilability; 
USE [SandavTonerDB]

----selecting tables I will need to create my view
SELECT* FROM [dbo].[Supplier]

SELECT * FROM[dbo].[Product]

SELECT * FROM [dbo].[SupplierStock]

-----creating a view to check the specific product and which supplier has it
CREATE VIEW CheckingProductFromSupplier AS
SELECT 
p.SupplierID,
p.ProductName,
p.CompatiblePrinterModels,
ss.SupplierQuantityAvailable,
ss.SupplierLastDateUpdated
FROM [dbo].[Product] AS p
INNER JOIN [dbo].[SupplierStock] AS ss
ON p.SupplierID = ss.SupplierID
WHERE CompatiblePrinterModels LIKE '%HP 1010%';

SELECT * FROM CheckingProductFromSupplier;


----selecting tables I will need to create my view
SELECT * FROM [dbo].[CompanyOrder];

SELECT * FROM [dbo].[CompanyOrderItem]

SELECT* FROM [dbo].[Supplier]

----checking order status for the orders that the company placed from the supplier and the total paid for the quantity that was ordered

CREATE VIEW CompanyOrderStatus_TotalPaid AS
SELECT 
co.CompanyOrderID,
co.supplierID,
co.OrderStatus,
co.OrderDate,
coi.Quantity,
SUM(coi.Quantity*coi.Price) as TotalPaid
FROM [CompanyOrder] AS co
INNER JOIN [CompanyOrderItem] AS coi
ON co.CompanyOrderID = coi.CompanyOrderID
GROUP BY 
co.CompanyOrderID,
co.SupplierID,
co.OrderStatus,
co.OrderDate,
coi.Quantity;

---quering the view 
SELECT * FROM CompanyOrderStatus_TotalPaid;


----selecting tables I will need to create my view
SELECT* FROM [dbo].[Customer]
SELECT* FROM [dbo].[CustomerOrder]

----Checkings customer names, city, order date with Pending order status 

CREATE VIEW CustomersWithPendingOrder AS
SELECT
co.CustomerOrderStatus,
co.CustomerOrderDate,
co.CustomerTotalAmount,
c.CustomerName,
c.CustomerCity,
c.CustomerType
FROM CustomerOrder as co
INNER JOIN Customer as c
ON co.CustomerID = c.CustomerID
WHERE co.CustomerOrderStatus = 'Pending';


-----joining tables to see comapny order details 
SELECT TOP (1000) [CompanyOrderID]
      ,[CompanyID]
      ,[SupplierID]
      ,[OrderDate]
      ,[TotalAmount]
      ,[OrderStatus]
      ,[Month_Name]
      ,[Month_Number]
      ,[Order_Year]
      ,[Order_Day]
  FROM [SandavTonerDB].[dbo].[CompanyOrder] AS a
  INNER JOIN [SandavTonerDB].[dbo].[Dim_Date] AS b
  ON a.[Order_Year] = b.[Year] AND
 a.[Month_Number] = b.[Month_in_Year]
 
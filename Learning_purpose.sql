SELECT TOP (1000) [CompanyOrderID]
      ,[CompanyID]
      ,[SupplierID]
      ,[OrderDate]
      ,[TotalAmount]
      ,[OrderStatus]
  FROM [SandavTonerDB].[dbo].[CompanyOrder]

---Spliting the date column in Company order table 
  SELECT 
 DATENAME (MONTH, OrderDate) AS Month_Nme,
 MONTH(OrderDate) AS Month_Number,
 YEAR(OrderDate) as Order_Year,
 DAY(OrderDate) AS Order_Day

 FROM [SandavTonerDB].[dbo].[CompanyOrder]

 --adding new columns for splitted date 
 ALTER TABLE [SandavTonerDB].[dbo].[CompanyOrder]
 ADD Month_Name varchar (20),
 Month_Number int,
 Order_Year int,
 Order_Day int

 --- now upate the new added columns and assign values 

 UPDATE [SandavTonerDB].[dbo].[CompanyOrder]
 SET Month_Name = DATENAME (MONTH, OrderDate),
 Month_Number = MONTH(OrderDate),
  Order_Year = YEAR(OrderDate), 
  Order_Day = DAY(OrderDate)

---I was altering the table and changing data type in the column Order_Month_Actual
ALTER TABLE [SandavTonerDB].[dbo].[CustomerOrder]
ALTER COLUMN Order_Month_Actual VARCHAR(20);

---i was updating the dim date table to set the Year column to have 2025 as a value inside 
    UPDATE [dbo].[Dim_Date]
    SET Year = 2025

--was checking the maximum year in dim table 
SELECT Distinct Max(Year) FROM [dbo].[Dim_Date];

----was joining tables 
SELECT TOP 5 [CustomerOrderID]
      ,[CustomerID]
      ,[CustomerOrderDate]
      ,[CustomerTotalAmount]
      ,[CustomerOrderStatus]
      ,[Order_Year]
      ,[Order_Day]
      ,[Order_Month_Actual]
      ,[Order_Month_Number]
  FROM [SandavTonerDB].[dbo].[CustomerOrder] as a
inner join [SandavTonerDB].[dbo].[Dim_Date] as b
on a. [Order_Year] = b.[Year] AND
a.Order_Month_Number = b.[Month_in_Year] AND 
a.[Order_Month_Actual] = b.[Month_in_Year_Desc];
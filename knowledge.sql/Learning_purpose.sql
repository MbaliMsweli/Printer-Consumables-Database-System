SELECT TOP (1000) [CompanyOrderID]
      ,[CompanyID]
      ,[SupplierID]
      ,[OrderDate]
      ,[TotalAmount]
      ,[OrderStatus]
  FROM [SandavTonerDB].[dbo].[CompanyOrder]

---Spliting the Order date column from Company order table to have month name sepately, month number etc 
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


---WHEN I WAS RUNNING MY CODE I got an empty columns , the reason was that the order year on Company order table was 2026 
--and the year on the Dim table table was 2025, so it didnt match

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
 
 ---so i had to check first the  order year and month number in comany order table 
 SELECT DISTINCT Order_Year, Month_Number
FROM dbo.CompanyOrder;

---then updated the Order year to 2025 to match with a year in Dim table 
UPDATE[SandavTonerDB].[dbo].[CompanyOrder]
SET Order_Year = 2025


----    Load Date
----This shows when a specific row was inserted into the table.
----Why it’s important:
----Helps with auditing (when did this data arrive?)
----Useful for debugging data issues
--Lets you track data freshness

--Simple example:
--A customer order has LoadDate = 2026-02-06 → that’s when it entered the warehouse, not when the order was mad


-------Last Run Check Column
--This is used to remember the last time your ETL/job ran successfully.

--Why it’s important:
--It helps the system know where to continue from next time
--Prevents loading the same data twice
--Makes the process re-runnable (you can safely run it again without breaking things)

--Simple example:
--“Last run = 2026-02-01 10:00”
--Next run will only load records newer than that tim

---here im altering my tables to add load date column and last run checl column
  ALTER TABLE [SandavTonerDB].[dbo].[Company]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

    --  If the table already has data
--You can populate LoadDate for old records like this:
UPDATE [SandavTonerDB].[dbo].[CustomerOrderItem]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;

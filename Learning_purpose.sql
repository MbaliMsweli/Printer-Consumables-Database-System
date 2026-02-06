SELECT TOP (1000) [CustomerOrderID]
      ,[CustomerID]
      ,[CustomerOrderDate]
      ,[CustomerTotalAmount]
      ,[CustomerOrderStatus]
      ,[Order_Year]
      ,[Order_Day]
      ,[Order_Month_Actual]
      ,[Order_Month_Number]
  FROM [SandavTonerDB].[dbo].[CustomerOrder]

    SELECT
    DATENAME(MONTH, CustomerOrderDate) AS MonthName, -- For display
    MONTH(CustomerOrderDate) AS MonthNumber,
    YEAR(CustomerOrderDate) AS Year,
     DAY(CustomerOrderDate) AS DayNumber
FROM
    [SandavTonerDB].[dbo].[CustomerOrder]

--- was altering the table to add new columns 
ALTER TABLE [SandavTonerDB].[dbo].[CustomerOrder]
ADD Order_Month_Actual varchar,
Order_Month_Number int

---I was updating the table and assigning values in the columns below 
    UPDATE [SandavTonerDB].[dbo].[CustomerOrder]
      SET Order_Year =  YEAR(CustomerOrderDate),
      [Order_Day] = DAY(CustomerOrderDate),
      [Order_Month_Actual]=  DATENAME(MONTH, CustomerOrderDate),
      [Order_Month_Number]=  MONTH(CustomerOrderDate)

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
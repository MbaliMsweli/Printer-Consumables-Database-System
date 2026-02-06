/* ================================
   CHANGE DATE RANGE HERE
   ================================ */
DECLARE @StartDate DATE = '2025-01-01';
DECLARE @EndDate   DATE = '2025-12-31';


/* ================================
   CREATE TABLE
   ================================ */
IF NOT EXISTS (
    SELECT 1 
    FROM sys.objects 
    WHERE name = 'Dim_Date' 
      AND type = 'U'
)
BEGIN
    CREATE TABLE dbo.Dim_Date (
        Date_ID INT NOT NULL PRIMARY KEY,
        Actual_Date DATE NOT NULL,

        Month_ID INT NOT NULL,
        Month_Desc NVARCHAR(30) NOT NULL,
        Month_Short_Desc NVARCHAR(10) NOT NULL,
        Month_in_Year INT NOT NULL,

        Quarter_ID INT NOT NULL,
        Quarter_Desc VARCHAR(10) NOT NULL,
        Quarter_in_Year INT NOT NULL,

        [Year] INT NOT NULL,

        Week_in_Year INT NOT NULL,
        Day_in_Year INT NOT NULL,
        Day_in_Month INT NOT NULL,
        Day_in_Week INT NOT NULL,
        Day_in_Week_Desc NVARCHAR(15) NOT NULL,

        Is_Weekend BIT NOT NULL,

        Fiscal_Year INT NOT NULL,
        Fiscal_Month_in_Year INT NOT NULL,
        Fiscal_Quarter_in_Year INT NOT NULL,

        Is_Work_Day BIT NOT NULL,
        Is_Public_Holiday BIT NOT NULL,
        Public_Holiday_Desc VARCHAR(50) NULL,

        Reporting_Date_Desc VARCHAR(12) NULL
    );
END;   -- ✅ THIS WAS REQUIRED


/* ================================
   INSERT DATA (DYNAMIC)
   ================================ */
;WITH DateRange AS (
    SELECT @StartDate AS Actual_Date
    UNION ALL
    SELECT DATEADD(DAY, 1, Actual_Date)
    FROM DateRange
    WHERE Actual_Date < @EndDate
)
INSERT INTO dbo.Dim_Date (
    Date_ID,
    Actual_Date,
    Month_ID,
    Month_Desc,
    Month_Short_Desc,
    Month_in_Year,
    Quarter_ID,
    Quarter_Desc,
    Quarter_in_Year,
    [Year],
    Week_in_Year,
    Day_in_Year,
    Day_in_Month,
    Day_in_Week,
    Day_in_Week_Desc,
    Is_Weekend,
    Fiscal_Year,
    Fiscal_Month_in_Year,
    Fiscal_Quarter_in_Year,
    Is_Work_Day,
    Is_Public_Holiday,
    Public_Holiday_Desc,
    Reporting_Date_Desc
)
SELECT
    CAST(FORMAT(Actual_Date, 'yyyyMMdd') AS INT),
    Actual_Date,

    YEAR(Actual_Date) * 100 + MONTH(Actual_Date),
    DATENAME(MONTH, Actual_Date) + ' ' + CAST(YEAR(Actual_Date) AS VARCHAR),
    LEFT(DATENAME(MONTH, Actual_Date), 3) + ' ' + CAST(YEAR(Actual_Date) AS VARCHAR),
    MONTH(Actual_Date),

    YEAR(Actual_Date) * 10 + DATEPART(QUARTER, Actual_Date),
    'Q' + CAST(DATEPART(QUARTER, Actual_Date) AS VARCHAR) + ' ' + CAST(YEAR(Actual_Date) AS VARCHAR),
    DATEPART(QUARTER, Actual_Date),

    YEAR(Actual_Date),

    DATEPART(WEEK, Actual_Date),
    DATEPART(DAYOFYEAR, Actual_Date),
    DAY(Actual_Date),
    DATEPART(WEEKDAY, Actual_Date),
    DATENAME(WEEKDAY, Actual_Date),

    CASE 
        WHEN DATENAME(WEEKDAY, Actual_Date) IN ('Saturday','Sunday') THEN 1 
        ELSE 0 
    END,

    YEAR(Actual_Date),
    MONTH(Actual_Date),
    DATEPART(QUARTER, Actual_Date),

    CASE 
        WHEN DATENAME(WEEKDAY, Actual_Date) IN ('Saturday','Sunday') THEN 0 
        ELSE 1 
    END,
    CASE 
        WHEN Actual_Date = '2026-01-01' THEN 1 
        ELSE 0 
    END,
    CASE 
        WHEN Actual_Date = '2026-01-01' THEN 'New Year''s Day'
        ELSE NULL
    END,

    FORMAT(Actual_Date, 'dd-MMM-yy')

FROM DateRange
OPTION (MAXRECURSION 0);

--SELECT *
--FROM dbo.Dim_Date
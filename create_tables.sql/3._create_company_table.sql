USE [SandavTonerDB]

IF OBJECT_ID('Company', 'U') IS NULL
BEGIN
    CREATE TABLE Company (
        CompanyID INT IDENTITY(1,1) PRIMARY KEY,
        CompanyName VARCHAR(150),
        CompanyEmail VARCHAR(150),
        CompanyPhone VARCHAR(50),
        CompanyProvince VARCHAR(100),
        CompanyCity VARCHAR(100),
        CompanyCountry VARCHAR(100),
        CompanyYearsInBusiness INT
    );
END

---altered this table to add Load Date and Last run check date column
 ALTER TABLE [SandavTonerDB].[dbo].[Company]
ADD 
    LoadDate DATETIME DEFAULT GETDATE(),
    LastRunCheckDate DATETIME NULL;

---This adds today’s date to rows that were missing a load date.
UPDATE [SandavTonerDB].[dbo].[Company]
SET LoadDate = GETDATE()
WHERE LoadDate IS NULL;
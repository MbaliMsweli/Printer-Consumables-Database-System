
CREATE OR ALTER PROCEDURE dbo.sp_CreateCompanyTable
AS
BEGIN
    SET NOCOUNT ON;

    
IF OBJECT_ID('dbo.Company', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Company (
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
END;

EXEC dbo.sp_CreateCompanyTable;
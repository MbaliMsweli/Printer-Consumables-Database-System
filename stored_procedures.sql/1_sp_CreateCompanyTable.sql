
CREATE OR ALTER PROCEDURE dbo.sp_CreateCompanyTable
AS
BEGIN
    SET NOCOUNT ON;

    
IF OBJECT_ID('SandavTonerDB.dbo.Company', 'U') IS NULL
BEGIN
    CREATE TABLE SandavTonerDB.dbo.Company (
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](150) NULL,
	[CompanyEmail] [varchar](150) NULL,
	[CompanyPhone] [varchar](50) NULL,
	[CompanyProvince] [varchar](100) NULL,
	[CompanyCity] [varchar](100) NULL,
	[CompanyCountry] [varchar](100) NULL,
	[CompanyYearsInBusiness] [int] NULL,
	[LoadDate] [datetime] NULL,
	[LastRunCheckDate] [datetime] NULL,
    )
END
END;

EXEC dbo.sp_CreateCompanyTable;
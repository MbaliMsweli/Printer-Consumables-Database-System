CREATE OR ALTER PROCEDURE dbo.sp_InsertintoCompanyTable AS BEGIN
SET
    NOCOUNT ON;

BEGIN 

INSERT INTO
  SandavTonerDB.[dbo].[Company] (
        CompanyName,
        CompanyEmail,
        CompanyPhone,
        CompanyProvince,
        CompanyCity,
        CompanyCountry,
        CompanyYearsInBusiness
    )
VALUES
    (
        'Sandav Toner Business',
        'info@sandav.co.za',
        '0111234567',
        'KwaZulu Natal',
        'Nongoma',
        'South Africa',
        5
    );

    END
END;

EXEC dbo.sp_InsertintoCompanyTable;
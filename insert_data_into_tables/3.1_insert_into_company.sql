INSERT INTO SandavTonerDB.dbo.Company (
    CompanyName,
    CompanyEmail,
    CompanyPhone,
    CompanyProvince,
    CompanyCity,
    CompanyCountry,
    CompanyYearsInBusiness
)
SELECT
    c.CompanyName,
    c.CompanyEmail,
    c.CompanyPhone,
    c.CompanyProvince,
    c.CompanyCity,
    c.CompanyCountry,
    c.CompanyYearsInBusiness
FROM (VALUES
    ('Sandav Toner Business',
     'info@sandav.co.za',
     '0111234567',
     'KwaZulu Natal',
     'Nongoma',
     'South Africa',
     5)
) AS c (
    CompanyName,
    CompanyEmail,
    CompanyPhone,
    CompanyProvince,
    CompanyCity,
    CompanyCountry,
    CompanyYearsInBusiness
)
WHERE NOT EXISTS (
    SELECT 1
    FROM SandavTonerDB.dbo.Company co
    WHERE co.CompanyEmail = c.CompanyEmail
);

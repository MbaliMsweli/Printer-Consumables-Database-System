CREATE OR ALTER PROCEDURE dbo.sp_InsertintoCompanyPriceTable AS 

BEGIN
SET
    NOCOUNT ON;
BEGIN
INSERT INTO SandavTonerDB.dbo.CompanyPrice (
    SupplierID,
    ProductID,
    CompanyProductPrice,
    CompanyMOQ,
    CompanyBulkDiscount
)
SELECT
    p.SupplierID,
    p.ProductID,
    p.CompanyProductPrice,
    p.CompanyMOQ,
    p.CompanyBulkDiscount
FROM (VALUES
    (1, 1, 520.00, 5, 490.00),
    (2, 2, 550.00, 5, 515.00),
    (3, 3, 190.00, 10, 165.00),
    (4, 4, 620.00, 5, 585.00),
    (5, 5, 210.00, 10, 185.00),
    (6, 6, 560.00, 5, 525.00),
    (7, 7, 540.00, 5, 505.00),
    (8, 8, 205.00, 10, 180.00),
    (9, 9, 690.00, 5, 645.00),
    (10,10,230.00, 10, 200.00)
) AS p (
    SupplierID,
    ProductID,
    CompanyProductPrice,
    CompanyMOQ,
    CompanyBulkDiscount
)
WHERE NOT EXISTS (
    SELECT 1
    FROM SandavTonerDB.dbo.CompanyPrice cp
    WHERE cp.SupplierID = p.SupplierID
      AND cp.ProductID = p.ProductID
);
END
END;

EXEC dbo.sp_InsertintoCompanyPriceTable;
CREATE OR ALTER PROCEDURE dbo.sp_InsertintoCompanyStockTable AS 

BEGIN
SET
    NOCOUNT ON;
BEGIN
INSERT INTO CompanyStock (
    SupplierID,
    ProductID,
    CompanyQuantityAvailable,
    CompanyLastDateUpdated
)
SELECT
    s.SupplierID,
    s.ProductID,
    s.CompanyQuantityAvailable,
    GETDATE()
FROM (VALUES
    (1, 1, 45),
    (2, 2, 38),
    (3, 3, 70),
    (4, 4, 30),
    (5, 5, 55),
    (6, 6, 40),
    (7, 7, 42),
    (8, 8, 65),
    (9, 9, 28),
    (10, 10, 60)
) AS s (
    SupplierID,
    ProductID,
    CompanyQuantityAvailable
)
WHERE NOT EXISTS (
    SELECT 1
    FROM CompanyStock cs
    WHERE cs.SupplierID = s.SupplierID
      AND cs.ProductID = s.ProductID
);
END
END;

EXEC dbo.sp_InsertintoCompanyStockTable;
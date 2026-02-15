CREATE OR ALTER PROCEDURE dbo.sp_InsertintoSupplierStockTable AS 

BEGIN
SET
    NOCOUNT ON;
BEGIN
INSERT INTO SupplierStock (
    SupplierID,
    ProductID,
    SupplierQuantityAvailable,
    SupplierLastDateUpdated
)
SELECT
    s.SupplierID,
    s.ProductID,
    s.SupplierQuantityAvailable,
    GETDATE()
FROM (VALUES
    (1, 1, 220),
    (2, 2, 180),
    (3, 3, 450),
    (4, 4, 150),
    (5, 5, 320),
    (6, 6, 200),
    (7, 7, 260),
    (8, 8, 390),
    (9, 9, 140),
    (10, 10, 410)
) AS s (
    SupplierID,
    ProductID,
    SupplierQuantityAvailable
)
WHERE NOT EXISTS (
    SELECT 1
    FROM SupplierStock ss
    WHERE ss.SupplierID = s.SupplierID
      AND ss.ProductID = s.ProductID
);

END
END;

EXEC dbo.sp_InsertintoSupplierStockTable;
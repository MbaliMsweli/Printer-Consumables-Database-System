
INSERT INTO SandavTonerDB.dbo.CustomerOrderItem (
    CustomerOrderID,
    ProductID,
    Quantity,
    Price
)
SELECT
    i.CustomerOrderID,
    i.ProductID,
    i.Quantity,
    i.Price
FROM (VALUES
    (1, 1, 1, 520),
    (2, 2, 1, 550),
    (3, 4, 2, 620),
    (4, 4, 1, 620),
    (5, 3, 2, 210),
    (6, 6, 2, 560),
    (7, 7, 1, 540),
    (8, 8, 2, 205),
    (9, 9, 2, 690),
    (10, 10, 1, 230)
) AS i (
    CustomerOrderID,
    ProductID,
    Quantity,
    Price
)
WHERE NOT EXISTS (
    SELECT 1
    FROM SandavTonerDB.dbo.CustomerOrderItem coi
    WHERE coi.CustomerOrderID = i.CustomerOrderID
      AND coi.ProductID = i.ProductID
);


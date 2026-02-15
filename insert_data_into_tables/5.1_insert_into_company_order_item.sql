INSERT INTO CompanyOrderItem (
    CompanyOrderID,
    ProductID,
    Quantity,
    Price
)
SELECT
    i.CompanyOrderID,
    i.ProductID,
    i.Quantity,
    i.Price
FROM (VALUES
    (1, 1, 10, 345),
    (2, 2, 10, 360),
    (3, 3, 20, 115),
    (4, 4, 10, 395),
    (5, 5, 20, 125),
    (6, 6, 10, 355),
    (7, 7, 10, 330),
    (8, 8, 20, 120),
    (9, 9, 10, 410),
    (10, 10, 20, 135)
) AS i (
    CompanyOrderID,
    ProductID,
    Quantity,
    Price
)
WHERE NOT EXISTS (
    SELECT 1
    FROM CompanyOrderItem coi
    WHERE coi.CompanyOrderID = i.CompanyOrderID
      AND coi.ProductID = i.ProductID
);

CREATE OR ALTER PROCEDURE dbo.sp_InsertintoCustomerOrderTable AS 

BEGIN
SET
    NOCOUNT ON;
BEGIN
INSERT INTO SandavTonerDB.dbo.CustomerOrder (
    CustomerID,
    CustomerOrderDate,
    CustomerTotalAmount,
    CustomerOrderStatus
)
SELECT
    o.CustomerID,
    o.CustomerOrderDate,
    o.CustomerTotalAmount,
    o.CustomerOrderStatus
FROM (VALUES
    (1, '2025-02-01', 520, 'Completed'),
    (2, '2025-02-02', 550, 'Completed'),
    (3, '2025-02-02', 1240, 'Pending'),
    (4, '2025-02-03', 620, 'Completed'),
    (5, '2025-02-04', 420, 'Completed'),
    (6, '2025-02-05', 1120, 'Pending'),
    (7, '2025-02-06', 540, 'Completed'),
    (8, '2025-02-07', 410, 'Completed'),
    (9, '2025-02-08', 1380, 'Pending'),
    (10, '2025-02-09', 230, 'Completed')
) AS o (
    CustomerID,
    CustomerOrderDate,
    CustomerTotalAmount,
    CustomerOrderStatus
)
WHERE NOT EXISTS (
    SELECT 1
    FROM SandavTonerDB.dbo.CustomerOrder co
    WHERE co.CustomerID = o.CustomerID
      AND co.CustomerOrderDate = o.CustomerOrderDate
);


END
END;

EXEC dbo.sp_InsertintoCustomerOrderTable;
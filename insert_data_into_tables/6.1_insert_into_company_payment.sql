INSERT INTO SandavTonerDB.dbo.CompanyPayment (
    CompanyOrderID,
    SupplierID,
    CompanyPaymentMethod,
    PaidAmount,
    PaymentDate,
    PaymentStatus,
    Reference
)
SELECT
    p.CompanyOrderID,
    p.SupplierID,
    p.CompanyPaymentMethod,
    p.PaidAmount,
    p.PaymentDate,
    p.PaymentStatus,
    p.Reference
FROM (VALUES
    (1,1,'EFT',3450,'2025-01-06','Paid','SAN-1001'),
    (2,2,'EFT',3600,'2025-01-09','Paid','SAN-1002'),
    (3,3,'Card',2300,'2025-01-11','Paid','SAN-1003'),
    (4,4,'EFT',3950,'2025-01-15','Paid','SAN-1004'),
    (5,5,'Cash',2500,'2025-01-19','Paid','SAN-1005'),
    (6,6,'EFT',3550,'2025-01-21','Pending','SAN-1006'),
    (7,7,'Card',3300,'2025-01-23','Paid','SAN-1007'),
    (8,8,'EFT',2400,'2025-01-26','Paid','SAN-1008'),
    (9,9,'Cash',4100,'2025-01-28','Pending','SAN-1009'),
    (10,10,'EFT',2700,'2025-01-30','Paid','SAN-1010')
) AS p (
    CompanyOrderID,
    SupplierID,
    CompanyPaymentMethod,
    PaidAmount,
    PaymentDate,
    PaymentStatus,
    Reference
)
WHERE NOT EXISTS (
    SELECT 1
    FROM SandavTonerDB.dbo.CompanyPayment cp
    WHERE cp.Reference = p.Reference
);

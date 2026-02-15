
CREATE OR ALTER PROCEDURE dbo.sp_CompanyPayment
AS
BEGIN
    SET NOCOUNT ON;

IF OBJECT_ID('CompanyPayment', 'U') IS NULL
BEGIN
    CREATE TABLE[SandavTonerDB].dbo.CompanyPayment (
        CompanyPaymentID INT IDENTITY(1,1) PRIMARY KEY,
        CompanyOrderID INT NOT NULL,
        SupplierID INT NOT NULL,
        CompanyPaymentMethod VARCHAR(50),
        PaidAmount DECIMAL(12,2),
        PaymentDate DATE,
        PaymentStatus VARCHAR(50),
        Reference VARCHAR(150)
    );
END
END;

EXEC dbo.sp_CompanyPayment;
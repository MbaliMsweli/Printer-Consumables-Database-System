USE [SandavTonerDB]

IF OBJECT_ID('CustomerOrder', 'U') IS NULL
BEGIN
    CREATE TABLE CustomerOrder (
        CustomerOrderID INT IDENTITY(1,1) PRIMARY KEY,
        CustomerID INT NOT NULL,
        CustomerOrderDate DATE,
        CustomerTotalAmount DECIMAL(12,2),
        CustomerOrderStatus VARCHAR(50)
    );
END

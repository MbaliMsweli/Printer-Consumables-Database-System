USE [SandavTonerDB]

IF OBJECT_ID('CustomerOrderItem', 'U') IS NULL
BEGIN
    CREATE TABLE CustomerOrderItem (
        CustomerOrderItemID INT IDENTITY(1,1),
        CustomerOrderID INT NOT NULL,
        ProductID INT NOT NULL,
        Quantity INT,
        Price DECIMAL(12,2)
    );
END
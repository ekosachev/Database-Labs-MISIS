DECLARE @OrderId INT = 71947;
DECLARE @ProductId INT = 760;
DECLARE @Quantity INT = 1;
DECLARE @UnitPrice DECIMAL(10, 2) = 782.99;

IF EXISTS(SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderId)
    INSERT INTO SalesLT.SalesOrderDetail
        (SalesOrderID, ProductID, OrderQty, UnitPrice) VALUES (@OrderId, @ProductId, @Quantity, @UnitPrice)
ELSE
    PRINT 'Заказ не существует'

DECLARE @OrderId INT = 0;
DECLARE @ProductId INT = 760;
DECLARE @Quantity INT = 1;
DECLARE @UnitPrice DECIMAL(10, 2) = 782.99;

IF EXISTS(SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderId)
    INSERT INTO SalesLT.SalesOrderDetail
        (SalesOrderID, ProductID, OrderQty, UnitPrice) VALUES (@OrderId, @ProductId, @Quantity, @UnitPrice)
ELSE
    PRINT N'Заказ не существует'
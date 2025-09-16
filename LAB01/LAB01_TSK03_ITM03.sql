UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71899;

SELECT
    SalesOrderID,
    CASE
        WHEN ShipDate IS NOT NULL
        THEN 'Shipped'
        ELSE 'Awaiting shipment'
    END as ShippingStatus
FROM SalesLT.SalesOrderHeader
SELECT 
    c.CustomerID,
    p.ProductID
FROM SalesLT.Customer c
FULL OUTER JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
FULL OUTER JOIN SalesLT.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
FULL OUTER JOIN SalesLT.Product p ON sod.ProductID = p.ProductID
WHERE soh.SalesOrderID IS NULL
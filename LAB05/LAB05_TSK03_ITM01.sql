SELECT
    p.Name,
    SUM(sod.LineTotal) as TotalRevenue
FROM SalesLT.Product as p
INNER JOIN SalesLT.SalesOrderDetail AS sod ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalRevenue DESC
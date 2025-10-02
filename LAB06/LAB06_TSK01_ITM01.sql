SELECT
    p.ProductID,
    p.Name,
    p.ListPrice
FROM SalesLT.Product AS p
JOIN (
    SELECT
        sod.ProductID as PID,
        AVG(sod.UnitPrice) as AveragePrice
    FROM SalesLT.SalesOrderDetail AS sod
    GROUP BY sod.ProductID
) AS SellPrice ON p.ProductID = SellPrice.PID
WHERE p.ListPrice > SellPrice.AveragePrice
ORDER BY p.ProductID
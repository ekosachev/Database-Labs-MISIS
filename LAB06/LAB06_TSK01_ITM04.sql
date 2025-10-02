SELECT
    p.ProductID,
    p.Name,
    p.StandardCost,
    p.ListPrice,
    SellPrice.AvgPrice
FROM SalesLT.Product AS p
JOIN (
    SELECT
        sod.ProductID as PID,
        AVG(sod.UnitPrice) as AvgPrice
    FROM SalesLT.SalesOrderDetail AS sod
    GROUP BY sod.ProductID
) AS SellPrice ON p.ProductID = SellPrice.PID
WHERE p.StandardCost > SellPrice.AvgPrice
ORDER BY p.ProductID
SELECT
    p.ProductID,
    p.Name,
    p.ListPrice
FROM SalesLT.Product AS p
JOIN (
    SELECT
        sod.ProductID as PID,
        MIN(sod.UnitPrice) as MinPrice
    FROM SalesLT.SalesOrderDetail AS sod
    GROUP BY sod.ProductID
) AS SellPrice ON p.ProductID = SellPrice.PID
WHERE 1 = 1
    AND p.ListPrice >= 100
    AND SellPrice.MinPrice < 100
ORDER BY p.ProductID
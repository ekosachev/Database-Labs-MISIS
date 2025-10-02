SELECT
    p.ProductID,
    UPPER(p.Name) as ProductName,
    ROUND(p.Weight, 0) as ApproxWeight,
    YEAR(p.SellStartDate) as SellStartYear,
    DATENAME(MONTH, p.SellStartDate) as SellStartMonth
FROM SalesLT.Product as p
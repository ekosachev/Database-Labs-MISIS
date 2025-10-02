SELECT
    p.ProductID,
    SUBSTRING(p.ProductNumber, 0, 3) as ProductType,
    UPPER(p.Name) as ProductName,
    ROUND(p.Weight, 0) as ApproxWeight,
    YEAR(p.SellStartDate) as SellStartYear,
    DATENAME(MONTH, p.SellStartDate) as SellStartMonth
FROM SalesLT.Product as p
WHERE ISNUMERIC(p.Size) = 1
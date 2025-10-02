SELECT
    ProductID,
    UPPER(Name) as ProductName,
    ROUND(Weight, 0) as ApproxWeight
FROM SalesLT.Product
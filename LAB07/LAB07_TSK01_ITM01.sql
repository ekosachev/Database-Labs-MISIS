SELECT
    p.ProductID,
    p.Name as ProductName,
    vpmcd.Name as ModelName,
    vpmcd.Summary
FROM SalesLT.Product AS p
JOIN SalesLT.vProductModelCatalogDescription AS vpmcd ON p.ProductModelID = vpmcd.ProductModelID
ORDER BY p.ProductID
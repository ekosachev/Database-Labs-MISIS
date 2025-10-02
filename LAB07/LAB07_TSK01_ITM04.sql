SELECT
    p.ProductID,
    p.Name as ProductName,
    ac.ParentProductCategoryName,
    ac.ProductCategoryName
FROM SalesLT.Product AS p
INNER JOIN dbo.ufnGetAllCategories() AS ac ON p.ProductCategoryID = ac.ProductCategoryID
ORDER BY ac.ParentProductCategoryName, ac.ProductCategoryName, p.Name
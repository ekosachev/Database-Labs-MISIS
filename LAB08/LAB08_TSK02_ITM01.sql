WITH SalesByCategory AS (
    SELECT
        c.CompanyName,
        pc2.Name AS ParentCategory,
        sod.LineTotal
    FROM SalesLT.Customer AS c
    INNER JOIN SalesLT.SalesOrderHeader AS soh
        ON c.CustomerID = soh.CustomerID
    INNER JOIN SalesLT.SalesOrderDetail AS sod
        ON soh.SalesOrderID = sod.SalesOrderID
    INNER JOIN SalesLT.Product AS p
        ON sod.ProductID = p.ProductID
    INNER JOIN SalesLT.ProductCategory AS pc
        ON p.ProductCategoryID = pc.ProductCategoryID
    INNER JOIN SalesLT.ProductCategory AS pc2
        ON pc.ParentProductCategoryID = pc2.ProductCategoryID
)
SELECT
    CompanyName,
    ISNULL([Accessories], 0) AS Accessories,
    ISNULL([Bikes], 0) AS Bikes,
    ISNULL([Clothing], 0) AS Clothing,
    ISNULL([Components], 0) AS Components
FROM SalesByCategory
PIVOT (
    SUM(LineTotal)
    FOR ParentCategory IN ([Accessories], [Bikes], [Clothing], [Components])
) AS p
ORDER BY CompanyName;

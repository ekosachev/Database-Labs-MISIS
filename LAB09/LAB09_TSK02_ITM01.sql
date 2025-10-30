UPDATE p
SET p.ListPrice = p.ListPrice * 1.1
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS pc
    ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Bells and Horns';

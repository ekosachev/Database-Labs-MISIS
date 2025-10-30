DECLARE @NewCategory TABLE (ProductCategoryId INT);
INSERT INTO SalesLT.ProductCategory
    (ParentProductCategoryID, Name)
    OUTPUT
        INSERTED.ProductCategoryID
    INTO @NewCategory
    VALUES
        (
         4,
         'Bells and Horns'
        )

DECLARE @NewCategoryId INT;
SELECT TOP (1) @NewCategoryId = ProductCategoryID FROM @NewCategory;

INSERT INTO SalesLT.Product
    (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
    VALUES
        (
         'Bicycle Bell',
         'BB-RING',
         2.47,
         4.99,
         @NewCategoryId,
         GETDATE()
        ),
        (
         'Bicycle Horn',
         'BB-PARP',
         1.29,
         3.75,
         @NewCategoryId,
         GETDATE()
        )

SELECT
    pc.ParentProductCategoryID,
    pc.ProductCategoryID,
    pc.Name,
    p.Name,
    p.ProductNumber,
    p.StandardCost,
    p.ListPrice,
    p.SellStartDate
FROM SalesLT.ProductCategory AS pc
LEFT JOIN SalesLT.Product AS p ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.ProductCategoryID = @NewCategoryId
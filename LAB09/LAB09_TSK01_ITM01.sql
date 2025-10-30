INSERT INTO SalesLT.Product
    (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
    VALUES (
    'LED Lights',
    'LT-L123',
    2.56,
    12.99,
    37,
    GETDATE()
    )

SELECT
    ProductID
FROM SalesLT.Product
WHERE ProductNumber = 'LT-L123'

SELECT
    *
FROM SalesLT.Product
WHERE ProductNumber = 'LT-L123'
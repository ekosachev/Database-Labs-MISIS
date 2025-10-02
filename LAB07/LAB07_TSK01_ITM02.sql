DECLARE @Colors TABLE (
    Name NVARCHAR(50)
                      );

INSERT INTO @Colors
SELECT DISTINCT
    Color as Name
FROM SalesLT.Product
WHERE Color IS NOT NULL

SELECT
    ProductID,
    Name as ProductName,
    Color
FROM SalesLT.Product
WHERE Color IN (SELECT * FROM @Colors)
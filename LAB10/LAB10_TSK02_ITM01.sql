DECLARE @BikeCategories TABLE (CategoryID INT)
DECLARE @AverageMarketPrice DECIMAL(10, 2) = 2000.00
DECLARE @MaximumMarketPrice DECIMAL(10, 2) = 5000.00
DECLARE @ActualAveragePrice DECIMAL(10, 2);
DECLARE @ActualMaximumPrice DECIMAL(10, 2);

INSERT INTO @BikeCategories
SELECT ProductCategoryID
FROM SalesLT.vGetAllCategories
WHERE ParentProductCategoryName = 'Bikes'

SET @ActualAveragePrice = (
    SELECT AVG(ListPrice)
    FROM SalesLT.Product
    WHERE ProductCategoryID IN (SELECT CategoryID FROM @BikeCategories)
    )

SET @ActualMaximumPrice = (
    SELECT MAX(ListPrice)
    FROM SalesLT.Product
    WHERE ProductCategoryID IN (SELECT CategoryID FROM @BikeCategories)
    )

IF @ActualAveragePrice < @AverageMarketPrice
WHILE @ActualMaximumPrice < @MaximumMarketPrice
BEGIN
    UPDATE SalesLT.Product
    SET ListPrice = ListPrice * 1.1
    WHERE ProductCategoryID IN (SELECT CategoryID FROM @BikeCategories)
    SET @ActualAveragePrice = (
            SELECT AVG(ListPrice)
            FROM SalesLT.Product
            WHERE ProductCategoryID IN (SELECT CategoryID FROM @BikeCategories)
        )
    SET @ActualMaximumPrice = (
            SELECT MAX(ListPrice)
            FROM SalesLT.Product
            WHERE ProductCategoryID IN (SELECT CategoryID FROM @BikeCategories)
        )
END
PRINT N'Новая средняя цена: ' + CONVERT(VARCHAR, @ActualAveragePrice)
PRINT N'Новая максимальная цена: ' + CONVERT(VARCHAR, @ActualMaximumPrice)
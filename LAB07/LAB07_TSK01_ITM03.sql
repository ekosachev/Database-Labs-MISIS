DROP TABLE #TempSizes

SELECT DISTINCT
    Size
INTO #TempSizes
FROM SalesLT.Product
WHERE Size IS NOT NULL

SELECT
    ProductID,
    Name as ProductName,
    Size
FROM SalesLT.Product
WHERE Size IN (SELECT * FROM #TempSizes)
ORDER BY Size DESC
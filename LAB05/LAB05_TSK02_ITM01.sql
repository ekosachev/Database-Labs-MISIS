SELECT
    c.CompanyName,
    soh.TotalDue AS Revenue,
    RANK() OVER (ORDER BY soh.TotalDue DESC) AS RankByRevenue
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.SalesOrderHeader AS soh ON soh.CustomerID = c.CustomerID
ORDER BY RankByRevenue
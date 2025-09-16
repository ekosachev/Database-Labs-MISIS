SELECT
    c.CompanyName,
    soh.SalesOrderID,
    soh.TotalDue
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
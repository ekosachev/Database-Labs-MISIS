SELECT
    c.CompanyName,
    c.FirstName,
    c.LastName,
    soh.SalesOrderID,
    soh.TotalDue
FROM SalesLT.Customer as c
LEFT JOIN SalesLT.SalesOrderHeader soh on c.CustomerID = soh.CustomerID
ORDER BY
    CASE
        WHEN soh.SalesOrderID IS NULL
        THEN 0
        ELSE 1
    END
    DESC
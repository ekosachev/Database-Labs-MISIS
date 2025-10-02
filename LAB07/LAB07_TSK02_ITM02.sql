WITH SalesData AS (
    SELECT
        soh.CustomerID,
        SUM(soh.TotalDue) AS Revenue
    FROM SalesLT.SalesOrderHeader AS soh
    GROUP BY soh.CustomerID
)
SELECT
    CONCAT(c.CompanyName, ' (', c.FirstName, ' ', c.LastName, ')') as CustomerCompanyName,
    sd.Revenue
FROM SalesLT.Customer AS c
INNER JOIN SalesData AS sd ON sd.CustomerID = c.CustomerID
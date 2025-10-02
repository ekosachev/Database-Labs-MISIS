SELECT
    CustomerInfo.CustomerCompanyName as CompanyContact,
    SalesData.Revenue
FROM (
    SELECT
        soh.CustomerID,
        SUM(soh.TotalDue) AS Revenue
    FROM SalesLT.SalesOrderHeader AS soh
    GROUP BY soh.CustomerID
     ) as SalesData
INNER JOIN (
    SELECT
        c.CustomerID as CustomerID,
        CONCAT(c.CompanyName, ' (', c.FirstName, ' ', c.LastName, ')') as CustomerCompanyName
    FROM SalesLT.Customer as c
) AS CustomerInfo on CustomerInfo.CustomerID = SalesData.CustomerID
ORDER BY CustomerInfo.CustomerCompanyName
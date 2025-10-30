SELECT
    CASE
        WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 0 THEN CONCAT(a.City, ' Subtotal')
        WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 1 THEN CONCAT(a.StateProvince, ' Subtotal')
        WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 3 THEN CONCAT(a.CountryRegion, ' Subtotal')
        WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 7 then 'Total'
    END AS Level,
    a.CountryRegion,
    a.StateProvince,
    a.City,
    SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
INNER JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
INNER JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
INNER JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP (a.CountryRegion, a.StateProvince, a.City)
ORDER BY a.CountryRegion, a.StateProvince, a.City;
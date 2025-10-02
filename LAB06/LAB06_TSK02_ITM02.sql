SELECT
    ci.CustomerID,
    ci.FirstName,
    ci.LastName,
    a.AddressLine1,
    a.City
FROM SalesLT.Address AS a
INNER JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = CA.AddressID
CROSS APPLY dbo.ufnGetCustomerInformation (ca.CustomerID) as ci
ORDER BY ci.CustomerID
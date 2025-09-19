SELECT
    c.CompanyName,
    a.AddressLine1,
    a.City,
    'Shipping' as AddressType
FROM SalesLT.Customer as c
INNER JOIN SalesLT.CustomerAddress ca on c.CustomerID = ca.CustomerID
INNER JOIN SalesLT.Address a on ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Shipping'
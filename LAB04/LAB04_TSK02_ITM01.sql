SELECT
    c.CompanyName
FROM SalesLT.Customer as c
INNER JOIN SalesLT.CustomerAddress ca on c.CustomerID = ca.CustomerID
INNER JOIN SalesLT.Address a on ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Main Office'
EXCEPT
SELECT
    c.CompanyName
FROM SalesLT.Customer as c
INNER JOIN SalesLT.CustomerAddress ca on c.CustomerID = ca.CustomerID
INNER JOIN SalesLT.Address a on ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Shipping'
ORDER BY CompanyName
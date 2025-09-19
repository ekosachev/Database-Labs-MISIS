SELECT DISTINCT
    c.CompanyName
FROM SalesLT.Customer c
INNER JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
AND c.CustomerID IN (
    SELECT ca1.CustomerID
    FROM SalesLT.CustomerAddress ca1
    WHERE ca1.AddressType = 'Main Office'
    INTERSECT
    SELECT ca2.CustomerID
    FROM SalesLT.CustomerAddress ca2
    WHERE ca2.AddressType = 'Shipping'
)
ORDER BY c.CompanyName;
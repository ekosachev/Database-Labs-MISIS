UPDATE SalesLT.Customer
SET EmailAddress = NULL
WHERE CustomerID % 7 = 1

SELECT
    CustomerID,
    CASE
        WHEN EmailAddress IS NOT NULL
        THEN EmailAddress
        ELSE Phone
    END as PrimaryContact

FROM SalesLT.Customer
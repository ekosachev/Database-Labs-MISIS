SELECT
    SalesPerson,
    COALESCE(Title + ' ', '') + LastName AS CustomerName,
    Phone
FROM SalesLT.Customer;
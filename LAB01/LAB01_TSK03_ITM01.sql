select
    CASE
        WHEN MiddleName IS NULL
        THEN CONCAT(FirstName, ' ', LastName)
        ELSE CONCAT(FirstName, ' ', MiddleName, ' ', LastName)
        END
    AS CustomerName
from SalesLT.Customer;
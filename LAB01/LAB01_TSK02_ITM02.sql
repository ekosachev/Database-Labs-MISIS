select
    CONCAT(SalesOrderNumber, ' (', RevisionNumber, ')') as OrderRevision,
    FORMAT(OrderDate, 'yyyy.MM.dd') as OrderDate
from SalesLT.SalesOrderHeader
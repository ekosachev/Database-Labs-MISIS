-- Удалите записи категории «Bells and Horns» и ее товаров. Вы должны убедиться, что вы удаляете записи из таблиц
-- в правильном порядке, чтобы избежать нарушения ограничений внешнего ключа (ссылайтесь на категорию товаров по имени).
DELETE p
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS pc ON pc.ProductCategoryID = p.ProductCategoryID
WHERE pc.Name = 'Bells and Horns'

DELETE FROM SalesLT.ProductCategory
WHERE Name = 'Bells and Horns'
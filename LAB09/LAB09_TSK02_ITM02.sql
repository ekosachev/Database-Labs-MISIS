-- Новый товар «LED Lights», который вы добавили первой задаче, должен заменить все предыдущие световые продукты.
-- Обновите таблицу SalesLT.Product, чтобы установить значение «сегодня» в поле DiscontinuedDate для всех товаров
-- в категории «Lights» (ссылайтесь через ProductCategoryID = 37), кроме товара «LED Lights», который вы добавили ранее
-- (ссылайтесь через ProductNumber «LT-L123»).
UPDATE p
SET p.DiscontinuedDate = GETDATE()
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS pc
    ON p.ProductCategoryID = pc.ProductCategoryID
WHERE 1 = 1
    AND pc.ProductCategoryID = 37
    AND p.ProductNumber != 'LT-L123'

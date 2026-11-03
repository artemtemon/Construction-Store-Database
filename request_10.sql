--Вывести заказы, содержащие товары, идентификаторы которых входят в заданный список

SELECT
    o.order_id,
    o.order_date,
    p.product_id,
    p.name AS product_name,
    od.quantity,
    p.price
FROM Заказы o
JOIN ДеталиЗаказа od ON o.order_id = od.order_id--Соединяем таблицу Заказы с таблицей ДеталиЗаказа по идентификатору заказа, чтобы получить детали заказов.
JOIN Товары p ON od.product_id = p.product_id--Соединяем таблицу ДеталиЗаказа с таблицей Товары по идентификатору товара, чтобы получить информацию о товарах.
WHERE p.product_id IN (1, 3, 5, 7)
ORDER BY o.order_date --сортируем по дате заказа
LIMIT 10;

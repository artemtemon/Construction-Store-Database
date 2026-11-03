--Найти заказы, в которых хотя бы один товар имеет цену,
-- превышающую среднюю цену по его категории

SELECT o.order_id,
       o.order_date,
       c.customer_id,
       c.name AS customer_name,
       p.product_id,
       p.name AS product_name,
       od.quantity,
       p.price AS product_price
FROM Заказы o
JOIN ДеталиЗаказа od ON o.order_id = od.order_id --Заказы (o) соединяется с ДеталиЗаказа (od) через order_id
JOIN Товары p ON od.product_id = p.product_id -- ДеталиЗаказа (od) соединяются с Товары (p) через product_id, чтобы получить информацию о товаре.
JOIN Клиенты c ON o.customer_id = c.customer_id -- Заказы (o) соединяется с Клиенты (c) через customer_id, чтобы получить информацию о заказчике.

WHERE p.price > ANY ( --Сравнивает цену товара p.price со всеми средними ценами из подзапроса
    SELECT AVG(p2.price) --Выбирает среднюю цену всех товаров из одной категории
    FROM Товары p2
    WHERE p2.category_id = p.category_id --подзапрос работает только для той категории, к которой принадлежит текущий товар p.
    GROUP BY p2.category_id --считает среднюю цену для каждой категории отдельно.
);                          --если p.price больше хотя бы одного среднего значения, то условие истинно.

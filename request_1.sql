--Вывести список клиентов, чья суммарная стоимость заказов превышает  2000
-- отсортировать по сумме заказов по убыванию и вернуть первые 10 строк.

SELECT
    c.customer_id,
    c.name AS customer_name,
    SUM(o.total_amount) AS total_spent --рассчитываем суммарную стоимость всех заказов каждого клиента.
FROM Клиенты c
JOIN Заказы o ON c.customer_id = o.customer_id --Используем JOIN, чтобы соединить таблицы Клиенты и Заказы по customer_id
GROUP BY c.customer_id --Группируем результаты по customer_id
HAVING SUM(o.total_amount) > 2000 --фильтрация сгруппированных данных.
ORDER BY total_spent DESC --Упорядочиваем результаты по убыванию суммы заказов
LIMIT 10; --Возвращаем только 10 первых записей.

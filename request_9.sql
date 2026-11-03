--Вывести список заказов с дополнительной колонкой,
-- показывающей скользящее среднее суммы заказов за последние три заказа

SELECT
    o.order_id,
    o.order_date,
    o.total_amount,
    ROUND(AVG(o.total_amount) OVER (ORDER BY o.order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg--сортируем заказы по дате, чтобы правильно вычислить среднее для последних заказов.
FROM Заказы o                                                                                              --
ORDER BY o.order_date;--Сортировка по дате заказа

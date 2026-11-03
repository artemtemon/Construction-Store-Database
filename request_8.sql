--С помощью самосоединения таблицы Заказы
--  вывести пары заказов одного и того же клиента,
-- где сумма одного заказа больше суммы другого,
--  чтобы сравнить их между собой.


SELECT
    o1.order_id AS order_id_1,
    o1.total_amount AS order_amount_1,
    o2.order_id AS order_id_2,
    o2.total_amount AS order_amount_2,
    o1.customer_id
FROM Заказы o1
JOIN Заказы o2 ON o1.customer_id = o2.customer_id AND o1.order_id != o2.order_id --Условие o1.customer_id = o2.customer_id гарантирует, что заказы принадлежат одному и тому же клиенту. Условие o1.order_id != o2.order_id исключает сравнение заказа с самим собой, так как один и тот же заказ не должен быть сравниван сам с собой.
WHERE o1.total_amount > o2.total_amount --выводим только те пары заказов, где сумма первого заказа (o1.total_amount) больше суммы второго заказа (o2.total_amount).
ORDER BY o1.customer_id, o1.order_id;--сортируем результат по customer_id, чтобы все заказы одного клиента шли подряд.

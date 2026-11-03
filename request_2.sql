--Для каждого клиента подсчитать количество заказов и общую сумму,
-- затем выбрать только тех, у кого сумма заказов больше 1000,
-- и отсортировать результат по сумме заказов

SELECT
    c.customer_id,
    c.name AS customer_name,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS total_spent
FROM Клиенты c
JOIN Заказы o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(o.total_amount) > 1000
ORDER BY total_spent DESC;

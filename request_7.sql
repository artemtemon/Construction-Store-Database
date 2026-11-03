--Для каждого сотрудника вычислить общую сумму заказов, которые они обработали,
-- и вернуть только тех, у кого общая сумма больше 1500,
-- отсортировав результат по убыванию.

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    SUM(o.total_amount) AS total_sales
FROM Сотрудники e
JOIN Заказы o ON e.employee_id = o.employee_id
GROUP BY e.employee_id
HAVING SUM(o.total_amount) > 1500
ORDER BY total_sales DESC;

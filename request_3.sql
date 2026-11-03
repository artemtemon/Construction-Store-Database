--Вывести список товаров с их текущей ценой,
-- выбирая из таблицы Товары_История только те записи,
-- где valid_to IS NULL,
-- и объединить с таблицей Товары через INNER JOIN

SELECT
    p.product_id,
    p.name AS product_name,
    ph.price AS current_price
FROM Товары p
JOIN Товары_История ph ON p.product_id = ph.product_id--Используем JOIN, чтобы соединить таблицы Товары и Товары_История product_id
WHERE ph.valid_to IS NULL;

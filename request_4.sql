--Описание: Вывести поставщиков,
-- у которых есть товары из определённой категории («Крепеж»)


SELECT DISTINCT s.supplier_id, --гарантирует, что поставщики не будут повторяться, если у них несколько товаров в категории.
       s.supplier_name,
       s.contact_info
FROM Поставщики s
LEFT JOIN Товары p ON s.supplier_id = p.supplier_id --объединяет все строки из таблицы Поставщики с совпадающими строками из таблицы Товары (по полю supplier_id).
WHERE p.category_id IN (SELECT category_id FROM Категории WHERE category_name = 'Крепеж');--Условие WHERE фильтрует только те строки, где товар принадлежит категории «Крепеж».
--Подзапрос (SELECT category_id FROM Категории WHERE category_name = 'Крепеж') находит идентификатор категории с именем «Крепеж».

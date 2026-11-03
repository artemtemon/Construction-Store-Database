
DROP TABLE IF EXISTS Клиенты CASCADE;




CREATE TABLE Клиенты (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255)
);
INSERT INTO Клиенты (name, email, address) VALUES
('Иван Иванов', 'ivanov@example.com', 'ул. Ленина, 1'),
('Петр Петров', 'petrov@example.com', 'ул. Гагарина, 5'),
('Сергей Сергеев', 'sergeev@example.com', 'ул. Мира, 10'),
('Александр Александров', 'alexandr@example.com', 'ул. Советская, 3'),
('Дмитрий Дмитриев', 'dmitriev@example.com', 'ул. Победы, 7'),
('Михаил Михайлов', 'mihailov@example.com', 'ул. Кирова, 12'),
('Николай Николаев', 'nikolaev@example.com', 'ул. Первомайская, 4'),
('Владимир Владимиров', 'vladimir@example.com', 'ул. Октябрьская, 9'),
('Анатолий Анатольев', 'anatoliev@example.com', 'ул. Комсомольская, 6'),
('Евгений Евгеньев', 'evgenev@example.com', 'ул. Свердлова, 8'),
('Константин Константинов', 'konstantinov@example.com', 'ул. Лермонтова, 11'),
('Роман Романов', 'romanov@example.com', 'ул. Чехова, 15'),
('Андрей Андреев', 'andreev@example.com', 'ул. Толстого, 2'),
('Василий Васильев', 'vasilev@example.com', 'ул. Чехова, 13'),
('Олег Олегов', 'olegov@example.com', 'ул. Фрунзе, 14');


CREATE TABLE Поставщики (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(255)
);
INSERT INTO Поставщики (supplier_name, contact_info) VALUES
('Поставщик 1', 'contact1@example.com'),
('Поставщик 2', 'contact2@example.com'),
('Поставщик 3', 'contact3@example.com'),
('Поставщик 4', 'contact4@example.com'),
('Поставщик 5', 'contact5@example.com'),
('Поставщик 6', 'contact6@example.com'),
('Поставщик 7', 'contact7@example.com'),
('Поставщик 8', 'contact8@example.com'),
('Поставщик 9', 'contact9@example.com'),
('Поставщик 10', 'contact10@example.com'),
('Поставщик 11', 'contact11@example.com'),
('Поставщик 12', 'contact12@example.com'),
('Поставщик 13', 'contact13@example.com'),
('Поставщик 14', 'contact14@example.com'),
('Поставщик 15', 'contact15@example.com');


CREATE TABLE Категории (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL
);
INSERT INTO Категории (category_name) VALUES
('Строительные материалы'),
('Инструменты'),
('Крепеж'),
('Отделочные материалы'),
('Изоляция'),
('Электрика'),
('Сантехника'),
('Краски'),
('Лаки'),
('Обои'),
('Декор'),
('Садовая техника'),
('Оборудование'),
('Мебель'),
('Прочее');


CREATE TABLE Склады (
  warehouse_id SERIAL PRIMARY KEY,
  location VARCHAR(255) NOT NULL,
  capacity INT NOT NULL
);
INSERT INTO Склады (location, capacity) VALUES
('Склад 1, Москва', 1000),
('Склад 2, Санкт-Петербург', 800),
('Склад 3, Новосибирск', 600),
('Склад 4, Екатеринбург', 700),
('Склад 5, Казань', 900),
('Склад 6, Нижний Новгород', 500),
('Склад 7, Челябинск', 650),
('Склад 8, Омск', 550),
('Склад 9, Самара', 750),
('Склад 10, Ростов-на-Дону', 850),
('Склад 11, Уфа', 950),
('Склад 12, Красноярск', 600),
('Склад 13, Воронеж', 700),
('Склад 14, Пермь', 650),
('Склад 15, Волгоград', 800);

CREATE TABLE Сотрудники (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  position VARCHAR(50),
  salary DECIMAL(10,2)
);
INSERT INTO Сотрудники (first_name, last_name, position, salary) VALUES
('Иван', 'Смирнов', 'Менеджер', 50000.00),
('Петр', 'Иванов', 'Продавец', 40000.00),
('Сергей', 'Петров', 'Кассир', 35000.00),
('Алексей', 'Сидоров', 'Менеджер', 52000.00),
('Дмитрий', 'Кузнецов', 'Продавец', 42000.00),
('Михаил', 'Попов', 'Кассир', 36000.00),
('Николай', 'Соколов', 'Менеджер', 51000.00),
('Владимир', 'Лебедев', 'Продавец', 43000.00),
('Анатолий', 'Козлов', 'Кассир', 37000.00),
('Евгений', 'Новиков', 'Менеджер', 54000.00),
('Константин', 'Морозов', 'Продавец', 41000.00),
('Роман', 'Волков', 'Кассир', 35000.00),
('Андрей', 'Андреев', 'Менеджер', 53000.00),
('Василий', 'Захаров', 'Продавец', 42000.00),
('Олег', 'Сергеев', 'Кассир', 36000.00);


CREATE TABLE Товары (
  product_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category_id INT NOT NULL,
  supplier_id INT NOT NULL,
  warehouse_id INT NOT NULL,
  CONSTRAINT fk_Товары_Категории FOREIGN KEY (category_id) REFERENCES Категории(category_id),
  CONSTRAINT fk_Товары_Поставщики FOREIGN KEY (supplier_id) REFERENCES Поставщики(supplier_id),
  CONSTRAINT fk_Товары_Склады FOREIGN KEY (warehouse_id) REFERENCES Склады(warehouse_id)
);
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
 -- Категория 1: Строительные материалы
('Цемент М400', 300.00, 1, 1, 1),
('Песок речной', 150.00, 1, 1, 1),
('Щебень гранитный', 200.00, 1, 1, 1);

-- Категория 2: Инструменты
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Перфоратор', 350.00, 2, 2, 2),
('Дрель аккумуляторная', 220.00, 2, 2, 2),
('Ленточная пила', 400.00, 2, 2, 2);

-- Категория 3: Крепеж
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Саморезы строительные', 120.00, 3, 3, 3),
('Гвозди строительные', 80.00, 3, 3, 3),
('Анкеры', 150.00, 3, 3, 3);

-- Категория 4: Отделочные материалы
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Плитка керамическая', 600.00, 4, 4, 4),
('Мозаика декоративная', 650.00, 4, 4, 4),
('Облицовочный кирпич', 700.00, 4, 4, 4);

-- Категория 5: Изоляция
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Минеральная вата', 450.00, 5, 5, 5),
('Пенопласт утеплитель', 300.00, 5, 5, 5),
('Эко-пена', 320.00, 5, 5, 5);

-- Категория 6: Электрика
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Кабель силовой', 550.00, 6, 6, 6),
('Розетка настенная', 120.00, 6, 6, 6),
('Выключатель электрический', 130.00, 6, 6, 6);

-- Категория 7: Сантехника
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Унитаз подвесной', 700.00, 7, 7, 7),
('Раковина смесительная', 710.00, 7, 7, 7),
('Смеситель для ванной', 720.00, 7, 7, 7);

-- Категория 8: Краски
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Эмаль декоративная', 300.00, 8, 8, 8),
('Латексная краска', 310.00, 8, 8, 8),
('Акриловая краска', 320.00, 8, 8, 8);

-- Категория 9: Лаки
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Масляный лак', 320.00, 9, 9, 9),
('Акриловый лак', 330.00, 9, 9, 9),
('Полимерный лак', 340.00, 9, 9, 9);

-- Категория 10: Обои
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Виниловые обои', 280.00, 10, 10, 10),
('Флизелиновые обои', 290.00, 10, 10, 10),
('Бумажные обои', 300.00, 10, 10, 10);

-- Категория 11: Декор
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Настенное панно', 400.00, 11, 11, 11),
('Картина декоративная', 410.00, 11, 11, 11),
('Зеркало в раме', 420.00, 11, 11, 11);

-- Категория 12: Садовая техника
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Газонокосилка', 800.00, 12, 12, 12),
('Триммер', 850.00, 12, 12, 12),
('Опрыскиватель', 900.00, 12, 12, 12);

-- Категория 13: Оборудование
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Грузовой лифт', 1500.00, 13, 13, 13),
('Конвейер', 1600.00, 13, 13, 13),
('Электрогенератор', 1700.00, 13, 13, 13);

-- Категория 14: Мебель
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Стол рабочий', 500.00, 14, 14, 14),
('Стул офисный', 250.00, 14, 14, 14),
('Шкаф складской', 800.00, 14, 14, 14);

-- Категория 15: Прочее
INSERT INTO Товары (name, price, category_id, supplier_id, warehouse_id) VALUES
('Светильник уличный', 350.00, 15, 15, 15),
('Сейф строительный', 1200.00, 15, 15, 15),
('Кабинет охраны', 1300.00, 15, 15, 15);

DROP TABLE IF EXISTS Заказы CASCADE;

CREATE TABLE Заказы (
  order_id SERIAL PRIMARY KEY,
  order_date TIMESTAMP NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  customer_id INT NOT NULL,
  employee_id INT NOT NULL,
  CONSTRAINT fk_Заказы_Клиенты FOREIGN KEY (customer_id) REFERENCES Клиенты(customer_id),
  CONSTRAINT fk_Заказы_Сотрудники FOREIGN KEY (employee_id) REFERENCES Сотрудники(employee_id)
);
INSERT INTO Заказы (order_date, total_amount, customer_id, employee_id) VALUES
('2025-04-01 10:00:00', 1200.00, 1, 1),
('2025-04-02 11:00:00', 1500.00, 2, 2),
('2025-04-03 12:00:00', 1100.00, 3, 3),
('2025-04-04 13:00:00', 1300.00, 4, 4),
('2025-04-05 14:00:00', 1400.00, 5, 5),
('2025-04-06 15:00:00', 1250.00, 6, 6),
('2025-04-07 16:00:00', 1350.00, 7, 7),
('2025-04-08 17:00:00', 1450.00, 8, 8),
('2025-04-09 18:00:00', 1550.00, 9, 9),
('2025-04-10 19:00:00', 1650.00, 10, 10),
('2025-04-11 20:00:00', 1750.00, 11, 11),
('2025-04-12 21:00:00', 1850.00, 12, 12),
('2025-04-13 22:00:00', 1950.00, 13, 13),
('2025-04-14 23:00:00', 2050.00, 14, 14),
('2025-04-15 09:00:00', 2150.00, 15, 15);

CREATE TABLE Товары_История(
  history_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  valid_from TIMESTAMP NOT NULL,
  valid_to TIMESTAMP DEFAULT NULL,
  product_id INT NOT NULL,
  CONSTRAINT fk_Товары_История_Товары FOREIGN KEY (product_id) REFERENCES Товары(product_id)
);
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
-- Категория 1: Строительные материалы
-- product_id = 1: 'Цемент М400'
('Цемент М400', 300.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 1),
('Цемент М400', 310.00, '2025-04-01 00:00:00', NULL, 1);

-- product_id = 2: 'Песок речной'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Песок речной', 150.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 2),
('Песок речной', 155.00, '2025-04-01 00:00:00', NULL, 2);

-- product_id = 3: 'Щебень гранитный'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Щебень гранитный', 200.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 3),
('Щебень гранитный', 210.00, '2025-04-01 00:00:00', NULL, 3);

-- Категория 2: Инструменты
-- product_id = 4: 'Перфоратор'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Перфоратор', 350.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 4),
('Перфоратор', 360.00, '2025-04-01 00:00:00', NULL, 4);

-- product_id = 5: 'Дрель аккумуляторная'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Дрель аккумуляторная', 220.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 5),
('Дрель аккумуляторная', 225.00, '2025-04-01 00:00:00', NULL, 5);

-- product_id = 6: 'Ленточная пила'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Ленточная пила', 400.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 6),
('Ленточная пила', 410.00, '2025-04-01 00:00:00', NULL, 6);

-- Категория 3: Крепеж
-- product_id = 7: 'Саморезы строительные'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Саморезы строительные', 120.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 7),
('Саморезы строительные', 125.00, '2025-04-01 00:00:00', NULL, 7);

-- product_id = 8: 'Гвозди строительные'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Гвозди строительные', 80.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 8),
('Гвозди строительные', 85.00, '2025-04-01 00:00:00', NULL, 8);

-- product_id = 9: 'Анкеры'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Анкеры', 150.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 9),
('Анкеры', 155.00, '2025-04-01 00:00:00', NULL, 9);

-- Категория 4: Отделочные материалы
-- product_id = 10: 'Плитка керамическая'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Плитка керамическая', 600.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 10),
('Плитка керамическая', 610.00, '2025-04-01 00:00:00', NULL, 10);

-- product_id = 11: 'Мозаика декоративная'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Мозаика декоративная', 650.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 11),
('Мозаика декоративная', 660.00, '2025-04-01 00:00:00', NULL, 11);

-- product_id = 12: 'Облицовочный кирпич'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Облицовочный кирпич', 700.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 12),
('Облицовочный кирпич', 710.00, '2025-04-01 00:00:00', NULL, 12);

-- Категория 5: Изоляция
-- product_id = 13: 'Минеральная вата'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Минеральная вата', 450.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 13),
('Минеральная вата', 455.00, '2025-04-01 00:00:00', NULL, 13);

-- product_id = 14: 'Пенопласт утеплитель'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Пенопласт утеплитель', 300.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 14),
('Пенопласт утеплитель', 310.00, '2025-04-01 00:00:00', NULL, 14);

-- product_id = 15: 'Эко-пена'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Эко-пена', 320.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 15),
('Эко-пена', 330.00, '2025-04-01 00:00:00', NULL, 15);

-- Категория 6: Электрика
-- product_id = 16: 'Кабель силовой'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Кабель силовой', 550.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 16),
('Кабель силовой', 560.00, '2025-04-01 00:00:00', NULL, 16);

-- product_id = 17: 'Розетка настенная'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Розетка настенная', 120.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 17),
('Розетка настенная', 125.00, '2025-04-01 00:00:00', NULL, 17);

-- product_id = 18: 'Выключатель электрический'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Выключатель электрический', 130.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 18),
('Выключатель электрический', 135.00, '2025-04-01 00:00:00', NULL, 18);

-- Категория 7: Сантехника
-- product_id = 19: 'Унитаз подвесной'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Унитаз подвесной', 700.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 19),
('Унитаз подвесной', 710.00, '2025-04-01 00:00:00', NULL, 19);

-- product_id = 20: 'Раковина смесительная'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Раковина смесительная', 710.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 20),
('Раковина смесительная', 720.00, '2025-04-01 00:00:00', NULL, 20);

-- product_id = 21: 'Смеситель для ванной'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Смеситель для ванной', 720.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 21),
('Смеситель для ванной', 730.00, '2025-04-01 00:00:00', NULL, 21);

-- Категория 8: Краски
-- product_id = 22: 'Эмаль декоративная'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Эмаль декоративная', 300.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 22),
('Эмаль декоративная', 310.00, '2025-04-01 00:00:00', NULL, 22);

-- product_id = 23: 'Латексная краска'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Латексная краска', 310.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 23),
('Латексная краска', 315.00, '2025-04-01 00:00:00', NULL, 23);

-- product_id = 24: 'Акриловая краска'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Акриловая краска', 320.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 24),
('Акриловая краска', 325.00, '2025-04-01 00:00:00', NULL, 24);

-- Категория 9: Лаки
-- product_id = 25: 'Масляный лак'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Масляный лак', 320.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 25),
('Масляный лак', 325.00, '2025-04-01 00:00:00', NULL, 25);

-- product_id = 26: 'Акриловый лак'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Акриловый лак', 330.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 26),
('Акриловый лак', 335.00, '2025-04-01 00:00:00', NULL, 26);

-- product_id = 27: 'Полимерный лак'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Полимерный лак', 340.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 27),
('Полимерный лак', 345.00, '2025-04-01 00:00:00', NULL, 27);

-- Категория 10: Обои
-- product_id = 28: 'Виниловые обои'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Виниловые обои', 280.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 28),
('Виниловые обои', 285.00, '2025-04-01 00:00:00', NULL, 28);

-- product_id = 29: 'Флизелиновые обои'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Флизелиновые обои', 290.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 29),
('Флизелиновые обои', 295.00, '2025-04-01 00:00:00', NULL, 29);

-- product_id = 30: 'Бумажные обои'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Бумажные обои', 300.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 30),
('Бумажные обои', 305.00, '2025-04-01 00:00:00', NULL, 30);

-- Категория 11: Декор
-- product_id = 31: 'Настенное панно'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Настенное панно', 400.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 31),
('Настенное панно', 410.00, '2025-04-01 00:00:00', NULL, 31);

-- product_id = 32: 'Картина декоративная'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Картина декоративная', 410.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 32),
('Картина декоративная', 420.00, '2025-04-01 00:00:00', NULL, 32);

-- product_id = 33: 'Зеркало в раме'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Зеркало в раме', 420.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 33),
('Зеркало в раме', 430.00, '2025-04-01 00:00:00', NULL, 33);

-- Категория 12: Садовая техника
-- product_id = 34: 'Газонокосилка'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Газонокосилка', 800.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 34),
('Газонокосилка', 810.00, '2025-04-01 00:00:00', NULL, 34);

-- product_id = 35: 'Триммер'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Триммер', 850.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 35),
('Триммер', 860.00, '2025-04-01 00:00:00', NULL, 35);

-- product_id = 36: 'Опрыскиватель'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Опрыскиватель', 900.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 36),
('Опрыскиватель', 910.00, '2025-04-01 00:00:00', NULL, 36);

-- Категория 13: Оборудование
-- product_id = 37: 'Грузовой лифт'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Грузовой лифт', 1500.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 37),
('Грузовой лифт', 1510.00, '2025-04-01 00:00:00', NULL, 37);

-- product_id = 38: 'Конвейер'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Конвейер', 1600.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 38),
('Конвейер', 1610.00, '2025-04-01 00:00:00', NULL, 38);

-- product_id = 39: 'Электрогенератор'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Электрогенератор', 1700.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 39),
('Электрогенератор', 1710.00, '2025-04-01 00:00:00', NULL, 39);

-- Категория 14: Мебель
-- product_id = 40: 'Стол рабочий'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Стол рабочий', 500.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 40),
('Стол рабочий', 510.00, '2025-04-01 00:00:00', NULL, 40);

-- product_id = 41: 'Стул офисный'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Стул офисный', 250.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 41),
('Стул офисный', 260.00, '2025-04-01 00:00:00', NULL, 41);

-- product_id = 42: 'Шкаф складской'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Шкаф складской', 800.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 42),
('Шкаф складской', 810.00, '2025-04-01 00:00:00', NULL, 42);

-- Категория 15: Прочее
-- product_id = 43: 'Светильник уличный'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Светильник уличный', 350.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 43),
('Светильник уличный', 360.00, '2025-04-01 00:00:00', NULL, 43);

-- product_id = 44: 'Сейф строительный'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Сейф строительный', 1200.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 44),
('Сейф строительный', 1210.00, '2025-04-01 00:00:00', NULL, 44);

-- product_id = 45: 'Кабинет охраны'
INSERT INTO Товары_История (name, price, valid_from, valid_to, product_id) VALUES
('Кабинет охраны', 1300.00, '2025-03-01 00:00:00', '2025-03-31 23:59:59', 45),
('Кабинет охраны', 1310.00, '2025-04-01 00:00:00', NULL, 45);



CREATE TABLE ДеталиЗаказа (
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (order_id, product_id),
  CONSTRAINT fk_order_items_Заказы FOREIGN KEY (order_id) REFERENCES Заказы(order_id),
  CONSTRAINT fk_order_items_Товары FOREIGN KEY (product_id) REFERENCES Товары(product_id)
);
INSERT INTO ДеталиЗаказа (order_id, product_id, quantity) VALUES
(1, 1, 10),
(1, 2, 5),
(2, 3, 8),
(2, 4, 12),
(3, 5, 7),
(3, 6, 4),
(4, 7, 9),
(4, 8, 3),
(5, 9, 6),
(5, 10, 11),
(6, 11, 2),
(6, 12, 5),
(7, 13, 4),
(7, 14, 7),
(8, 15, 8),
(8, 16, 6),
(9, 17, 10),
(9, 18, 7),
(10, 19, 5),
(10, 20, 8),
(11, 21, 6),
(11, 22, 4),
(12, 23, 9),
(12, 24, 7),
(13, 25, 3),
(13, 26, 6),
(14, 27, 8),
(14, 28, 5),
(15, 29, 7),
(15, 30, 4);


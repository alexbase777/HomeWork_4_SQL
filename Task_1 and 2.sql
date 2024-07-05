-- CREATE DATABASE COMPANY_VASILEV;

CREATE TABLE SALESPEOPLE -- Продавцы
(
	SNUM SERIAL, -- Уникальный идентификатор
	SNAME TEXT NOT NULL, -- Имя продавца
	CITY TEXT NOT NULL, -- Город продавца
	COMM NUMERIC(1,2) NOT NULL, -- комиссионные продавца в десятичной форме
	PRIMARY KEY(SNUM)
);

ALTER TABLE SALESPEOPLE -- Удаляем столбец из таблицы с неправильным типом данных (невозможно занести в столбец, например число 0.13)
DROP COLUMN COMM;

ALTER TABLE SALESPEOPLE -- Добавляем столбец в таблицу с правильным типом данных
ADD COMM REAL;

CREATE TABLE CUSTOMERS -- Заказчики
(
	CNUM SERIAL,
	CNAME TEXT NOT NULL,
	CITY TEXT NOT NULL,
	RAITING INTEGER, -- Уровень предпочтения данного заказчика перед другими
	SNUM INTEGER, -- Номер продавца, назначенного этому заказчику
	PRIMARY KEY(CNUM),
	FOREIGN KEY(SNUM) REFERENCES SALESPEOPLE(SNUM)
);

CREATE TABLE ORDERS -- Заказы
(
	ONUM SERIAL,
	AMT DECIMAL, -- Значение суммы приобретений
	ODATE DATE NOT NULL, -- Дата приобретения
	CNUM INTEGER,
	SNUM INTEGER,
	PRIMARY KEY(ONUM),
	FOREIGN KEY(CNUM) REFERENCES CUSTOMERS(CNUM),
	FOREIGN KEY(SNUM) REFERENCES SALESPEOPLE(SNUM)
);

INSERT INTO SALESPEOPLE (SNAME, CITY, COMM) -- Заполение таблицы с продавцами
VALUES
('Serres', 'San Jose', '0.13'),
('Rifkun', 'Barselona', '0.15'),
('Peel', 'London', '0.12'),
('Motika', 'London', '0.11'),
('Axelrod', 'New York', '0.1');

INSERT INTO CUSTOMERS(CNAME, CITY, RAITING, SNUM) -- Заполнение таблицы с покупателями
VALUES
('Hoffman', 'London', '100', '3'),
('Giovanni', 'Rome', '200', '5'),
('Liu', 'San Jose', '200', '1'),
('Grass', 'Berlin', '300', '1'),
('Clamens','London','100','3'),
('Pereira', 'Rome', '100', '4'),
('Cisneros', 'San Jose', '300', '2');

INSERT INTO ORDERS (AMT, ODATE, CNUM, SNUM) -- Заполнение таблицы заказов
VALUES
('18.69', '2015-03-10', '7', '2'),
('75.75', '2015-04-10','4','1'),
('767.19','2015-03-10','1','3'),
('1098.16','2015-03-10','7','2'),
('1309.95','2015-06-10','4','1'),
('1713.23','2015-04-10','2','5'),
('1900.1','2015-03-10','6','4'),
('4723','2015-05-10','5','3'),
('5160.45','2015-03-10','3','1'),
('9891.88','2015-06-10','5','3');

SELECT ONUM, AMT, ODATE FROM ORDERS; -- 1. Номер заказа, сумма и дата для всех строк таблицы Заказы

SELECT * FROM CUSTOMERS WHERE SNUM=3; -- 2. Строки из таблицы Заказчиков, для которых номер продавца равен 3

SELECT CNAME, CITY FROM CUSTOMERS WHERE RAITING >= '200'; -- 3. Строки cname и city в таблице заказчиков, если их рейтинг больше или равен 200

SELECT ONUM, ODATE FROM ORDERS ORDER BY ODATE; -- 4. Столбцы onum и odate из таблицы заказов от самого первого по дате до последнего

SELECT CNAME FROM CUSTOMERS WHERE CITY = 'London' ORDER BY CNAME; -- 5. Столбец с именами заказчика, отсортированными в алфавитном порядке, только если город заказчика - London

SELECT RAITING, CNAME FROM CUSTOMERS WHERE CITY = 'San Jose'; -- 6. Оценка (rating), сопровождаемую именем каждого заказчика в San Jose

SELECT DISTINCT SNUM FROM ORDERS; -- 7. Значения snum всех продавцов из таблицы Заказов без каких бы то ни было повторений

SELECT SNAME, CITY FROM SALESPEOPLE WHERE CITY = 'London' AND COMM > '0.1'; -- 8. sname и city для всех продавцов в Лондоне с комиссионными выше 0.1

SELECT * FROM CUSTOMERS WHERE RAITING < '100' AND CITY <> 'Rome'; -- 9. Заказчики с рейтингом не более 100, если они не находятся в Риме

SELECT * FROM ORDERS WHERE ODATE = '2015-03-10' OR ODATE = '2015-04-10'; -- 10.1 Первый запрос на вывод всех заказов за 3 или 4 Октября 2015

SELECT * FROM ORDERS WHERE ODATE IN ('2015-03-10', '2015-04-10'); -- 10.2 Второй запрос на вывод всех заказов за 3 или 4 Октября 2015

SELECT * FROM ORDERS WHERE ODATE BETWEEN '2015-03-10' AND '2015-04-10'; -- 10.3 Третий запрос на вывод всех заказов за 3 или 4 Октября 2015

SELECT DISTINCT RAITING FROM CUSTOMERS; -- 11. Все рейтинги из таблицы заказчиков без повторений

SELECT DISTINCT ODATE FROM ORDERS; -- 12. Все даты, в которые были выполнены заказы без повторений

SELECT * FROM CUSTOMERS WHERE CITY IN ('London', 'Rome', 'Berlin'); -- 13. Все заказчики из города London, Rome и Berlin (используя оператор IN)

SELECT * FROM ORDERS WHERE AMT BETWEEN '1000' AND '5000'; -- 14. Все заказы у которых amt находится в диапазоне от 1000 до 5000

SELECT * FROM CUSTOMERS WHERE CNAME LIKE 'C%'; -- 15. Все пользователи, чьи имена начинаются с буквы C

SELECT SUM(AMT) FROM ORDERS WHERE ODATE = '2015-03-10'; -- 16. Все суммы приобретений на 3 Октября

SELECT * FROM CUSTOMERS WHERE CNAME LIKE 'G%' ORDER BY CNAME; -- 17. Заказчики в алфавитном порядке, чьи имена начинаются с буквы G
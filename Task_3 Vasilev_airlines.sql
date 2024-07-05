SELECT * FROM BOOKINGS WHERE BOOK_DATE = '2017-07-14'; -- 1.	Напишите запрос, который выберет все бронирования за 2017-07-14 и стоимостью более 100 000

SELECT * FROM FLIGHTS WHERE ACTUAL_ARRIVAL IS NULL; -- 2.	Выведите все рейсы где actual_arrival не указан.

SELECT * FROM SEATS WHERE FARE_CONDITIONS = 'Business'; -- 3.	Напишите запрос выбирающий все бизнес места.

SELECT DISTINCT PASSENGER_NAME FROM TICKETS ORDER BY PASSENGER_NAME; -- 4.	Выведите имена пассажиров без повторений в алфавитном порядке.

SELECT AIRPORT_CODE, AIRPORT_NAME FROM AIRPORTS_DATA WHERE CITY = '{"en":"Moscow","ru":"Москва"}'; -- 5.	Выведите код и название аэропортов в Москве

SELECT * FROM FLIGHTS WHERE SCHEDULED_DEPARTURE BETWEEN '2017-08-09' AND '2017-09-04'; -- 6.	Выберите все рейсы у которых время отправления раньше 2017-08-09 и позже 2017-09-04. Используйте оператор Between.

SELECT * FROM TICKET_FLIGHTS WHERE AMOUNT BETWEEN 10000 AND 30000 ORDER BY AMOUNT DESC; -- 7.1	Выведите перелеты по цене от 10000 до 30000 в порядке убывания.

SELECT * FROM TICKET_FLIGHTS WHERE AMOUNT >= '10000' AND AMOUNT <= '30000' ORDER BY AMOUNT DESC; -- 7.2	Выведите перелеты по цене от 10000 до 30000 в порядке убывания.

SELECT * FROM SEATS WHERE FARE_CONDITIONS <> 'Economy'; -- 8.	Выберите все места, не относящиеся к классу эконом.

SELECT * FROM FLIGHTS WHERE DEPARTURE_AIRPORT IN ('VKO', 'SVX'); -- 9.	Выберите все рейсы с аэропортом отправления VKO или SVX.

SELECT DISTINCT FARE_CONDITIONS FROM SEATS; -- 10.	Выберите все классы обслуживания мест в самолете без повторений и назовите столбец class.

SELECT * FROM BOOKINGS WHERE TOTAL_AMOUNT > '30000' LIMIT 1500 OFFSET 1000; -- 11.	Выберите 1500 записей бронирования, начиная с 1000 записи, где стоимость больше 30000.

-- 12.	Выберите все названия аэропортов, которые находиться в городах: Москва, Санкт-Петербург, Екатеринбург и Нерюнгри. Используйте IN
SELECT AIRPORT_NAME FROM AIRPORTS_DATA WHERE CITY IN ('{"en":"Moscow","ru":"Москва"}', 
	'{"en":"St. Petersburg","ru":"Санкт-Петербург"}', 
	'{"en":"Yekaterinburg","ru":"Екатеринбург"}',
	'{"en":"Neryungri","ru":"Нерюнгри"}');

SELECT SEAT_NO FROM SEATS WHERE FARE_CONDITIONS NOT IN ('Business', 'Economy'); -- 13.	Выберите все номера мест, кроме мест с классом бизнес или эконом. Используйте оператор IN

SELECT TICKET_NO, PASSENGER_NAME FROM TICKETS WHERE PASSENGER_NAME LIKE 'A%'; -- 14.	Выберите все номера билетов и имя пассажира, если имя начинается на A.

SELECT PASSENGER_ID, PASSENGER_NAME FROM TICKETS WHERE PASSENGER_NAME LIKE 'ANNA%'; -- 15.	Выберите все id и имя пассажиров c именем ANNA. 
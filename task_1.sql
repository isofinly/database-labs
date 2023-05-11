-- Сделать запрос для получения атрибутов из указанных таблиц, применив фильтры по указанным условиям:
-- Таблицы: Н_ЛЮДИ, Н_ВЕДОМОСТИ.
-- Вывести атрибуты: Н_ЛЮДИ.ФАМИЛИЯ, Н_ВЕДОМОСТИ.ДАТА.
-- Фильтры (AND):
-- a) Н_ЛЮДИ.ИД = 100012.
-- b) Н_ВЕДОМОСТИ.ИД > 1250972.
-- Вид соединения: LEFT JOIN.

SELECT Н_ЛЮДИ.ФАМИЛИЯ, Н_ВЕДОМОСТИ.ДАТА
FROM Н_ЛЮДИ
LEFT JOIN Н_ВЕДОМОСТИ
ON Н_ЛЮДИ.ИД = Н_ВЕДОМОСТИ.ИД
WHERE Н_ЛЮДИ.ИД = 100012 AND Н_ВЕДОМОСТИ.ИД > 1250972;
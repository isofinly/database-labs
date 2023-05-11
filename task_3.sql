-- Вывести число дней без учета повторений.
-- При составлении запроса нельзя использовать DISTINCT.

SELECT COUNT(*) AS count_days
FROM (
  SELECT DATE(ДАТА_УТВЕРЖДЕНИЯ) AS day
  FROM Н_ПЛАНЫ
  GROUP BY DATE(ДАТА_УТВЕРЖДЕНИЯ)
) AS days

-- Выведите таблицу со средним возрастом студентов во всех группах (Группа, Средний возраст), где средний возраст больше минимального возраста в группе 1101.

SELECT "Н_УЧЕНИКИ"."ГРУППА", AVG(EXTRACT(YEAR FROM age(CURRENT_DATE, DATE("Н_ЛЮДИ"."ДАТА_РОЖДЕНИЯ"))))
FROM "Н_ЛЮДИ"
         INNER JOIN "Н_УЧЕНИКИ" ON "ЧЛВК_ИД" = "Н_ЛЮДИ"."ИД"
GROUP BY "ГРУППА"
HAVING AVG(EXTRACT(YEAR FROM age(CURRENT_DATE, DATE("Н_ЛЮДИ"."ДАТА_РОЖДЕНИЯ")))) >
       (SELECT MIN(EXTRACT(YEAR FROM age(CURRENT_DATE, DATE("Н_ЛЮДИ"."ДАТА_РОЖДЕНИЯ"))))
        FROM "Н_ЛЮДИ"
                 INNER JOIN "Н_УЧЕНИКИ" ON "Н_ЛЮДИ"."ИД" = "Н_УЧЕНИКИ"."ЧЛВК_ИД"
        WHERE CAST("ГРУППА" AS INTEGER) = 1101);
-- Найти группы, в которых в 2011 году было более 5 обучающихся студентов на ФКТИУ.
-- Для реализации использовать соединение таблиц.

select students."ГРУППА", count(students)
from "Н_УЧЕНИКИ" students
         join "Н_ПЛАНЫ" plans on students."ПЛАН_ИД" = plans."ИД"
         join "Н_ОТДЕЛЫ" departments on plans."ОТД_ИД" = departments."ИД"
where departments."КОРОТКОЕ_ИМЯ" = 'КТиУ' AND (plans."УЧЕБНЫЙ_ГОД" = '2010/2011' OR plans."УЧЕБНЫЙ_ГОД" = '2011/2012')
group by students."ГРУППА"
having count(students) > 5;

-- Создать таблицы:
-- • Table1{id: integer, var1: string, valid_from_dttm: date, valid_to_dttm: date}
-- • Table2{id: integer, var2: string, valid_from_dttm: date, valid_to_dttm: date}
-- Версионность в таблицах непрерывная, разрывов нет (если valid_to_dttm = '2018-09-05', то для следующей строки соответствующего ID valid_from_dttm = '2018-09-06', т.е. на день больше). Для каждого ID дата начала версионности и дата конца версионности в Table1 и Table2 совпадают.

create table if not exists Table1(
	id integer,
	var1 text,
	valid_from_dttm date,
	valid_to_dttm date
);

create table if not exists Table2(
	id integer,
	var2 text,
	valid_from_dttm date,
	valid_to_dttm date
);

insert into Table1 values
(1, 'A', '2018-09-01', '2018-09-15'),
(1, 'B', '2018-09-16', '5999-12-31');

insert into Table2 values
(1, 'A', '2018-09-01', '2018-09-18'),
(1, 'B', '2018-09-19', '5999-12-31');

with time_union AS (
	SELECT Table1.id, var1, var2, GREATEST(Table1.valid_from_dttm, Table2.valid_from_dttm) AS valid_from_dttm,
	LEAST(Table1.valid_to_dttm, Table2.valid_to_dttm) AS valid_to_dttm
	FROM Table1 JOIN Table2 ON Table1.id = table2.id
)

SELECT *
FROM time_union
WHERE valid_from_dttm <= valid_to_dttm
ORDER BY valid_from_dttm;

-- Задание №4. Выполнить следующие действия:
-- 1. Извлечь JSON фрагмент из JSON документа.

-- Вывести один json фрагмент из документа созданного в первом задании.
select *
from hull_json_temp
limit 1;

-- 2. Извлечь значения конкретных узлов или атрибутов JSON документа.

-- Вывести ФИО работников женского пола. Использовался JSON документ из первого задания.
select row->>'hull_name' as hull_name, row->>'hull_manufacturer' as hull_manufacturer
from hull_json_temp
where row->>'hull_manufacturer' = 'Niger';

-- 3. Выполнить проверку существования атрибута.

-- Добавил два столбца с информацией о существовании необходимых атрибутов.
select row,
       row::jsonb ? 'hull_name' as hull_name_exists,
       row::jsonb ? 'hull_manufacturer' as hull_manufacturer_exists
from hull_json_temp;

-- 4. Изменить JSON документ.

create temp table hull_info_json (
    hull json
);

insert into hull_info_json(hull)
values ('{"hull_name":"HULL_QDL_999","hull_manufacturer":"Niger"}'),
       ('{"hull_name":"HULL_ADL_999","hull_manufacturer":"Russia"}'),
       ('{"hull_name":"HULL_CDL_999","hull_manufacturer":"Italy"}');

select * from hull_info_json;

-- Заменил фамилию на свою.
update hull_info_json
set hull = jsonb_set(hull::jsonb, '{hull_manufacturer}', '"USA"', false)
where hull->>'hull_manufacturer' = 'Russia';

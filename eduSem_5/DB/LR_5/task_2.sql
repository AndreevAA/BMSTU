-- Задание №2. Выполнить загрузку и сохранение JSON файла в таблицу.
-- Созданная таблица после всех манипуляций должна соответствовать таблице базы данных,
-- созданной в первой лабораторной работе.

-- Создание временной таблицы с значениями json из файла.
create table hull_json_temp(row json);
copy hull_json_temp from '/Users/andreevalexander/BMSTU/eduSem_5/DB/LR_5/jsons/hull.json';

-- Парсим json-ы и добавляем в результирующую таблицу.
select X.hull_id, X.hull_name, X.hull_manufacturer, X.hull_length, X.hull_width, X.hull_height, X.hull_fuel_tank
into hull_json
from hull_json_temp J, json_to_record(J.row)
as X(hull_id integer, hull_name text, hull_manufacturer text, hull_length double precision,
     hull_width double precision, hull_height double precision, hull_fuel_tank double precision);

select * from military_vehicles.public.hull;
select * from hull_json;

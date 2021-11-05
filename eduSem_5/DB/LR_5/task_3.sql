-- Задание №3. Создать таблицу, в которой будет атрибут(-ы) с типом JSON,
-- или добавить атрибут с типом JSON к уже существующей таблице.
-- Заполнить атрибут правдоподобными данными с помощью команд INSERT или UPDATE.

select * from military_vehicles.public.hull;

-- Создал временную копию таблицы hull с атрибутом json
create temp table if not exists hull_with_json_temp (
    hull_id integer not null,
    hull_name text not null,
    hull_manufacturer text not null,
    hull_fuel_tank double precision not null,
    hull_size json not null
);

-- Добавил все строки из старой таблицы hull, но из размеров рождения сделал json объект
insert into hull_with_json_temp (hull_id, hull_name, hull_manufacturer, hull_fuel_tank, hull_size)
select hull_id, hull_name, hull_manufacturer, hull_width,
       json_build_object(
           'hull_length', hull_length,
           'hull_width', hull_width,
           'hull_height', hull_height
           )
from military_vehicles.public.hull;

select * from hull_with_json_temp;

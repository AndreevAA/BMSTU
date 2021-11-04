-- А. Четыре функции

-- 3) Много операторная табличная функция
-- Функция возвращает названия группы с максимальным количеством элементов
create or replace function max_hull_group()
returns char as
    $$
    declare
        group_name text;
    begin
        group_name := (
            select Hull.hull_name
            from military_vehicles.public.hull hull join military_vehicles.public.tower tower on
                hull.hull_id = tower.tower_id
            group by Hull.hull_name
            order by count(*) desc
            limit 1
        );

        return group_name;
    end;
    $$
language 'plpgsql';

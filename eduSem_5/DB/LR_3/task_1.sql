-- А. Четыре функции

-- 1) Скалярная функция
-- Функция возвращает максимальную длину танка по всем танкам
create or replace function max_hull_length()
returns int as
    $$
    begin
        return (
            select hull_length
            from military_vehicles.public.hull
            order by hull_length desc
            limit 1
            );
    end;
    $$
language 'plpgsql';

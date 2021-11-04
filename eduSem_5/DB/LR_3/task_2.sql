-- А. Четыре функции

-- 2) Подставляемая табличная функция
-- Функция возвращает танк по имени страны производства
create or replace function hull_by_country(text)
returns setof military_vehicles.public.hull as
    $$
    begin
        return query (
            select *
            from military_vehicles.public.hull Hull
            where Hull.hull_manufacturer = $1
            );
    end;
    $$
language 'plpgsql';

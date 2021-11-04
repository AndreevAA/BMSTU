-- B. Четыре хранимые процедуры

-- 1) Хранимую процедуру без параметров или с параметрами
-- Добавить всем танкам 1 дополнительный литр топливного бака
create or replace procedure increment_hull_fuel_tank()
as
$$
    begin
        update military_vehicles.public.hull
        set hull_fuel_tank = hull_fuel_tank + 1;
    end
$$
language 'plpgsql';

-- B. Четыре хранимые процедуры

-- 2) Рекурсивная хранимая процедура или хранимая процедура с рекурсивным ОТВ
-- Рекурсивно добавить всем танкам необходимый дополнительный литр топливного бака
create or replace procedure recursive_increment_hull_fuel_tank(int, int, int)
as
$$
    begin
        if $1 < $2 then
            call recursive_increment_hull_fuel_tank($1 + 1, $2, $3);
        end if;
        update military_vehicles.public.hull
        set hull_fuel_tank = hull_fuel_tank + $3;
    end
$$
language 'plpgsql';

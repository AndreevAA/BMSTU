-- B. Четыре хранимые процедуры

-- 3) Хранимую процедуру с курсором
-- Добавить всем танкам необходимый дополнительный литр топливного бака, у которых он меньше 200
create or replace procedure recursive_increment_hull_fuel_tank(int, int, int)
as
$$
    begin
        if $1 < $2 then
            call recursive_increment_hull_hull_tank($1 + 1, $2, $3);
        end if;
        update military_vehicles.public.hull
        set hull_fuel_tank = hull_fuel_tank + 1;
    end
$$
language 'plpgsql';

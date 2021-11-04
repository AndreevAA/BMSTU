-- B. Четыре хранимые процедуры

-- 3) Хранимую процедуру с курсором
-- Добавить всем танкам необходимый дополнительный литр топливного бака, у которых он меньше необходимого
create or replace procedure increment_hull_fuel_tank_less_needed(int, int)
as
$$
    declare
        row record;
        cur cursor for
            select * from military_vehicles.public.hull
                where hull_fuel_tank < $2;
    begin
        open cur;
        loop
            fetch cur into row;
            exit when not found;
            update military_vehicles.public.hull
            set hull_fuel_tank = hull_fuel_tank + $1
            where hull_id = row.hull_id;
        end loop;
    end
$$
language 'plpgsql';

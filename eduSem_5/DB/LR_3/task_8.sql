-- B. Четыре хранимые процедуры

-- 4) Хранимую процедуру доступа к метаданным
-- https://postgrespro.ru/docs/postgresql/12/information-schema
-- https://postgrespro.ru/docs/postgrespro/9.5/catalogs
create or replace procedure show_all_PK()
as
$$
    declare
        cur cursor for
            select constraint_name, table_name, constraint_type
                from information_schema.table_constraints
                    where constraint_type = 'PRIMARY_KEY';
        row record;
    begin
        open cur;
        loop
            fetch cur into row;
            exit when not found;
            raise '{constraint : %} {table : %}', row.constraint_name, row.table_name;
        end loop;
    end
$$
language 'plpgsql';

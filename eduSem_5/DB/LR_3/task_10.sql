-- C. Два DML триггера

-- 2) Триггер INSTEAD OF
-- Вместо обновления в таблице вывести сообщение "permission denied"

create view group_view as
select *
from military_vehicles.public.hull;

create or replace function cancel_update()
returns trigger as
$$
begin
	raise notice 'permission denied';
	return new;
end
$$ language 'plpgsql';


create trigger cancel_update_trigger
instead of update on group_view for each row
execute function cancel_update();



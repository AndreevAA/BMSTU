-- C. Два DML триггера

-- 2) Триггер INSTEAD OF
-- Вместо обновления в таблице вывести сообщение "permission denied"

select *
from group_view;

update group_view
set hull_manufacturer = 'Russia'
where hull_id = 1;

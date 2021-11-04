-- C. Два DML триггера

-- 1) Триггер AFTER
-- Создал урезанную копию таблицы hull, добавил поле int, которое указывает,
-- сколько было добавлено записей в таблицу после ткущей. Триггер увеличивает
-- этот атрибут у всех записей при добавлении

select * from hull_temp order by number_after_this desc;

insert into hull_temp (hull_name, hull_length, number_after_this)
values ('hull_name_1', 10, -1);

insert into hull_temp (hull_name, hull_length, number_after_this)
values ('hull_name_2', 10, -1);

insert into hull_temp (hull_name, hull_length, number_after_this)
values ('hull_name_3', 10, -1);

insert into hull_temp (hull_name, hull_length, number_after_this)
values ('hull_name_4', 10, -1);

insert into hull_temp (hull_name, hull_length, number_after_this)
values ('hull_name_5', 10, -1);

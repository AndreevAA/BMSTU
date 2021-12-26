drop table if exists romashka;

create table romashka (
	department varchar not null,
	FIO varchar not null,
	Date date not null ,
	Status varchar not null
);

insert into romashka(department, FIO, Date, Status) values
('ИТ','Иванов Иван Иванович','2020-01-15','Больничный'),
('ИТ','Иванов Иван Иванович','2020-01-16','На работе'),
('ИТ','Иванов Иван Иванович','2020-01-17','Оплачиваемый отпуск'),
('ИТ','Иванов Иван Иванович','2020-01-18','На работе'),
('ИТ','Иванов Иван Иванович','2020-01-19','Оплачиваемый отпуск'),
('ИТ','Иванов Иван Иванович','2020-01-20','Оплачиваемый отпуск'),
('Бухгалтерия','Петрова Ирина Ивановна','2020-01-15','Оплачиваемый отпуск'),
('Бухгалтерия','Петрова Ирина Ивановна','2020-01-16','На работе'),
('Бухгалтерия','Петрова Ирина Ивановна','2020-01-17','На работе'),
('Бухгалтерия','Петрова Ирина Ивановна','2020-01-18','На работе'),
('Бухгалтерия','Петрова Ирина Ивановна','2020-01-19','Оплачиваемый отпуск'),
('Бухгалтерия','Петрова Ирина Ивановна','2020-01-20','Оплачиваемый отпуск');

select * from romashka;

with extra_table as (
    select department, fio, date, status,
           min(date) over (partition by department, fio, status) as min_date,
           max(date) over (partition by department, fio, status) as max_date
    from romashka
    order by fio, max_date
)
select distinct  department, fio, min_date as DateFrom, max_date as DateTo, status
from extra_table
order by department desc, DateFrom;


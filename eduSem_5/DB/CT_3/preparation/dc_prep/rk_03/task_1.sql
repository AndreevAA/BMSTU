-- Воякин Алексей ИУ7-54Б вариант 1.
create database rk3;

create table if not exists employee (
    id_employee serial not null primary key,
    full_name varchar(50) not null,
    dob date not null,
    department varchar(50) not null
);

create table if not exists reg (
    id_employee int references employee(id_employee) not null,
    date date not null,
    day_of_week varchar(20),
    time time not null,
    type int not null
);

insert into employee
values (1, 'ИВА', '1990-09-25', 'ИТ'),
       (2, 'ПРВ', '1987-11-12', 'Бухгалтерия'),
       (3, 'НУТ', '1991-03-13', 'ИТ'),
       (4, 'РУЛ', '2000-12-12', 'Бухгалтерия'),
       (5, 'ГУР', '2005-03-20', 'Бухгалтерия'),
       (6, 'ВШУ', '1980-01-01', 'ИТ'),
       (7, 'ГУР', '2005-03-20', 'Бухгалтерия'),
       (8, 'РУН', '2005-03-21', 'Бухгалтерия'),
       (9, 'УШД', '2005-03-22', 'Бухгалтерия'),
       (10, 'УПШ', '2005-03-23', 'Бухгалтерия'),
       (11, 'ЦГУ', '2005-03-24', 'Бухгалтерия'),
       (12, 'ЦРО', '2005-03-25', 'Бухгалтерия'),
       (13, 'ЦШЫ', '2005-03-26', 'Бухгалтерия'),
       (14, 'УИИ', '2005-03-27', 'Бухгалтерия'),
       (15, 'ЦШЫ', '2005-03-28', 'Бухгалтерия'),
       (16, 'УОТ', '2005-03-29', 'Бухгалтерия');


insert into reg
values (1, '2018-12-14', 'Суббота', '9:00', 1),
       (1, '2018-12-14', 'Суббота', '9:20', 2),
       (1, '2018-12-14', 'Суббота', '9:25', 1),
       (2, '2018-12-14', 'Суббота', '9:05', 1),
       (1, '2018-12-14', 'Суббота', '9:30', 2),
       (1, '2018-12-14', 'Суббота', '9:35', 1),
       (1, '2018-12-14', 'Суббота', '9:50', 2),
       (1, '2018-12-14', 'Суббота', '9:55', 1);


create or replace function many_exits_count(date)
returns int as $$
begin
    return (
        select count(*) as cnt
        from (
            select id_employee, count(*) as cnt
            from reg
            where date = $1 and type = 2
            group by id_employee
        ) as leave_cnt join employee as E on leave_cnt.id_employee = E.id_employee
        where extract(years from age(E.dob)) between 18 and 40
        );
end;
$$ language plpgsql;

select many_exits_count('2018-12-14');


-- Моделирование запросов для второго задания.
-- 1
-- Найти все отделы, в которых работает более 10 сотрудников
select department
from (
         select count(*) as cnt, department
         from employee
         group by department
     ) as num_workers
where cnt > 10;


-- 2
-- Найти сотрудников, которые не выходят с рабочего места в течение всего рабочего дня
select in_and_out_cnt.id_employee, E.full_name
from (
         select id_employee, count(*) as cnt
         from reg
         where date = '2018-12-14'
         group by id_employee
) as in_and_out_cnt join employee E on in_and_out_cnt.id_employee = E.id_employee
where cnt <= 2;


-- 3
-- Найти все отделы, в которых есть сотрудники, опоздавшие в определенную дату. Дату передавать с клавиатуры
select distinct E.department
    from (
            select distinct id_employee, min(time) over(partition by id_employee) as entry_time
            from reg
            where date = '2018-12-14'
         ) as entry join employee E on entry.id_employee = E.id_employee
    where entry_time > '9:00';

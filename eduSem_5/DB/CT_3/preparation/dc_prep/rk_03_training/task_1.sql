create database rk3_training;

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
values (1, 'Иванов Иван Иванович', '1990-09-25', 'ИТ'),
       (2, 'Петров Петр Петрович', '1987-11-12', 'Бухгалтерия');

insert into reg
values (1, '2018-12-14', 'Суббота', '9:00', 1),
       (1, '2018-12-14', 'Суббота', '9:20', 2),
       (1, '2018-12-14', 'Суббота', '9:25', 1),
       (2, '2018-12-14', 'Суббота', '9:05', 1);

create or replace function late_count_by_date(date)
returns int as $$
begin
    return (select count(*)
    from (
            select distinct id_employee, min(time) over(partition by id_employee) as entry_time
            from reg
            where date = $1
         ) as entry
    where entry_time > '9:00');
end
$$
language plpgsql;

select * from late_count_by_date('2018-12-14');







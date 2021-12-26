-- Андреев Александр, ИУ7-54Б, 1 вариант

-- database creating
create database rk3;

-- creating table worker
create table if not exists worker (
    worker_id   serial not null primary key,
    snt         varchar(50) not null,
    db          date not null,
    dep         varchar(50) not null
);

-- creating table schedule_io
create table if not exists schedule_io (
    worker_id   int references worker(worker_id) not null,
    date        date not null,
    day_of_week varchar(20),
    time        time not null,
    type        int not null
);

-- filling worker table
insert into worker
values (1, 'Петров Петр Петрович', '1975-12-13', 'HR'),
       (2, 'Иванов Иван Иванович', '2005-03-29', 'HQ'),
       (3, 'Андреев Александр Алексеевич', '1991-03-13', 'HQ'),
       (4, 'Бутин Артем Артемович', '1983-09-21', 'HQ'),
       (5, 'Авдотьев Авдотий Киримович', '1996-09-21', 'HQ'),
       (6, 'Киримов Авдот Петрович', '2001-09-21', 'ИТ'),
       (7, 'Краснов Казимир Бербекович', '1983-09-21', 'Топ-менеджмент'),
       (8, 'Вербенкин Антон Юрьеивч', '1983-03-21', 'ИТ'),
       (9, 'Путин Владимир Владимирович', '1983-09-21', 'Бухгалтерия'),
       (10, 'Омарова Варентива Казиликовна', '1983-09-21', 'Логистика'),
       (11, 'Цхерованивов Ажадимир Жужаждукакович', '1983-09-21', 'Логистика'),
       (12, 'Квохрамизарумов Зепхалиманул Хенкарстанукович', '1983-09-21', 'Логистика'),
       (13, 'Цваринансиванчиванин Кисель Кисельевич', '1983-09-21', 'Логистика'),
       (14, 'Ушмамбеков Ушмамбек Ушмамбекович', '1983-09-21', 'Логистика'),
       (15, 'Бахрейнов Бахрейн Бахрейнович', '1983-09-21', 'Логистика'),
       (16, 'Смирнова Юлия Михайловна', '1987-11-12', 'Топ-менеджмент');

-- filling schedule_io
insert into schedule_io
values (1, '2021-12-18', 'Суббота', '9:00', 1),
       (1, '2021-12-18', 'Суббота', '9:20', 2),
       (1, '2021-12-18', 'Суббота', '9:25', 1),
       (2, '2021-12-18', 'Суббота', '9:05', 1),
       (1, '2021-12-18', 'Суббота', '9:30', 2),
       (1, '2021-12-18', 'Суббота', '9:35', 1),
       (1, '2021-12-18', 'Суббота', '9:50', 2),
       (1, '2021-12-18', 'Суббота', '9:55', 1);

-- counting coming out workers in 18-40 years old
create or replace function count_workers(date)
returns int as $$
begin
    return (
        select count(*) as cnt
        from (
            select worker_id, count(*) as cnt
            from schedule_io
            where date = $1 and type = 2
            group by worker_id
        ) as leave_cnt
            join worker as W on leave_cnt.worker_id = W.worker_id
        where extract(years from age(W.db)) between 18 and 40
        );
end;
$$ language plpgsql;

-- testing counting 2021-12-18
select count_workers('2021-12-18');

-- selecting deps with less 10 workers
select dep
from (
         select count(*) as cnt, dep
         from worker
         group by dep
     ) as num_workers
where cnt > 10;

-- selecting all day working worker
select in_and_out_cnt.worker_id, W.snt
from (
         select worker_id, count(*) as cnt
         from schedule_io
         where date = '2018-12-14'
         group by worker_id
) as in_and_out_cnt join worker W on in_and_out_cnt.worker_id = W.worker_id
where cnt <= 2;

-- selecting deps with workers late in one day
select distinct W.dep
    from (
            select distinct worker_id, min(time) over(partition by worker_id) as in_time
            from schedule_io
            where date = '2021-12-18'
         ) as in_office join worker W on in_office.worker_id = W.worker_id
    where in_time > '8:30';

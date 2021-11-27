-- Вариант 1, Андреев Александр, ИУ7-54Б

-- Задание 1

-- Создание БД
create database rk2;

-- -- Создание схемы
create schema rk2;

-- Создание таблицы экскурсия
create table if not exists rk2.excursion
(
    id              bigserial primary key not null,
    name            text,
    description     text,
    date_opening    time,
    date_closing    time
);

-- Создание таблицы стенд
create table if not exists rk2.stand
(
    id                  bigserial primary key,
    name                text,
    subject             text,
    short_description   text
);

-- Создание таблицы стенд-посетитель
create table if not exists rk2.stand_excursion
(
    id                      bigserial primary key not null,
    excursion_id            bigint                not null references rk2.excursion (id),
    stand_id                bigint                not null references rk2.stand (id)
);

-- Создание таблицы посетитель
create table if not exists rk2.visitor
(
    id      bigserial primary key not null,
    fio     text,
    address text,
    phone   text
);

-- Создание таблицы посетитель-экскурсия
create table if not exists rk2.visitor_excursion
(
    id         bigserial primary key not null,
    visitor_id   bigint                not null references rk2.visitor (id),
    excursion_id bigint                not null references rk2.excursion (id)
);

-- Заполнение данными экскурсии
insert into rk2.excursion(name, description, date_opening, date_closing)
values ('exc_1', 'Эта экскурсия о Москве', '08:00', '23:30'),
       ('exc_2', 'Эта экскурсия о Ростове', '08:00', '22:00'),
       ('exc_3', 'Эта экскурсия о Краснодаре', '08:00', '22:00'),
       ('exc_4', 'Эта экскурсия о Питере', '08:00', '22:00'),
       ('exc_5', 'Эта экскурсия о Кошках', '08:00', '22:00'),
       ('exc_6', 'Эта экскурсия о Технике', '08:00', '22:00'),
       ('exc_7', 'Эта экскурсия о Морозе', '08:00', '22:00'),
       ('exc_8', 'Эта экскурсия о Польше', '08:00', '22:00'),
       ('exc_9', 'Эта экскурсия о Войне', '08:00', '22:00'),
       ('exc_10', 'Эта экскурсия о Ложках', '08:00', '22:00');

-- Заполнение данными стенда
insert into rk2.stand(name, subject, short_description)
values ('st_1', 'Город', 'Стенд о промышленном городе'),
       ('st_2', 'Город', 'Стенд о историческом городе'),
       ('st_3', 'Город', 'Стенд о красивом городе'),
       ('st_4', 'Город', 'Стенд о интересном городе'),
       ('st_5', 'Животные', 'Стенд о животных'),
       ('st_6', 'Область', 'Стенд о разных предметных областях'),
       ('st_7', 'Погода', 'Стенд о погоде и явлениях'),
       ('st_8', 'Страна', 'Стенд о истории страны'),
       ('st_9', 'Война', 'Стенд о войне'),
       ('st_10', 'Быт', 'Стенд о быте');

-- Заполнение данными stand_excursion
insert into rk2.stand_excursion(stand_id, excursion_id)
values (8, 3), (7, 1), (6, 9), (1, 2), (3, 7), (6, 5),
       (10, 9), (2, 4), (9, 4), (10, 1), (3, 6);

-- Заполнение данными посетителя
insert into rk2.visitor(fio, address, phone)
values ('Петрова Анна Петровна', 'Красноказарменная улица, 13, лит. М, Москва, 111250', '+7 (123) 456-75-31'),
       ('Петров Анатолий Борисович', 'Новая Басманная ул., 10, Москва, 107078', '+7 (123) 456-75-31'),
       ('Борисов Петр Ильич', 'Садовая-Черногрязская ул., 13 строение 3, Москва, 105064', '+7 (123) 456-75-31'),
       ('Ишкандеров Азархатдин Бешкербенович', 'ул. Покровка, дом 45, Москва, 105064', '+7 (123) 456-75-31'),
       ('Иванов Иван Иванович', 'ул. Земляной Вал, 1/4 строение 1, Москва, 105064', '+7 (123) 456-75-31'),
       ('Аксенов Егор Юрьевич', 'Kije 133A, 28-404 Kije, Польша', '+7 (123) 456-75-31'),
       ('Андреев Александр Алексеевич', 'ul. Kasztelańska 3, 28-404 Kije, Польша', '+7 (123) 456-75-31'),
       ('Шингаров Ильяс Иванович', 'C. Portillo de el Pardo, 19, 28023 Madrid, Испания', '+7 (123) 456-75-31'),
       ('Борисов Алексей Иванович', 'Av. de Valdemarín, 55, 28023 Madrid, Испания', '+7 (912) 918-20-62'),
       ('Орехова Юлия Михайловка', 'R. Tílias 131, 1675-260 Pontinha, Португалия', '+7 (123) 456-75-31');

-- Заполнение данными visitor_excursion
insert into rk2.visitor_excursion(visitor_id, excursion_id)
values (3, 1), (6, 5), (8, 2), (2, 3), (2, 1), (9, 4),
       (10, 9), (6, 9), (5, 3), (7, 6), (3, 6);

-- Задание 2

-- Вывести список экскурсий, который работают в поздние часы (23:00).
select description, date_opening, date_closing,
       (case when date_closing > '23:00' then true else false end) is_need_opened
from rk2.excursion order by is_need_opened desc;

-- Вывести количество стендов, темы которых больше трех
select subject, count(*) as count from rk2.stand
group by subject having count(*) > 2 order by count;

-- Вывод нумерации строк, если они не связаны с реальным (id перемешаны)
select id, description, date_opening, date_closing, row_number()
    over () as static_position from rk2.excursion group by id;

-- 3. Создать хранимую процедуру без параметров, которая осуществляет поиск потенциально опасных
-- ключевых слов в хранимых процедурах в текущей базе данных. В данном случае таким ключевым
-- словом является 'EXEC'. Хранимая процедура выводит инструкцию 'EXEC', которая выполняет
-- командную строку — строку символов или один из следующих модулей: хранимую процедуру или
-- скалярную пользовательскую функцию. Созданную хранимую процедуру протестировать.
-- pr_proc
create or replace function show_number_of_warnings_trigger() returns int
as $$ declare
    count_warnings int;
begin
    count_warnings = 0;

    select count(*) into count_warnings from pg_proc p where p.prosrc like '%EXEC%';

    return count_warnings;
END
$$ LANGUAGE plpgsql;

-- Вызов
select show_number_of_warnings_trigger();

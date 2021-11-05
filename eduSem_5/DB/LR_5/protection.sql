-- Триггер, переформатирующий атрибуты типа interval дни на года и тд
create temp table if not exists interval_test
(
 	id serial not null,
	experience interval not null
);

create or replace function parse_interval()
returns trigger AS
$$
    query = plpy.execute("select id, extract(years from experience) as years, "
                         "extract(mons from experience) as mons, extract(days from experience) as days "
                         "from interval_test")
    for line in query:
        years = int(line['years'])
        mons = int(line['mons'])
        days = int(line['days'])
        mons += days // 30
        days %= 30
        years += mons // 12
        mons %= 12
        result = str(years) + ' years ' + str(mons) + ' mons ' + str(days) + ' days '
        task = plpy.prepare("update interval_test set experience = $1 where id = $2", ['interval', 'int'])
        plpy.execute(task, [result, line['id']])
$$
language plpython2u;

create trigger trigger_after_insert_parse_interval
after insert on interval_test for each row
execute function parse_interval();

insert into interval_test (experience)
values ('1000 days');
insert into interval_test (experience)
values ('10 years 20 days');
insert into interval_test (experience)
values ('200 mons 100 days');

select * from interval_test;
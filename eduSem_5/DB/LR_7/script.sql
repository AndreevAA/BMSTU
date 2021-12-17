create table if not exists hulls_json
(
    doc json
);

-- insert into hulls_json
-- select * from military_vehicles.public.hull;
--
-- select * from hulls_json;

select * from hull
where hull_fuel_tank > 2
order by hull_name
limit 5;

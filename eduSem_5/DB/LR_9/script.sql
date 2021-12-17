select * from military_vehicles.public.hull;

delete from military_vehicles.public.hull where hull_id = 2000;

INSERT INTO military_vehicles.public.hull(hull_id, hull_name, hull_manufacturer,
                 hull_length, hull_width, hull_height, hull_fuel_tank)
VALUES(2000, 'HUll name', 'HUll manufacturer', 5000,
                        5000, 5000, 30);

select *
from military_vehicles.public.hull
order by  hull_id;

delete from military_vehicles.public.hull where hull_id = 2000;

select *
from military_vehicles.public.hull
order by  hull_id;

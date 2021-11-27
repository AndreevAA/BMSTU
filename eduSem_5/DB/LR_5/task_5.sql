-- 5. Разделить JSON документ на несколько строк по узлам.

select * from hull_json_temp;

copy (
    select *
    from hull_json_temp
    where (row->>'hull_length') > '10'
    )
to '//Users/andreevalexander/BMSTU/eduSem_5/DB/LR_5/jsons/hull_big.json';


select hull_id, hull_name, hull_manufacturer, hull_fuel_tank, hull_size
from hull_json_temp J, json_to_record(J.row)
as X(hull_id integer, hull_name text, hull_manufacturer text, hull_length double precision,
     hull_width double precision, hull_height double precision, hull_fuel_tank double precision,
    hull_size json);


select json_build_object(
            'hull_id', hull_id,
            'hull_name', hull_name
           ) as identifiers,
       json_build_object(
           'hull_manufacturer', hull_manufacturer,
           'hull_length', hull_length,
           'hull_width', hull_width,
           'hull_height', hull_height,
           'hull_fuel_tank', hull_fuel_tank
           ) as desctription
from hull_json_temp J, json_to_record(J.row)
as X(hull_id integer, hull_name text, hull_manufacturer text, hull_length double precision,
     hull_width double precision, hull_height double precision, hull_fuel_tank double precision,
    hull_size json);

-- Задание №1. Из таблиц базы данных, созданной в первой лабораторной работе,
-- извлечь данные в JSON.

-- Извлёк данные из таблицы employee в файл hull.json

copy (select row_to_json(hull) from military_vehicles.public.hull)
    to '/Users/andreevalexander/BMSTU/eduSem_5/DB/LR_5/jsons/hull.json';

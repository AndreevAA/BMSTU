from psycopg2 import sql
from prettytable import PrettyTable


# Объект обертки набора запросов
import config


class Request:
    # Приватные данные
    _db = None

    # Инициализация объекта
    def __init__(self, db_source):
        # Установка значений в объект
        self._db = db_source

    # Получение распакованного SQL
    def _fetch_sql(self, query):
        # return self._db.execute_query(query)
        try:
            return self._db.execute_query(query).fetchall()
        except Exception:
            return config.empty_sql

    # 1. Выполнить скалярный запрос.
    def scalar_query(self):
        print("\nМаксимальный объем топливного бака танка.")
        table = PrettyTable(['Максимальный объем топливного бака танка'])
        table.add_row(self._fetch_sql(sql.SQL("select hull_fuel_tank "
                        "from military_vehicles.public.hull "
                        "order by hull_fuel_tank desc "
                        "limit 1;"))[0])
        print(table, '\n')

    # 2. Выполнить запрос с несколькими соединениями (JOIN).
    def multi_join_query(self):
        print("\nНазвание танка и производитель с шириной кузова меньше 30.")
        table = PrettyTable(['Название', 'Производитель'])
        table.add_rows(self._fetch_sql(sql.SQL("select P.hull_name as hull_name, Ch.hull_manufacturer as hull_manufacturer "
                        "from military_vehicles.public.hull Co join military_vehicles.public.hull Ch on Co.hull_id = Ch.hull_id "
                        "join military_vehicles.public.hull P on Co.hull_id = P.hull_id "
                        "where Co.hull_width < 30;")))
        print(table)

    # 3. Выполнить запрос с ОТВ(CTE) и оконными функциями.
    def cte_window_query(self):
        print("\nИнформация о средней, минимальной и максимальной объема топливного бака")
        query = sql.SQL(
            "with longest_hull as ( "
                "select hull_id "
                "from military_vehicles.public.hull "
                "where hull_length > (select avg(hull_length) from military_vehicles.public.hull)"
            ") "
            "select hull_id, hull_name, hull_manufacturer, hull_length "
            "from military_vehicles.public.hull "
            "where hull_id IN (select hull_id from longest_hull) "
            "group by hull_id")
        result = self._fetch_sql(query)
        print(result)
        headings = ['hull_id', 'hull_name', 'hull_manufacturer', 'hull_length']
        table = PrettyTable(headings)
        table.add_rows(result)
        print(table)

    # 4. Выполнить запрос к метаданным.
    def metadata_query(self):
        print("\nНазвание ограничения и название таблицы где тип ограничения - первичный ключ.")
        table = PrettyTable(['Название ограничения', 'Название таблицы'])
        table.add_rows((self._fetch_sql(sql.SQL("select constraint_name, table_name "
                                     "from information_schema.table_constraints "
                                     "where constraint_type = 'PRIMARY KEY';"))))
        print(table)

    # 5. Вызвать скалярную функцию (написанную в третьей лабораторной работе)
    def call_scalar_func(self):
        print("\nМаксимальная длина танка по всем танкам.")
        with self._db.connection.cursor() as cursor:
            cursor.callproc('max_hull_length')
            if cursor.rowcount > 0:
                result = cursor.fetchone()
        cursor.close()
        table = PrettyTable(['Максимальная длина танка по всем танкам'])
        table.add_row(result)
        print(table)

    # 6. Вызвать табличную функцию (написанную в третьей лабораторной работе)
    def call_table_func(self):
        print("\nИнформация о танке по имени страны производства")
        hull_manufacturer = input("Введите страну производства: ")
        result = list()
        with self._db.connection.cursor() as cursor:
            cursor.callproc('hull_by_country', [hull_manufacturer])
            if cursor.rowcount > 0:
                result = cursor.fetchall()
        cursor.close()
        headings = ['hull_id', 'hull_name', 'hull_manufacturer', 'hull_length',
                    'hull_width', 'hull_height', 'hull_fuel_tank']
        table = PrettyTable(headings)
        table.add_rows(result)
        print(table)

    # 7. Вызвать хранимую процедуру (написанную в третьей лабораторной работе).
    def stored_procedure(self):
        print("\nДобавление всем работником 1 дня стажа")
        create_temp_table = sql.SQL("select * "
                                    "into temp hull_temp "
                                    "from military_vehicles.public.hull;")

        get_hull_fuel_tanks = sql.SQL("select hull_id, hull_name, hull_fuel_tank "
                                   "from hull_temp "
                                   "order by hull_name "
                                   "limit 5;")

        headings = ['hull_id', 'hull_name', 'hull_fuel_tank']
        table = PrettyTable(headings)

        with self._db.connection.cursor() as cursor:
            cursor.execute(create_temp_table)
            cursor.execute(get_hull_fuel_tanks)
            result = cursor.fetchall()
            table.add_rows(result)
            print(table)
            cursor.execute("call increment_hull_fuel_tank()")
            print("Хранимая процедура вызвана.")
            table.clear_rows()
            cursor.execute(get_hull_fuel_tanks)
            result = cursor.fetchall()
            table.add_rows(result)
            print(table)
        cursor.close()

    # 8. Вызвать системную функцию или процедуру.
    def call_sys_func(self):
        print("\nПолучение информации о версии PosgreSQL.")
        with self._db.connection.cursor() as cursor:
            cursor.callproc('version')
            result = cursor.fetchone()
        cursor.close()
        headings = ['PostgreSQL version']
        table = PrettyTable(headings)
        table.add_row(result)
        print(table)

    # 9. Создать таблицу в базе данных, соответствующую тематике БД.
    def create_table(self):
        print("\nСоздание таблицы связующей таблицы hull_group.")
        new_table = sql.SQL("create table if not exists hull_to_barrel ( "
                            "hull_id int not null, "
                            "barrel_id int not null, "
                            "foreign key (hull_id) references military_vehicles.public.hull(hull_id), "
                            "foreign key (barrel_id) references military_vehicles.public.barrel(barrel_id), "
                            "manufacturer text"
                            ");")
        with self._db.connection.cursor() as cursor:
            cursor.execute(new_table)
            print(cursor.statusmessage)
        cursor.close()
        self._db.connection.commit()

    # 10. Выполнить вставку данных в созданную таблицу с использованием инструкции INSERT или COPY.
    def fill_table(self):
        print("\nЗаполнение созданной таблицы данными.")
        insert = sql.SQL("insert into military_vehicles.public.hull_to_barrel(hull_id, barrel_id, manufacturer) "
                         "values (1, 3, 'Qatar'), "
                         "(2, 2, 'Russia'), "
                         "(3, 5, 'Peru'), "
                         "(1, 7, 'USA'); ")
        with self._db.connection.cursor() as cursor:
            cursor.execute(insert)
            print(cursor.statusmessage)
        cursor.close()
        self._db.connection.commit()

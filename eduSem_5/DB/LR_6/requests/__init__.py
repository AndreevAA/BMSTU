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
                        "from hull "
                        "order by hull_fuel_tank desc "
                        "limit 1;"))[0])
        print(table, '\n')

    # 2. Выполнить запрос с несколькими соединениями (JOIN).
    def multi_join_query(self):
        print("\nНазвание танка и производитель с шириной кузова меньше 10.")
        table = PrettyTable(['Название', 'Производитель'])
        table.add_rows(self._fetch_sql(sql.SQL("select P.hull_name as hull_name, Ch.hull_manufacturer as hull_manufacturer "
                        "from hull Co join hull Ch on Co.hull_id = Ch.hull_id "
                        "join hull P on Co.hull_id = P.hull_id "
                        "where Co.hull_width < 10;")))
        print(table)

    # 3. Выполнить запрос с ОТВ(CTE) и оконными функциями.
    def cte_window_query(self):
        print("\nИнформация о средней, минимальной и максимальной объема топливного бака")
        query = sql.SQL(
            "with CTE(hull_id, hull_name, hull_fuel_tank) "
            "as "
            "( "
            "select hull_id, hull_name, hull_fuel_tank "
            "from hull "
            ") "
            "select distinct hull_name, hull_id, "
            "avg(hull_fuel_tank) over (partition by hull_name) as \"Средняя стоимость\", "
            "min(hull_fuel_tank) over (partition by hull_name) as \"Минимальная стоимость\", "
            "max(hull_fuel_tank) over (partition by hull_name) as \"Максимальная стоимость\" "
            "from CTE;")
        result = self._fetch_sql(query)
        headings = ['Название учреждения', 'Телефон', 'Средняя стоимость', 'Минимальная стоимость',
                    'Максимальная стоимость']
        table = PrettyTable(headings)
        table.add_rows(result)
        print(table)


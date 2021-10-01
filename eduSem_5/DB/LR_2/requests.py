import db


# Объект обертки набора запросов
class Request:
    # Приватные данные
    _db = None

    # Инициализация объекта
    def __init__(self, db_source):
        # Установка значений в объект
        self._db = db_source

    # Получение распакованного SQL
    def _fetch_sql(self, query):
        return self._db.execute_query(query).fetchall()

    # 1. Инструкция SELECT, использующая предикат сравнения
    # Получить barrel_id пушек производством в Камбоджи
    def select_compare_predicate_barrel_id_from_cambodia(self):
        #  Формирование query
        query = "SELECT barrel_id FROM barrel " \
                + "WHERE barrel_manufacturer = 'Cambodia'"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 2. Инструкция SELECT, использующая предикат BETWEEN.
    # Получение barrel_id пушек с длинами между left_border и right_border
    def select_compare_between_barrel_id_from_barrel_run(self,
                                                         left_border,
                                                         right_border):
        #  Формирование query
        query = "SELECT barrel_id FROM barrel " \
                + "WHERE barrel_run BETWEEN " \
                + str(left_border) + " AND " \
                + str(right_border)

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 3. Инструкция SELECT, использующая предикат LIKE.
    # Получение barrel_id пушек с модификацияим BED
    def select_compare_like_barrel_id_from_barrel_name(self):
        #  Формирование query
        query = "SELECT barrel_id FROM barrel " \
                + "WHERE barrel_name LIKE '%BED%'"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 4. Инструкция SELECT, использующая предикат IN с вложенным подзапросом.
    # Получение hull_id основ танков из Италии с размером бака больше fuel_tank
    def select_in_hull_id_from_italy_with_hull_fuel_tank_more(self, hull_fuel_tank):
        #  Формирование query
        query = "SELECT hull_id, hull_manufacturer, hull_fuel_tank " \
                "FROM hull " \
                "WHERE hull_manufacturer IN (SELECT hull_manufacturer " \
                "FROM hull \
                    WHERE hull_manufacturer = 'Italy') \
                AND hull_fuel_tank > " + str(hull_fuel_tank)

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 5. Инструкция SELECT, использующая предикат EXISTS с вложенным подзапросом.
    # Получение hull_id основ танков, если существую танки из Италии
    def select_in_all_hull_id_from_italy_if_they_exists(self):
        #  Формирование query
        query = "SELECT hull_id, hull_manufacturer " \
                "FROM hull " \
                "WHERE EXISTS (SELECT hull_id " \
                "FROM hull \
                WHERE hull_manufacturer = 'Italy')"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 6. Инструкция SELECT, использующая предикат сравнения с квантором.
    # Получение hull_id основ танков по сравнению с квантором
    def select_kvantor_compare_all_hull_id_hull_length_19(self):
        #  Формирование query
        query = "SELECT hull_id, hull_manufacturer, hull_width, hull_length " \
                "FROM hull " \
                "WHERE hull_width > ALL (SELECT hull_width " \
                "FROM hull WHERE hull_length = 19)"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 7. Инструкция SELECT, использующая агрегатные функции в выражениях столбцов.
    # Получение hull_id основ танков по сравнению с квантором
    def select_kvantor_compare_all_hull_id_hull_length_19(self):
        #  Формирование query
        query = "SELECT hull_id, hull_manufacturer, hull_width, hull_length " \
                "FROM hull " \
                "WHERE hull_width > ALL (SELECT hull_width " \
                "FROM hull WHERE hull_length = 19)"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 8. Инструкция SELECT, использующая скалярные подзапросы в выражениях столбцов.
    def select_skalyar_requests(self):
        #  Формирование query
        query = "SELECT hull_id, hull_manufacturer, hull_width, hull_length, " \
                "( SELECT AVG(tower_weight) FROM tower WHERE tower.tower_diameter = hull.hull_length )  " \
                "AS AVG_TOWER_WEIGHT," \
                "( SELECT MIN(tower_weight) FROM tower WHERE tower.tower_diameter = hull.hull_length ) " \
                "AS MIN_TOWER_WEIGHT " \
                "FROM hull " \
                "WHERE hull_width > 1"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 9. Инструкция SELECT, использующая простое выражение CASE
    def select_easy_case(self):
        #  Формирование query
        query = "SELECT hull_id, hull_manufacturer, hull_width, hull_length, " \
                "CASE hull_manufacturer = 'United states' " \
                "WHEN hull_manufacturer = 'United states' THEN 'USA' " \
                "ELSE 'NOT USA' " \
                "END AS 'When' " \
                "FROM hull"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 10. Инструкция SELECT, использующая поисковое выражение CASE.
    def select_case(self):
        #  Формирование query
        query = "SELECT hull_id, hull_manufacturer, hull_width, " \
                "CASE " \
                "WHEN hull_width < 10 THEN 'Small' " \
                "WHEN hull_width < 50 THEN 'Mediul' " \
                "WHEN hull_width < 100 THEN 'Normal' ELSE 'Large' " \
                "END AS Width FROM hull "

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 11. Создание новой временной локальной таблицы из результирующего набора данных инструкции SELECT.
    def select_case(self):
        #  Формирование query
        query = "SELECT hull_id, hull_length, hull_width, hull_height " \
                "CAST(SUM(hull_length*hull_width*hull_height)AS square) AS SR INTO #BestLength " \
                "FROM hull " \
                "WHERE hull_id IS NOT NULL GROUP BY hull_id"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 12. Инструкция SELECT, использующая вложенные коррелированные подзапросы в качестве производных таблиц в
    # предложении FROM.
    def select_from_karelation(self):
        #  Формирование query
        query = "SELECT hull_length AS legth, hull_width as width " \
                "FROM hull H JOIN ( SELECT TOP 1 hull_id, SUM(hull_width) AS HW " \
                    "FROM hull " \
                    "GROUP BY hull_id " \
                    "ORDER BY HW DESC ) AS OD ON OD.hull_id = H.hull_id " \
                "UNION " \
                "SELECT hull_height AS HH, hull_name AS HN " \
                "FROM hull H JOIN ( SELECT TOP 1 hull_id, SUM(hull_width) AS HW " \
                    "FROM hull " \
                    "GROUP BY hull_id " \
                    "ORDER BY HW DESC ) AS OD ON OD.hull_id = H.hull_id "

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 13. Инструкция SELECT, использующая вложенные подзапросы с уровнем
    # вложенности 3.
    def select_level_in_three(self):
        #  Формирование query
        query = "SELECT hull_name AS HI, hull_fuel_tank AS HFT " \
                "FROM hull " \
                "WHERE hull_id = ( " \
                    "SELECT hull_id " \
                    "FROM hull " \
                    "GROUP BY hull_id " \
                    "HAVING SUM(hull_length) = (SELECT MAX(HL) " \
                                                    "FROM (SELECT SUM(hull_length) AS HL " \
                                                    "FROM hull " \
                                                    "GROUP BY hull_id" \
                                                    ") AS OD " \
                    ")" \
                ") "

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 14. Инструкция SELECT, консолидирующая данные с помощью предложения
    # GROUP BY, но без предложения HAVING
    def select_db_no_having(self):
        #  Формирование query
        query = "SELECT H.hull_id, H.hull_length, H.hull_name " \
                    "AVG(OD.hull_width) AS AvgHullWidth, " \
                    "MIN(OD.hull_width) AS MinHullWidth, " \
                "FROM hull H LEFT OUTER JOIN hull_to_tower HTT ON HTT.hull_id = P.hull_id " \
                "GROUP BY H.hull_id, H.hull_length, H.hull_name "

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 15. Инструкция SELECT, консолидирующая данные с помощью предложения
    # GROUP BY и предложения HAVING.
    def select_db_with_having(self):
        #  Формирование query
        query = "SELECT hull_id, AVG(hull_fuel_tank) AS AvgHFT " \
                "FROM hull H " \
                "GROUP BY hull_id " \
                "HAVING AVG(hull_fuel_tank) > ( SELECT AVG(hull_fuel_tank) AS MPrice " \
                    "FROM hull)"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 16. Однострочная инструкция INSERT, выполняющая вставку в таблицу одной
    # строки значений.
    def insert_new_tower(self):
        #  Формирование query
        query = "INSERT INTO tower " \
                    "(tower_id, tower_name, tower_manufacturer, tower_diametr, tower_weight) " \
                "VALUES (4000, 'TOWER_TGDBFYCHF_817', 'Thailand', 5, 3242437)"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 17. Многострочная инструкция INSERT, выполняющая вставку в таблицу
    # результирующего набора данных вложенного подзапроса.
    def insert_new_tower_nesting(self):
        #  Формирование query
        query = "INSERT INTO hull_to_tower " \
                    "(hull_to_tower_id, hull_id, tower_id) " \
                    "VALUES (" \
                        "SELECT ( SELECT MAX(hull_to_tower_id) + 1 " \
                            "FROM hull_to_tower ",\
                        18, \
                        "SELECT ( SELECT MAX(tower_id) " \
                            "FROM tower " \
                            "WHERE tower_diametr = 16 ) "

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 18. Простая инструкция UPDATE.
    def instruction_update(self):
        #  Формирование query
        query = "UPDATE hull " \
                "SET hull_fuel_tank = hull_fuel_tank * 1.5 " \
                "WHERE hull_manufacturer = 'Italy'"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 19. Инструкция UPDATE со скалярным подзапросом в предложении SET.
    def instruction_update_scaler_set(self):
        #  Формирование query
        query = "UPDATE hull_to_tower " \
                    "SET hull_id = ( SELECT hull_id " \
                        "FROM hull " \
                        "WHERE hull_manufacturer = 'Italy' " \
                "WHERE tower_id > 15"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 20. Простая инструкция DELETE.
    def instruction_update_scaler_set(self):
        #  Формирование query
        query = "DELETE hull WHERE hull_id = 18"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 21. Инструкция DELETE с вложенным коррелированным подзапросом в
    # предложении WHERE.
    def instruction_delete_scaler_set(self):
        #  Формирование query
        query = "UPDATE hull_to_tower " \
                    "SET hull_id = ( SELECT hull_id " \
                        "FROM hull " \
                        "WHERE hull_manufacturer = 'Italy' " \
                "WHERE tower_id > 15"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 22. Инструкция SELECT, использующая простое обобщенное табличное
    # выражение
    def select_table_reg(self):
        #  Формирование query
        query = "WITH CTE (hull_id, hull_width) AS " \
                    "( SELECT hull_length, COUNT(*) AS Total FROM hull " \
                    "WHERE hull_length > 15 " \
                    "GROUP BY hull_length ) " \
                "SELECT AVG(hull_width) AS AvgHW FROM hull"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 23. Инструкция SELECT, использующая рекурсивное обобщенное табличное
    # выражение.
    def select_recursive_union(self):

        create_table_query = "CREATE TABLE IF NOT EXIST available_to_buy (" \
                                "available_to_buy_id INTEGER NOT NULL, " \
                                "available_to_buy_good_type nvarchar(30) NOT NULL " \
                                "available_to_buy_price INTEGER NOT NULL " \
                                "available_to_buy_good_id INTEGER NOT NULL)"

        insert_table_query_1 = "INSERT INTO available_to_buy " \
                                "(available_to_buy_id, available_to_buy_good_type, available_to_buy_price, available_to_buy_good_id) " \
                                "VALUES " \
                                "1, 'hull', 5680000, 19"

        direct_report = "WITH DirectReports (available_to_buy_good_id, available_to_buy_good_type, available_to_buy_price, available_to_buy_good_id, RealD) AS " \
                        "( " \
                            "SELECT e.hull_id, e.hull_manufacturer AS RealD FROM hull AS e " \
                            "WHERE hull_id IS NOT NULL " \
                            "UNION ALL " \
                            "ON e.hull_id = d.available_to_buy_good_id " \
                        ")"

        self._db.execute_query(create_table_query)
        self._db.execute_query(insert_table_query_1)

        return self._fetch_sql(direct_report)

    # 24. Оконные функции. Использование конструкций MIN/MAX/AVG OVER()
    def win_func(self):
        #  Формирование query
        query = "SELECT H.hull_id, H.hull_manufacturer, H.hull_name, H.hull_length, " \
                    "AVG(H.hull_length) OVER(PARTITION BY H.hull_id, H.hull_name) AS AvgLength, " \
                    "MIN(H.hull_length) OVER(PARTITION BY H.hull_id, H.hull_name) AS MinLength, " \
                    "MAX(H.hull_length) OVER(PARTITION BY H.hull_id, H.hull_name) AS MaxLength " \
                "FROM hull H LEFT OUTER JOIN hull_to_tower HTT ON HTT.tower_id = 11"

        # Возврат полученного SQL
        return self._fetch_sql(query)

    # 25. Оконная функция для устранения дублей
    def func_deleting_dublicates(self):
        # Формирование query
        query = "SELECT * " \
                "FROM ( " \
                    "SELECT hull_id, hull_name, hull_manufacturer, " \
                    "ROW_NUMBER() OVER (PARTITION BY hull_id ORDER BY hull_id) as cnt " \
                    "FROM hull " \
                ") WHERE cnt = 1; "


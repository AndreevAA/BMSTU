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

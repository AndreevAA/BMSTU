import config


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
        # try:
        #     return self._db.execute_query(query).fetchall()
        # except:
        #     return config.empty_sql

    # Получение по номеру таска
    def get_by_task_number(self, task_number):
        query = str(open("task_" + str(task_number) + ".sql").read()) +\
                str(open("task_" + str(task_number) + "_exec.sql").read())

        # Возврат полученного SQL
        return self._fetch_sql(query)

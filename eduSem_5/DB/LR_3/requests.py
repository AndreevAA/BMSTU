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
        try:
            return self._db.execute_query(query).fetchall()
        except:
            return config.empty_sql


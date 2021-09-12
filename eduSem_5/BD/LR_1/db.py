import psycopg2
from psycopg2 import OperationalError
import config


# Объект БД
class DB:
    # Данные подключения к БД
    _db_name = None
    _db_host = None
    _db_port = None

    # Статус подключени к БД
    _connection_status = None
    _connection = None

    # Создание объекта
    def __init__(self, db_name, db_host, db_port):

        # Установка данных таблицы
        self._db_name = db_name
        self._db_host = db_host
        self._db_port = db_port

        # Установка статуса подключения
        self._connection_status = config.ERROR_STATUS

    # Создание подключения к БД
    def create_connection(self, db_user, db_password):

        # Статус ошибки подключения
        connection = config.ERROR_STATUS

        try:
            connection = psycopg2.connect(
                database=self._db_name,
                user=db_user,
                password=db_password,
                host=self._db_host,
                port=self._db_port,
            )
        except OperationalError as e:
            print(f"The error '{e}' occurred")

        # Вывод статуса ошибки в объект
        self._connection = connection

    # Операция проведения запроса к БД
    def _execute_query(self, query):
        self._connection.autocommit = True
        cursor = self._connection.cursor()
        try:
            cursor.execute(query)
            print("Query executed successfully")
        except OperationalError as e:
            print(f"The error '{e}' occurred")

    # Создание БД
    def create_database(self, database_name):

        #  Формирование query
        query = "CREATE DATABASE " + str(database_name)

        self._execute_query(query)

    # Удаление БД
    def drop_database(self, database_name):

        #  Формирование query
        query = "DROP DATABASE " + str(database_name)

        self._execute_query(query)

    # Создаение Таблицу
    def create_table(self, table_name, number_of_rows, rows):

        # Операция создания таблицы
        prepared_operation = ""

        # Наполение операции
        for number_of_row in range(number_of_rows):
            prepared_operation += rows[number_of_row].title + " " + rows[number_of_row].value

            if number_of_row < number_of_rows - 1:
                prepared_operation += ", "

        #  Формирование query
        query = "CREATE TABLE IF NOT EXISTS " + table_name + " ( " + prepared_operation + " )"

        self._execute_query(query)

    # Создаение Таблицу связей
    def create_table_connections(self, table_name, number_of_rows, rows, connections_information):

        # Операция создания таблицы
        prepared_operation = ""

        # Наполение операции
        for number_of_row in range(number_of_rows):
            prepared_operation += rows[number_of_row].title + " " + rows[number_of_row].value

            if number_of_row < number_of_rows - 1:
                prepared_operation += ", "

        #  Формирование query
        query = "CREATE TABLE IF NOT EXISTS " + table_name + " ( " \
                + prepared_operation + " " \
                + connections_information + \
                " )"

        self._execute_query(query)

    # Вставка записей
    def insert_query(self, table_name, fields, posts):

        print(posts)

        # Преобразование строки значений
        post_records = ", ".join(["%s"] * len(posts))

        print(post_records)

        # Формирование запроса на вставку записи
        query = "INSERT INTO " + str(table_name) + " " + str(fields) + " " + f"VALUES {posts}"

        self._execute_query(query)

    # Получение статуса соединения
    def get_connection_status(self):
        return self._connection_status

import db, config, requests


# Основной блок
def main():
    # Создание объект БД
    operation_db = db.DB(config.DB_NAME, config.DB_HOST, config.DB_PORT)

    # Подключение к БД
    operation_db.create_connection(config.DB_USER, config.DB_PASSWORD)

    # Запрос к БД
    request = requests.Request(operation_db)

    get_by_task_query = request.get_by_task_number(7)
    # print(get_by_task_query)

    for _task_number in range(1, 11):
        print("task_" + str(_task_number) + ": ")
        if 4 >= _task_number >= 9:
            try:
                get_by_task_query = request.get_by_task_number(_task_number).fetchall()
                print(get_by_task_query)
            except Exception:
                print("Som errors while SQL...")
        elif 4 < _task_number <= 8:
            try:
                request.get_by_task_number(_task_number)
            except Exception:
                print("Som errors while SQL...")
        print("---")


# Точка входа
if __name__ == '__main__':
    main()

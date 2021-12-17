import db, config

# Основной блок

import pandas as pd

import tasks


def main():

    # Создание объект БД
    operation_db = db.DB(config.DB_NAME, config.DB_HOST, config.DB_PORT)

    # Подключение к БД
    operation_db.create_connection(config.DB_USER, config.DB_PASSWORD)

    # # Перевод в CSV
    # sql_query = pd.read_sql_query('''select * from military_vehicles.public.hull''',
    #                               operation_db.connection)  # here, the 'conn' is the variable that contains your database connection information from step 2
    #
    # # Сохранение переведенного файла
    # df = pd.DataFrame(sql_query)
    # df.to_csv(r'/Users/andreevalexander/BMSTU/eduSem_5/DB/LR_7/data/hull.csv',
    #           index=False)

    # Объявления объекта меню
    # task_1.task_1()

    tasks.Tasks(operation_db)


# Точка входа
if __name__ == '__main__':
    main()

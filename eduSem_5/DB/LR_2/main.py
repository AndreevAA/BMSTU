import db, config, requests


# Основной блок
def main():
    # Создание объект БД
    operation_db = db.DB(config.DB_NAME, config.DB_HOST, config.DB_PORT)

    # Подключение к БД
    operation_db.create_connection(config.DB_USER, config.DB_PASSWORD)

    # Запрос к БД
    request = requests.Request(operation_db)

    # 1. Инструкция SELECT, использующая предикат сравнения
    # Получить barrel_id пушек производством в Камбоджи
    select_compare_predicate_barrel_id_from_cambodia_sql = request.select_compare_predicate_barrel_id_from_cambodia()

    # 2. Инструкция SELECT, использующая предикат BETWEEN.
    # Получение barrel_id пушек с длинами между left_border и right_border
    select_compare_between_barrel_id_from_barrel_run_sql = request.select_compare_between_barrel_id_from_barrel_run(5, 10)

    # 3. Инструкция SELECT, использующая предикат LIKE.
    # Получение barrel_id пушек с модификацияим BED
    select_compare_like_barrel_id_from_barrel_name_sql = request.select_compare_like_barrel_id_from_barrel_name()

    print(select_compare_like_barrel_id_from_barrel_name_sql)

# Точка входа
if __name__ == '__main__':
    main()

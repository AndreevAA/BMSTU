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

    # 4. Инструкция SELECT, использующая предикат IN с вложенным подзапросом.
    # Получение hull_id основ танков из Италии с размером бака больше fuel_tank
    select_in_hull_id_from_italy_with_hull_fuel_tank_more_sql = request.select_in_hull_id_from_italy_with_hull_fuel_tank_more(10)

    # 5. Инструкция SELECT, использующая предикат EXISTS с вложенным подзапросом.
    # Получение hull_id основ танков, если существую танки из Италии
    select_in_all_hull_id_from_italy_if_they_exists_sql = request.select_in_all_hull_id_from_italy_if_they_exists()

    # 6. Инструкция SELECT, использующая предикат сравнения с квантором.
    # Получение hull_id основ танков по сравнению с квантором
    select_kvantor_compare_all_hull_id_hull_length_19_sql = request.select_kvantor_compare_all_hull_id_hull_length_19()

    #
    select_skalyar_requests_sql = request.select_skalyar_requests()

    select_easy_case_sql = request.select_easy_case()

    print(select_easy_case_sql)


# Точка входа
if __name__ == '__main__':
    main()

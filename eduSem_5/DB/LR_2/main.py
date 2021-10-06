import db, config, requests


# Основной блок
def main():
    # Создание объект БД
    operation_db = db.DB(config.DB_NAME, config.DB_HOST, config.DB_PORT)

    # Подключение к БД
    operation_db.create_connection(config.DB_USER, config.DB_PASSWORD)

    # Запрос к БД
    request = requests.Request(operation_db)

    select_compare_predicate_barrel_id_from_cambodia_sql = request.select_compare_predicate_barrel_id_from_cambodia()
    select_compare_between_barrel_id_from_barrel_run_sql = request.select_compare_between_barrel_id_from_barrel_run(10, 15)
    select_compare_like_barrel_id_from_barrel_name_sql = request.select_compare_like_barrel_id_from_barrel_name()
    select_in_hull_id_from_italy_with_hull_fuel_tank_more_sql = request.select_in_hull_id_from_italy_with_hull_fuel_tank_more(18)
    select_in_all_hull_id_from_italy_if_they_exists_sql = request.select_in_all_hull_id_from_italy_if_they_exists()
    select_kvantor_compare_all_hull_id_hull_length_19_sql = request.select_kvantor_compare_all_hull_id_hull_length_19()
    select_kvantor_compare_all_hull_id_hull_length_sql = request.select_kvantor_compare_all_hull_id_hull_length()
    select_skalyar_requests_sql = request.select_skalyar_requests()
    select_easy_case_sql = request.select_easy_case()
    select_case_not_null_sql = request.select_case_not_null()
    select_from_karelation_sql = request.select_from_karelation()
    select_level_in_three_sql = request.select_level_in_three()
    select_db_no_having_sql = request.select_db_no_having()
    select_db_with_having_sql = request.select_db_with_having()
    insert_new_tower_sql = request.insert_new_tower()
    insert_new_tower_nesting_sql = request.insert_new_tower_nesting()
    instruction_update_sql = request.instruction_update()
    instruction_update_scaler_set_sql = request.instruction_update_scaler_set()
    # instruction_update_scaler_set_delete_sql = request.instruction_update_scaler_set_delete()
    # instruction_delete_scaler_set_sql = request.instruction_delete_scaler_set()
    select_table_reg_sql = request.select_table_reg()
    select_recursive_union_sql = request.select_recursive_union()
    win_func_sql = request.win_func()
    func_deleting_dublicates_sql = request.func_deleting_dublicates()

    print(select_compare_predicate_barrel_id_from_cambodia_sql)
    print(select_compare_between_barrel_id_from_barrel_run_sql)
    print(select_compare_like_barrel_id_from_barrel_name_sql)
    print(select_in_hull_id_from_italy_with_hull_fuel_tank_more_sql)
    print(select_in_all_hull_id_from_italy_if_they_exists_sql)
    print(select_kvantor_compare_all_hull_id_hull_length_19_sql)
    print(select_kvantor_compare_all_hull_id_hull_length_sql)
    print(select_skalyar_requests_sql)
    print(select_easy_case_sql)
    print(select_case_not_null_sql)
    print(select_from_karelation_sql)
    print(select_level_in_three_sql)
    print(select_db_no_having_sql)
    print(select_db_with_having_sql)
    print(insert_new_tower_sql)
    print(insert_new_tower_nesting_sql)
    print(instruction_update_sql)
    print(instruction_update_scaler_set_sql)
    print(select_table_reg_sql)
    print(select_recursive_union_sql)
    print(win_func_sql)
    print(func_deleting_dublicates_sql)


# Точка входа
if __name__ == '__main__':
    main()

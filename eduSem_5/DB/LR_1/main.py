from random import randint

import db, config, row, full_fillment


def main():
    # Создание объект БД
    operation_db = db.DB(config.DB_NAME, config.DB_HOST, config.DB_PORT)

    # Подключение к БД
    operation_db.create_connection(config.DB_USER, config.DB_PASSWORD)

    # # Добавление дополнительных столбцов
    # operation_db.add_columns("public.tower",
    #                          2,
    #                          [
    #                              row.Row("diameter", "FLOAT"),
    #                              row.Row("weight", "FLOAT")])

    # operation_db.add_columns("public.barrel",
    #                          1,
    #                          [
    #                              row.Row("radius", "FLOAT")])

    # Добавление данных
    for query in range(config.NUMBER_OF_HULLS_GENERATION):
        radius = randint(1, 60)
        run = randint(1, 25)

        operation_db.update("barrel",
                            ("radius", "run"),
                            (float(radius), float(run)),
                            "id = " + str(query))



    # # Добавление данных
    # for query in range(config.NUMBER_OF_HULLS_GENERATION):
    #     weight = randint(200, 6000000)
    #     diameter = randint(1, 5)
    #
    #     operation_db.update("tower",
    #                         ("weight", "diameter"),
    #                         (float(weight), float(diameter)),
    #                         "id = " + str(query))

    # operation_db.create_database("military_vehicles")

    # operation_db.create_table("manufactures", 3,
    #                           [row.Row("id", "SERIAL PRIMARY KEY"),
    #                            row.Row("name", "TEXT NOT NULL"),
    #                            row.Row("country", "TEXT NOT NULL")])
    #
    # operation_db.create_table("vehicles", 4,
    #                           [row.Row("id", "SERIAL PRIMARY KEY"),
    #                            row.Row("name", "TEXT NOT NULL"),
    #                            row.Row("type", "TEXT NOT NULL"),
    #                            row.Row("weight", "INTEGER"),
    #                            ])

    # operation_db.create_table("HULL", 3,
    #                           [row.Row("id", "SERIAL PRIMARY KEY"),
    #                            row.Row("name", "TEXT NOT NULL"),
    #                            row.Row("manufacturer", "TEXT NOT NULL")])

    # for hull_number in range(config.NUMBER_OF_HULLS_GENERATION):
    #
    #     temp_hull = full_fillment.HULL(hull_number)
    #     operation_db.insert_query("HULL",
    #                               "(id, name, manufacturer)",
    #                               (temp_hull.get_id(), temp_hull.get_name(), temp_hull.get_manufacturer()))
    #
    #
    # operation_db.create_table("TOWER", 3,
    #                           [row.Row("id", "SERIAL PRIMARY KEY"),
    #                            row.Row("name", "TEXT NOT NULL"),
    #                            row.Row("manufacturer", "TEXT NOT NULL")])
    #
    #
    # for tower_number in range(config.NUMBER_OF_HULLS_GENERATION):
    #
    #     temp_hull = full_fillment.TOWER(tower_number)
    #     operation_db.insert_query("TOWER",
    #                               "(id, name, manufacturer)",
    #                               (temp_hull.get_id(), temp_hull.get_name(), temp_hull.get_manufacturer()))
    #
    # operation_db.create_table("BARREL", 3,
    #                           [row.Row("id", "SERIAL PRIMARY KEY"),
    #                            row.Row("name", "TEXT NOT NULL"),
    #                            row.Row("manufacturer", "TEXT NOT NULL")])
    #
    #
    # for barrel_number in range(config.NUMBER_OF_HULLS_GENERATION):
    #
    #     temp_hull = full_fillment.BARREL(barrel_number)
    #     operation_db.insert_query("BARREL",
    #                               "(id, name, manufacturer)",
    #                               (temp_hull.get_id(), temp_hull.get_name(), temp_hull.get_manufacturer()))

    # operation_db.create_table_connections("HULL_TO_TOWER", 3,
    #                                       [row.Row("id", "SERIAL PRIMARY KEY"),
    #                                        row.Row("hull_id", "INTEGER NOT NULL"),
    #                                        row.Row("tower_id", "INTEGER NOT NULL")],
    #                                       "CONSTRAINT FK_hull_id FOREIGN KEY (hull_id) "
    #                                       "REFERENCES hull (id), "
    #                                       "CONSTRAINT FK_tower_id FOREIGN KEY (tower_id) "
    #                                       "REFERENCES tower (id)"
    #                                       )

    # hull_to_tower_id = 0
    # for hull_id in range(config.NUMBER_OF_HULLS_GENERATION):
    #     number_of_connections = randint(0, config.MAX_NUMBER_OF_CONNECTIONS)
    #
    #     for temp_number_of_connection in range(number_of_connections):
    #         tower_id = randint(0, config.NUMBER_OF_HULLS_GENERATION)
    #         input_data = "(" + str(hull_to_tower_id) + ", " + \
    #                      str(hull_id) + ", " + \
    #                     str(tower_id) + ")"
    #
    #         operation_db.insert_query("hull_to_tower",
    #                                   "(id, hull_id, tower_id)",
    #                                   input_data)
    #         hull_to_tower_id += 1

    # tower_to_barrel_id = 0
    # for tower_id in range(config.NUMBER_OF_HULLS_GENERATION):
    #     number_of_connections = randint(0, config.MAX_NUMBER_OF_CONNECTIONS)
    #
    #     for temp_number_of_connection in range(number_of_connections):
    #         barrel_id = randint(0, config.NUMBER_OF_HULLS_GENERATION)
    #         input_data = "(" + str(tower_to_barrel_id) + ", " + \
    #                      str(tower_id) + ", " + \
    #                      str(barrel_id) + ")"
    #
    #         operation_db.insert_query("tower_to_barrel",
    #                                   "(id, tower_id, barrel_id)",
    #                                   input_data)
    #         tower_to_barrel_id += 1

    # # Добавление дополнительных столбцов
    # # operation_db.add_columns("public.hull",
    # #                          1,
    # #                          [
    # #                           row.Row("fuel_tank", "FLOAT")])
    #
    # # Добавление данных
    # for query in range(config.NUMBER_OF_HULLS_GENERATION):
    #     length = randint(5, 25)
    #     width = randint(5, 25)
    #     height = randint(5, 25)
    #     fuel_tank = randint(5, 25)
    #     constructor = config.SURNAMES[randint(0, len(config.SURNAMES) - 1)]
    #
    #     operation_db.update("hull",
    #                         ("length", "width", "height", "fuel_tank"),
    #                         (float(length), float(width), float(height), float(fuel_tank)),
    #                         "id = " + str(query))

    # Добавление дополнительных столбцов
    # operation_db.add_columns("public.hull",
    #                          1,
    #                          [
    #                           row.Row("fuel_tank", "FLOAT")])

    # # Добавление данных
    # for query in range(config.NUMBER_OF_HULLS_GENERATION):
    #     length = randint(5, 25)
    #     width = randint(5, 25)
    #     height = randint(5, 25)
    #     fuel_tank = randint(5, 25)
    #     constructor = config.SURNAMES[randint(0, len(config.SURNAMES) - 1)]
    #
    #     operation_db.update("hull",
    #                         ("length", "width", "height", "fuel_tank"),
    #                         (float(length), float(width), float(height), float(fuel_tank)),
    #                         "id = " + str(query))



if __name__ == '__main__':
    main()

from random import randint

import db, config, row, full_fillment


def main():
    # Создание объект БД
    operation_db = db.DB(config.DB_NAME, config.DB_HOST, config.DB_PORT)

    # Подключение к БД
    operation_db.create_connection(config.DB_USER, config.DB_PASSWORD)

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

if __name__ == '__main__':
    main()

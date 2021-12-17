# https://nifi.apache.org/docs/nifi-docs/ html/getting-started.html

from faker import Faker
from random import randint, choice
import datetime
import time
import json

import db, config, hull


# Основной блок
def main():
    # Создание объект БД
    operation_db = db.DB(config.DB_NAME, config.DB_HOST, config.DB_PORT)

    # Подключение к БД
    operation_db.create_connection(config.DB_USER, config.DB_PASSWORD)

    faker = Faker()

    i = 0

    while True:
        obj = hull.Hull(i, faker.name(), choice(config.hull_manufacturer), randint(2000, 15000),
                        randint(2000, 15000), randint(2000, 15000), randint(10, 500))

        with open("data/hull_" + str(i) + "_" +
                  str(datetime.datetime.now().strftime("%d-%m-%Y_%H:%M:%S")) + ".json", "w") as f:
            print(json.dumps(obj.get()), file=f)

        i += 1
        time.sleep(10)

        print("END")


# Точка входа
if __name__ == '__main__':
    main()

import db, config, requests


# Основной блок
import menu


def main():
    # Создание объект БД
    operation_db = db.DB(config.DB_NAME, config.DB_HOST, config.DB_PORT)

    # Подключение к БД
    operation_db.create_connection(config.DB_USER, config.DB_PASSWORD)

    # Запрос к БД
    request = requests.Request(operation_db)

    # Объявления объекта меню
    menu.Menu(request)


# Точка входа
if __name__ == '__main__':
    main()

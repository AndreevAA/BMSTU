# Данные подключения к БД
DB_NAME = "military_vehicles"
DB_USER = "postgres"
DB_PASSWORD = "qwerty"
DB_HOST = "localhost"
DB_PORT = 5432

# Статусы ошибок
SUCCESS_STATUS = 0
ERROR_STATUS = 1
QUERY_EXECUTED_SUCCESSFULLY = 2

# Данные для генерации
MANUFACTURERS = ["", "", ""]
COUNTRIES = ['Abkhazia', 'Australia', 'Austria', 'Azerbaijan', 'острова', 'Albania', 'Algeria', 'Anguilla', 'Angola', 'Andorra', 'Argentina', 'Armenia', 'Aruba', 'Afghanistan', 'острова', 'Bangladesh', 'Barbados', 'Bahrain', 'Belarus', 'Belize', 'Belgium', 'Benin', 'Bulgaria', 'Bolivia', 'Botswana', 'Brazil', 'Brunei', 'Burundi', 'Bhutan', 'Vatican', 'United', 'Hungary', 'Venezuela', 'Тимор', 'Viet', 'Gabon', 'Haiti', 'Gambia', 'Ghana', 'Guadeloupe', 'Guatemala', 'Guinea', 'Guinea-Bissau', 'Germany', 'Gibraltar', 'Hong', 'Honduras', 'Grenada', 'Greenland', 'Greece', 'Georgia', 'Guam', 'Denmark', 'Dominica', 'Республика', 'Egypt', 'Zambia', 'Сахара', 'Zimbabwe', 'Israel', 'India', 'Indonesia', 'Jordan', 'Iraq', 'Iran', 'Ireland', 'Iceland', 'Spain', 'Italy', 'Yemen', 'Kazakhstan', 'Cambodia', 'Cameroon', 'Canada', 'Qatar', 'Kenya', 'Cyprus', 'Kyrgyzstan', 'Kiribati', 'China', 'Colombia', 'Costa', 'Cote', 'Cuba', 'Kuwait', 'Lao', 'Latvia', 'Lesotho', 'Liberia', 'Lebanon', 'Libyan', 'Lithuania', 'Liechtenstein', 'Luxembourg', 'Mauritius', 'Mauritania', 'Madagascar', 'Macedonia', 'Malawi', 'Malaysia', 'Mali', 'Maldives', 'Malta', 'Morocco', 'Mexico', 'Mozambique', 'Moldova', 'Monaco', 'Mongolia', 'Namibia', 'Nepal', 'Niger', 'Nigeria', 'Netherlands', 'Nicaragua', 'Зеландия', 'Norway', 'United', 'Oman', 'Pakistan', 'Panama', 'Paraguay', 'Peru', 'Poland', 'Portugal', 'Russia', 'Romania', 'San', 'Аравия', 'Senegal', 'Serbia', 'Singapore', 'Syrian', 'Slovakia', 'Slovenia', 'Somalia', 'Sudan', 'USA', 'Tajikistan', 'Thailand', 'Tanzania', 'Togo', 'Tunisia', 'Turkmenistan', 'Turkey', 'Uganda', 'Uzbekistan', 'Ukraine', 'Uruguay', 'Штаты', 'Fiji', 'Philippines', 'Finland', 'France', 'Croatia', 'Chad', 'Montenegro', 'Czech', 'Chile', 'Switzerland', 'Sweden', 'Sri', 'Ecuador', 'Eritrea', 'Estonia', 'Ethiopia', 'Jamaica', 'Japan']
NUMBER_OF_HULLS_GENERATION = 1000
MAX_NUMBER_OF_CONNECTIONS = 30
SURNAMES = ['Ivanov', 'Lasky', 'Li', 'Silmo', 'Jeff', 'James']

# Пустые данные
empty_sql = []

# Команды меню
MENU_TEXT = "0. Завершить программу.\n" \
            "1. Выполнить скалярный запрос.\n" \
            "2. Выполнить запрос с несколькими соединениями (JOIN).\n" \
            "3. Выполнить запрос с ОТВ(CTE) и оконными функциями.\n" \
            "4. Выполнить запрос к метаданным.\n" \
            "5. Вызвать скалярную функцию (написанную в третьей лабораторной работе)\n" \
            "6. Вызвать многооператорную или табличную функцию (написанную в третьей лабораторной работе)\n" \
            "7. Вызвать хранимую процедуру (написанную в третьей лабораторной работе).\n" \
            "8. Вызвать системную функцию или процедуру;\n" \
            "9. Создать таблицу в базе данных, соответствующую тематике БД.\n" \
            "10. Выполнить вставку данных в созданную таблицу с использованием инструкции INSERT или COPY.\n" \

# Текст приглашения к вводу
WELCOME_INPUT_TEXT = "\nВыберите пункт меню: "

# Сообщение об ошибке ввода пункта меню
INPUT_POINT_ERROR = "\nВы допустили ошибку при вводе пункта меню!\n"

# Сообщение о завершении программы
EXIT_PROGRAM = "\nВы завершили работу программы.\n"

# Объект выборки
ID_LESS = 10

# Объем нижней границы танка топлива
B_FUEL_TANK = 19

hull_manufacturer = ["Russia", "USA", "UK", "UAI", "China", "Ukraine"]

"""
    Лабораторная работа №10
    Андреев Александр Алексеевич ИУ7-14Б.
    Тема: "Учет товаров"
"""

# "F:/МГТУ им. Баумана ИУ7-14Б Андреев А.А/Программирование/Лабораторная работа 25.11.2019/Часть 1/DB1.txt"

# 1 Создание новой таблицы
def create_file():
    print("Если введете имя, которое уже используется,")
    print("тогда база данных будет перезаписана на пустую")
    par = 0
    name = input("Введите имя базы данных: ")
    try:
        temp = open(name, "r")
        par = 1
    except:
        pass
    if par == 1:
        print("База с таким именем уже существует, перезаписать на новую? ")
        temp = int(input("Введите 1, если да, и 0, если нет: "))
        if temp == 1:
            print()
            print("Готово!")
            print()
            # Открытие файла на запись
            f = open('{:}'.format(name), 'w')
            
            # Дозаписывание названия колонок
            f.write("Название Количество Цена\n")
            
            # Закрытие файла
            f.close()
        
    # Возвращение имени базы данных
    return name
    
# 2 Открытие существующий базы данных
def open_file():
    name = input("Введите имя базы данных: ")
    # Проверка на ошибку
    try:
        # Открытие файла на чтение
        f = open('{:}'.format(name), 'r')
        
        # Закрытие файла
        f.close()
        
        print()
        print("Готово!")
        print()
        # Возвращение имени базы данных
        return name

    # В случае ошибки
    except:
        print()
        print("Такой базы данных нет!")
        print()
        
        # Возвращаем пустышку для проверки
        return None
    
# 3 Добавление записи
def add_note(name):
    # Открываем файл на дозапись
    f = open('{:}'.format(name), 'a')
    
    print("Введите Название, кол-во, цену:")
    # Проверка на ошибку
    try:
        a = input("Название: ")
        b = int(input("Количество: "))
        c = float(input("Цена: "))
        f.write("{:} {:} {:}\n".format(a, b, c))
        
    # В случае ошибки
    except:
        print("Вы ввели неверные данные")

    # Закрытие файла
    f.close()
    
    print()
    print("Готово!")
    print()

# 4 Поиск по 1 параметру
def find_one(name):
    param = input("Введите название: ")
    # Открываем файл на чтение
    f = open('{:}'.format(name), 'r')

    # Проверка на совпадение
    for line in f:
        a, b, c = line.split()
        
        # Случай совпадения
        flag = 1
        if a == param:
            print()
            print("{:} {:} {:}\n".format(a, b, c))
            flag = 0
        
    # Случай несовпадения
    if flag:
        print()
        print("Нет такой записи\n")
        
    print("Готово!")
    print()
    # Закрытие файла
    f.close()

# 5 Поиск по 2 параметрам
def find_two(name):
    print("Введите название, кол-во: ")
    param1 = input("Введите название: ")
    param2 = input("Введите кол-во: ")
    # Открываем файл на чтение
    f = open('{:}'.format(name), 'r')
    # Проверка на совпадение
    flag = 1
    for line in f:
        a, b, c = line.split()
        # Случай совпадения
        if a == param1 and b == param2:
            print()
            print("{:} {:} {:}\n".format(a, b, c))
            flag = 0

        # Случай несовпадения
    if flag:
        print()
        print("Нет такой записи\n")

    print("Готово!")
    print()
    # Закрытие файла
    f.close()
    
# 6 Вывод всех записей из файла
def output_file(name):
    # Открытие файл на чтение
    f = open('{:}'.format(name), 'r')

    # Флаг на наличие записей
    flag = 1

    # Проверка на записи
    flag_z = 0
    for line in f:
        flag_z = 1
        break

    # Закрытие файла
    f.close()

    # Открытие файла на чтение
    f = open('{:}'.format(name), 'r')
    
    # Вывод построчно записи
    if flag_z:
        print("┌───────────┬───────────┬───────────┐")
    fl = 0
    for line in f:
        if flag_z:
            flag_z = 0
        else:
            print("├───────────┼───────────┼───────────┤")
        a, b, c = line.split()
        print("│{:11}│{:11}│{:11}│\n".format(a, b, c), end="")
        flag = 0
        fl = 1
    if fl:
        print("└───────────┴───────────┴───────────┘")

    # Проверка на отсутствие записей
    if flag:
        print("Записей нет!")

    print()
    # Закрытие файла
    f.close()

# Функция Main
def main():
    print("Добро пожаловать!")
    print()

    # Флаг выбора функции
    flag = 1

    # Флаг на наличие базы данных
    flag_baza = 0
    
    while flag:
        print("1 - Cоздания новой базы данных")
        print("2 - Открытие существующий базы данных")
        print("3 - Добавление записи в базе данных")
        print("4 - Поиска по 1-ому параметру")
        print("5 - Поиска по 2-м параметрам")
        print("6 - Вывод всех записей из базы данных")
        print("0 - Выход")

        # Проверка на правильный ввод
        try:
            flag = int(input("Введите номер нужной функции: "))

        # Выполнение в случае ошибки
        except:
            print("Введено неверно")
            print()
            continue
        
        print()
        # Проверка на выбранную функцию
        # 1 Функция
        if flag == 1:
            flag_baza = 1
            name = create_file()
            
        # 2 Функция
        elif flag == 2:
            name = open_file()
            if name != None:
                flag_baza = 1
                
        # 3 Функция
        elif flag == 3:
            # Проверка на наличие базы данных
            if flag_baza:
                add_note(name)
                
            else:
                print("Вы не указали базу данных!")
                name = open_file()
                if name != None:
                    flag_baza = 1
                    
        # 4 Функция
        elif flag == 4:
            # Проверка на наличие базы данных
            if flag_baza:
                find_one(name)
                
            else:
                print("Вы не указали базу данных!")
                name = open_file()
                if name != None:
                    flag_baza = 1
                    
        # 5 Функция
        elif flag == 5:
            # Проверка на наличие базы данных
            if flag_baza:
                find_two(name)
                
            else:
                print("Вы не указали базу данных!")
                name = open_file()
                if name != None:
                    flag_baza = 1
                    
        # 6 Функция
        elif flag == 6:
            # Проверка на наличие базы данных
            if flag_baza:
                output_file(name)
                
            else:
                print("Вы не указали базу данных!")
                name = open_file()
                if name != None:
                    flag_baza = 1
                    
        else:
            if flag != 0:
                print("Попробуйте еще раз!")
            if flag == 0:
                print("Работа программы завершена!")
            print()

main()



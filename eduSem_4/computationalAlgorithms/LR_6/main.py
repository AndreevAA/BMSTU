# Численное интегрирование.
# Андреев Александр ИУ7-44Б.

# Внешнее связывание 
import inputOutput, globals, operations 

# Управляющая функция программы
def main():
    # Установка стартовых значений
    globals.x, globals.y = get_table(globals.xStartData, globals.xHeight, globals.xAmount);

    # Установка таблицы
    table = PrettyTable()

    # Операции с заполнением таблицы
    table = inputOutput.fillTable(globals.x, globals.y, globals.xHeight, globals.xAmount);

    # Вывод результата
    inputOutput.outResult(table);

if __name__ == '__main__':
    main()

# Интерполяция кубическими сплайнами.
# Андреев Александр Алексеевич ИУ7-44Б.

import inputOutput, operations

# Коренная функция программы
def main():

    # Подгрузка данных и ввод с клавиатуры
    inputX, inputDataTable = inputOutput.inputDataComparator(); 

    # Выполнение алгоритмов.
    founded_root = float("%.4f" % (operations.interpolation(inputDataTable, inputX)))
    exact_root = float("%.4f" % operations.func(inputX))

    # Вывод результата на экран
    inputOutput.outputResults(founded_root, exact_root);

if __name__ == '__main__':
    main()
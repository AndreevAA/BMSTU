# Интерполяция кубическими сплайнами.
# Андреев Александр Алексеевич ИУ7-44Б.

import inputOutput, operations

# Коренная функция программы
def main():
    inputX, inputDataTable = inputOutput.inputDataComparator(); 

    # Выполнение алгоритмов.
    founded_root = float("%.4f" % (operations.interpolation(inputDataTable, inputX)))
    exact_root = float("%.4f" % operations.func(inputX))
    print("\nНайденное значение: ", founded_root)
    print("Точное значение:    ", exact_root)
    print("Относительная ошибка: %.2f" % abs(abs(exact_root - founded_root) / exact_root * 100), '%')


if __name__ == '__main__':
    main()
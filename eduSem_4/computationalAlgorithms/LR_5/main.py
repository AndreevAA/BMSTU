import operations, inputOutput

# Численное интегрирование.
# Андреев Александр ИУ7-44Б.

# Внешнее связывание 
import inputOutput, globals, operations 

# Управляющая функция программы
def main():
    # Чтение входных данных из строки
    N, M, T = inputOutput.getInputData();

    # Вывод результата
    inputOutput.outResult(N, M, T);

if __name__ == '__main__':
    main()


# Наилучшее среднеквадратичное приближние.
# Андреев Александр ИУ7-44Б.

# Импортирование библиотек
import matplotlib.pyplot as plt

# Внешнее связывание 
import inputOutput, globals, operations 

# Управляющая функция программы
def main():
    # Чтение данных из файла
    inputTable = inputOutput.getDataFromFile(globals.FILENAME);

    # Чтение максимального значения степени
    inputMaximumPolynomialDegree = inputOutput.getMaximumPolynomialDegree();
    
    # Непосредственное вычисление и отрисовка
    inputOutput.drawGraph(inputTable, inputMaximumPolynomialDegree)

if __name__ == '__main__':
    main()

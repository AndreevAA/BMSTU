import operations
import matplotlib.pyplot as plt

# Чтение данных из файла
def getDataFromFile(filename):
	tempInputTable = list();

	tempInputFileData = open(filename).read().split("\n")

	for tempCur in range(len(tempInputFileData)):
		tempInputTable.append(list(map(int, (tempInputFileData[tempCur]).split())));

	return tempInputTable;

# Получение максимальной степени полинома
def getMaximumPolynomialDegree():
	tempInputMaximumPolynomialDegree = int(input("Введите максимальную степень полинома: "));

	if (tempInputMaximumPolynomialDegree < 0):
		exit();

	return tempInputMaximumPolynomialDegree;

# Вывод на графика на экран
def drawGraph(inputTable, inputMaximumPolynomialDegree):
    dx = (inputTable[-1][0] - inputTable[0][0]) / 10

    fig, ax = plt.subplots()

    for firstTempCur in range(1, inputMaximumPolynomialDegree + 1):
        aCoeffsArray = operations.getGaussianEquation(operations.fillSLAY(inputTable, inputMaximumPolynomialDegree))

        y = []; x = []
        
        secondTempCur = inputTable[0][0] - dx

        while secondTempCur <= inputTable[-1][0] + dx:
            tempBuffer = 0

            for tempCoeff in range(0, firstTempCur + 1):
                tempBuffer += operations.fi(secondTempCur, tempCoeff) * aCoeffsArray[tempCoeff]

            y.append(tempBuffer); x.append(secondTempCur)

            secondTempCur += 0.01

        ax.plot(x, y, label='n = ' + str(firstTempCur))
    
    ax.plot([a[0] for a in inputTable], [a[1] for a in inputTable], 'o', label='Date')
    
    plt.title("Наилучшее среднеквадратичное приближние.")
    plt.legend()
    plt.grid(True)
    plt.ylabel("Y")
    plt.xlabel("X")

    plt.show()

import globals

# Чтение таблицы из файла
def getFileInputTableData(resFileInputTableData, numberOfRows, numberOfStrings, fileName):
	try:
		tempListOfStrings = str(open(fileName, "r").read()).split("\n");
	
		tempXValues = list(map(int, tempListOfStrings[0].split()));
		tempYValues = list(map(int, tempListOfStrings[1].split()));
		tempZValuesStrings = tempListOfStrings[2:];

		tempZValues = [];

		for tempString in tempZValuesStrings:
			tempZValues.append(list(map(int, tempString.split())))

		for tempX in range(len(tempXValues)):
			for tempY in range(len(tempYValues)):
				resFileInputTableData.append(globals.Point(tempXValues[tempX], tempYValues[tempY], tempZValues[tempX][tempY]));

		return globals.SUCCESS_STATUS;
	except:
		return globals.ERROR_STATUS;

# Получение степени апроксимации
def getLevelOfAproximation(nx, ny):
	try:
		nx, ny = list(map(int, input("Введите nx, ny: ").split()));
		return globals.SUCCESS_STATUS;
	except:
		return globals.ERROR_STATUS;

# Получение степени апроксимации
def getValuesOfArguements(x, y):
	try:
		x, y = list(map(int, input("Введите x, y: ").split()));
		return globals.SUCCESS_STATUS;
	except:
		return globals.ERROR_STATUS;


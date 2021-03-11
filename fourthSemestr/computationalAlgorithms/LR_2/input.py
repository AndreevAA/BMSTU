import globals

# Чтение таблицы из файла
def getFileInputTableData(resFileInputTableData, numberOfRows, numberOfStrings, fileName):
	try:
		tempListOfStrings = str(open(fileName, "r").read()).split("\n");
		for tempString in tempListOfStrings:
			resFileInputTableData.append(list(map(int, tempString.split())))
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


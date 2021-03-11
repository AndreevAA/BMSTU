# Интерполяция таблично заданных функций полиномом Ньютона.
# Андреев Александр Алексеевич ИУ7-44Б.

# Статусы ошибок
ERROR_STATUS = 1
SUCCESS_STATUS = 0

# Степени апроксимации
nx = 0;
ny = 0;

# Считанные значения x, y
x = 0;
y = 0;

# Данные файла
resFileInputTableData = list();

# Чтение таблицы из файла
def getFileInputTableData(resFileInputTableData, numberOfRows, numberOfStrings, fileName):
	try:
		tempListOfStrings = str(open(fileName, "r").read()).split("\n");
		for tempString in tempListOfStrings:
			resFileInputTableData.append(list(map(int, tempString.split())))
		return SUCCESS_STATUS;
	except:
		return ERROR_STATUS;

# Получение степени апроксимации
def getLevelOfAproximation(nx, ny):
	try:
		nx, ny = list(map(int, input("Введите nx, ny: ").split()));
		return SUCCESS_STATUS;
	except:
		return ERROR_STATUS;

# Получение степени апроксимации
def getValuesOfArguements(x, y):
	try:
		x, y = list(map(int, input("Введите x, y: ").split()));
		return SUCCESS_STATUS;
	except:
		return ERROR_STATUS;

# Информирование о статусе завершения работы программы
def outEndWorkingStatus(inputEndWorkingStatus):
	if (inputEndWorkingStatus == SUCCESS_STATUS):
		print("Программа завершила работу корректно.");
		return inputEndWorkingStatus;
	print("Во время исполнения программы возникли ошибки.");
	return inputEndWorkingStatus;

# Основная функция программы
def main():
	if (getFileInputTableData(resFileInputTableData, 5, 5, "inputData.txt") == ERROR_STATUS):
		return outEndWorkingStatus(ERROR_STATUS);

	if (getLevelOfAproximation(nx, ny) == ERROR_STATUS):
		return outEndWorkingStatus(ERROR_STATUS);

	if (getValuesOfArguements(x, y) == ERROR_STATUS):
		return outEndWorkingStatus(ERROR_STATUS);

	return outEndWorkingStatus(SUCCESS_STATUS);

if __name__ == '__main__':
    main()



# Интерполяция таблично заданных функций полиномом Ньютона.
# Андреев Александр Алексеевич ИУ7-44Б.

import input, globals, checks, interpolation

# Основная функция программы
def main():
	if (input.getFileInputTableData(globals.resFileInputTableData, 5, 5, "inputData.txt") == globals.ERROR_STATUS):
		return checks.outEndWorkingStatus(globals.ERROR_STATUS);

	if (input.getLevelOfAproximation(globals.nx, globals.ny) == globals.ERROR_STATUS):
		return checks.outEndWorkingStatus(globals.ERROR_STATUS);

	if (input.getValuesOfArguements(globals.x, globals.y) == globals.ERROR_STATUS):
		return checks.outEndWorkingStatus(globals.ERROR_STATUS);

	founded_root = float("%.7f" % interpolation.interpolation(globals.resFileInputTableData, globals.x, globals.y, globals.nx, globals.ny))
	exact_root = float("%.7f" % interpolation.getFunction(globals.x, globals.y))

	print("\nНайденное значение: ", founded_root)
	print("Точное значение:    ", exact_root)

	return checks.outEndWorkingStatus(globals.SUCCESS_STATUS);

if __name__ == '__main__':
    main()



# Интерполяция таблично заданных функций полиномом Ньютона.
# Андреев Александр Алексеевич ИУ7-44Б.

import input_output, globals, checks, interpolation

# Основная функция программы
def main():
	if (input_output.getFileInputTableData(globals.resFileInputTableData, 5, 5, "inputData.txt") == globals.ERROR_STATUS):
		return checks.outEndWorkingStatus(globals.ERROR_STATUS);

	if (input_output.getLevelOfAproximation(globals.nx, globals.ny) == globals.ERROR_STATUS):
		return checks.outEndWorkingStatus(globals.ERROR_STATUS);

	if (input_output.getValuesOfArguements(globals.x, globals.y) == globals.ERROR_STATUS):
		return checks.outEndWorkingStatus(globals.ERROR_STATUS);

	if (interpolation.getTrasmittedTable(globals.dataCompRow, globals.resFileInputTableData) == globals.ERROR_STATUS):
		return checks.outEndWorkingStatus(globals.ERROR_STATUS);

	if (interpolation.getComparatorStatus(globals.dataCompRow, globals.resFileInputTableData, globals.x, globals.y, globals.nx, globals.ny, globals.functionValue, globals.newtonInterpolationValue) == globals.ERROR_STATUS):
		return checks.outEndWorkingStatus(globals.ERROR_STATUS);

	input_output.outlineInterpolationCountingResult(globals.functionValue, globals.newtonInterpolationValue);

	return checks.outEndWorkingStatus(globals.SUCCESS_STATUS);

if __name__ == '__main__':
    main()



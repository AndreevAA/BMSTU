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

# Удобное для сдвига курсоров представление данных
dataCompRow = [[], [], []];

# Количество столбцов
numberOfColls = 5;

# Результаты вычисления
functionValue = 0
newtonInterpolationValue = 0

class Point():
	def __init__(self, xValue, yValue, zValue):
	    self.xValue = xValue
	    self.yValue = yValue
	    self.zValue = zValue



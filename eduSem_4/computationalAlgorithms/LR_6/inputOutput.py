import operations

def outResult(table):
	print(table);

def fillTable(x, y, xHeight, xAmount):
	table = PrettyTable()
	
	table.add_column("X", x)
	table.add_column("Y", y)
	table.add_column("Односторонняя", left_side_diff(y, xHeight))
	table.add_column("Центральная", center_diff(y, xHeight))
	table.add_column("Рунге с использованием односторонней производной", Runge_left_side(y, xHeight))
	table.add_column("С выравнивающими переменными", Runge_center(y,x, xHeight))
	table.add_column("Вторая разностная производная", second_diff(y, xHeight))

	return table;
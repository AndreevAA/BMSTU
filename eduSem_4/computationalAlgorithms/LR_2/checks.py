import globals

# Информирование о статусе завершения работы программы
def outEndWorkingStatus(inputEndWorkingStatus):
	if (inputEndWorkingStatus == globals.SUCCESS_STATUS):
		print("Программа завершила работу корректно.");
		return inputEndWorkingStatus;
	print("Во время исполнения программы возникли ошибки.");
	return inputEndWorkingStatus;

	
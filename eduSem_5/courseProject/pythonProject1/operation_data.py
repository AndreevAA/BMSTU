# Операционные данные работы приложения в единой структуре обращения
class OperationData:

    # Загруженные детали
    details = None

    # Создание объекта
    def __init__(self):
        self.details = list()

    # Добавление новой детали
    def add_detail(self, detail):
        self.details.append(detail)

    # Очистка списка деталей
    def clear_all_details(self):
        self.details = list()

    # Очистка определенной детели из списка
    def clear_one_detail_by_uid(self, uid):
        number = 0

        print("BEFORE DELETE", len(self.details))
        for temp_number in range(len(self.details)):
            if self.details[temp_number].uid == uid:
                number = temp_number
                break

        self.details = self.details[:number] + self.details[number+1:]
        print("AFTER DELETE", len(self.details))

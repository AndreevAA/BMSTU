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

    # Перемещение детали
    def move_right_by_uid(self, uid):
        for temp_number in range(len(self.details)):
            if self.details[temp_number].uid == uid:
                self.details[temp_number].move_right()
                break

    # Перемещение детали
    def move_left_by_uid(self, uid):
        for temp_number in range(len(self.details)):
            if self.details[temp_number].uid == uid:
                self.details[temp_number].move_left()
                break

    def move_top_by_uid(self, uid):
        for temp_number in range(len(self.details)):
            if self.details[temp_number].uid == uid:
                self.details[temp_number].move_top()
                break

    def move_bottom_by_uid(self, uid):
        for temp_number in range(len(self.details)):
            if self.details[temp_number].uid == uid:
                self.details[temp_number].move_bottom()
                break

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

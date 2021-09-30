
class Graphic:

    # Название графика
    _name = None

    # Массив данных графика
    _data = None

    # Инициализация объекта
    def __init__(self, name, data):
        self._name = name
        self._data = data

    # Получение названия графика
    def get_name(self):
        return self._name

    # Получение массива данных график
    def get_data(self):
        return self._data
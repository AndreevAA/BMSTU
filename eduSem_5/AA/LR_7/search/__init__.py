# Базовый класс поиска
class Search:

    # Объект словаря
    _dictionary = None

    # Объект поиска
    _element = None

    # Время поиска
    _time = None

    # Найденная запись
    _record = None

    # Иницализация словаря
    def __init__(self, _dictionary, _element):
        self._dictionary = _dictionary
        self._element = _element

    # Получение времени поиска
    @property
    def time(self):
        return self._time

    @property
    def elem(self):
        return self._element

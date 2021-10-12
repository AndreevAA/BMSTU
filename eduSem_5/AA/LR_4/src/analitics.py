# Подключение настроек
import __config__

# Импортирование библиотечных методов
from time import *


# Объект аналитики выполнения объекта кода
class Analytics:
    # Результата вычисления аналитики
    _result = __config__.ZERO_COUNTER

    # Публичная функция получения результата аналитики
    def get_result(self):
        return self._result * 1000


# Объект вычисления процессорного времени
class ProcessorTime(Analytics):
    # Приватные данные вычислений
    _start_processor_time = None
    _end_processor_time = None

    # Создание объекта
    def __init__(self):
        self._start_processor_time = __config__.ZERO_COUNTER
        self._end_processor_time = __config__.ZERO_COUNTER

    # Установка отсечки старта блока программы
    def set_start_processor_time(self):
        self._start_processor_time = clock()

    # Установка отсечки окончания блока программы
    def set_end_processor_time(self):
        self._end_processor_time = clock()
        self._update_result()

    # Приватный модуль обновления результата вычислений процессорного времени
    def _update_result(self):
        self._result = self._end_processor_time - self._start_processor_time

from random import randint

import config
import uploading


# Объект Детали
class Detail:
    # Публичные поля детали
    name = None
    position = None
    color = None

    # Приватные поля детали
    _canvas = None
    _components_list = None

    # Уникальный номер элемента
    uid = None

    # Создание Детали
    def __init__(self, name, position, color, canvas, components_list):
        self.name = name
        self.position = position
        self.color = color
        self._canvas = canvas
        self._components_list = components_list
        self.uid = randint(100000, 999999)

    # Отрисовка Детали
    def draw(self, canvas):
        planes = list()
        for d_component in self._components_list:
            d_component.draw(planes, canvas)

    def move_right(self):
        self.position.update_right(config.STEP)

        for temp_component in self._components_list:
            temp_component.move_right()

    def move_left(self):
        self.position.update_left(config.STEP)

        for temp_component in self._components_list:
            temp_component.move_left()

    def move_top(self):
        self.position.update_top(config.STEP)

        for temp_component in self._components_list:
            temp_component.move_top()

    def move_bottom(self):
        self.position.update_bottom(config.STEP)

        for temp_component in self._components_list:
            temp_component.move_bottom()


# Объект виртуализации детали
class VirtualizeDetail:
    canvas = None

    def __init__(self, canvas):
        self.canvas = canvas

    def cube(self):
        # Загрузка
        loader = uploading.BaseLoader(
            "/Applications/BMSTU_practise_2021/pythonProject/models_packs/игрушка_кубик_1.txt")

        # Формирование детали
        detail_cube = Detail(loader.getDetailName(),
                             loader.getDetailPosition(),
                             loader.getDetailColor(),
                             self.canvas,
                             loader.getListOfComponents())

        return detail_cube

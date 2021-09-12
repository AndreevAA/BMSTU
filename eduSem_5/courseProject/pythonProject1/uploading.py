import config, vertex, component
import detail


class BaseLoader:
    # Индексатор считывающей строки
    _scan_index = 0

    # Общие данные детали
    _detail_name = None
    _detail_color = None
    _detail_position = None

    # Данные компонентов детали
    _number_of_components = None
    _list_of_components = None

    # Файловые данные
    _file_data = None

    # Статус ошибки загрузки
    _error_status = config.SUCCESS_STATUS

    # Создание объекта загрузки
    def __init__(self, filename):
        # Получение массив строк файла
        self._file_data = open(filename, 'r').read().split("\n")

        # Установка нулевого количества
        self._detail_name = ""
        self._number_of_components = 0
        self._list_of_components = list()

        # Получение общей информации о детали
        self._error_status = self._readDetailInfo()

        # Получение информации о компонентах детали
        if self._error_status == config.SUCCESS_STATUS:
            self._error_status = self._readDetailComponentsInfo()

    # Чтение общих данных детали
    def _readDetailInfo(self):
        try:
            self._detail_name = self._file_data[self._scan_index]
            self._scan_index += 1

            self._detail_color = self._file_data[self._scan_index]
            self._scan_index += 1

            detail_position_x, detail_position_y, detail_position_z = list(
                map(int, self._file_data[self._scan_index].split()))
            self._detail_position = vertex.Vertex(
                detail_position_x,
                detail_position_y,
                detail_position_z, self._detail_color)

            self._scan_index += 1

            return config.SUCCESS_STATUS
        except ():
            return config.ERROR_STATUS

    # Чтение данных компонетов детали
    def _readDetailComponentsInfo(self):
        try:
            self._number_of_components = int(self._file_data[self._scan_index])
            self._scan_index += 1

            self._list_of_components = self._readListOfComponents()

            return config.SUCCESS_STATUS
        except ():
            return config.ERROR_STATUS

    # Чтение списка компонентов
    def _readListOfComponents(self):
        list_of_components = list()

        for component_number in range(self._number_of_components):

            # Получение названия компоненты
            component_type = self._file_data[self._scan_index]
            self._scan_index += 1

            print("component_type", component_type)

            # Получение позиции компоненты
            component_position = list()

            component_position_x_0, component_position_y_0, component_position_z_0 = list(
                map(int, self._file_data[self._scan_index].split()))
            component_position_0 = vertex.Vertex(component_position_x_0, component_position_y_0, component_position_z_0,
                                               self._detail_color)
            self._scan_index += 1

            component_position_x_1, component_position_y_1, component_position_z_1 = list(
                map(int, self._file_data[self._scan_index].split()))
            component_position_1 = vertex.Vertex(component_position_x_1, component_position_y_1, component_position_z_1,
                                               self._detail_color)
            self._scan_index += 1

            component_position_x_2, component_position_y_2, component_position_z_2 = list(
                map(int, self._file_data[self._scan_index].split()))
            component_position_2 = vertex.Vertex(component_position_x_2, component_position_y_2, component_position_z_2,
                                               self._detail_color)
            self._scan_index += 1

            component_position_x_3, component_position_y_3, component_position_z_3 = list(
                map(int, self._file_data[self._scan_index].split()))
            component_position_3 = vertex.Vertex(component_position_x_3, component_position_y_3, component_position_z_3,
                                               self._detail_color)
            self._scan_index += 1

            component_position_x_4, component_position_y_4, component_position_z_4 = list(
                map(int, self._file_data[self._scan_index].split()))
            component_position_4 = vertex.Vertex(component_position_x_0, component_position_y_4, component_position_z_4,
                                               self._detail_color)
            self._scan_index += 1

            component_position_x_5, component_position_y_5, component_position_z_5 = list(
                map(int, self._file_data[self._scan_index].split()))
            component_position_5 = vertex.Vertex(component_position_x_5, component_position_y_5, component_position_z_5,
                                               self._detail_color)
            self._scan_index += 1

            component_position_x_6, component_position_y_6, component_position_z_6 = list(
                map(int, self._file_data[self._scan_index].split()))
            component_position_6 = vertex.Vertex(component_position_x_6, component_position_y_6, component_position_z_6,
                                               self._detail_color)
            self._scan_index += 1

            component_position_x_7, component_position_y_7, component_position_z_7 = list(
                map(int, self._file_data[self._scan_index].split()))
            component_position_7 = vertex.Vertex(component_position_x_7, component_position_y_7, component_position_z_7,
                                               self._detail_color)
            self._scan_index += 1

            component_position = [component_position_0, component_position_1, component_position_2,
                                  component_position_3, component_position_4, component_position_5,
                                  component_position_6, component_position_7]

            # Получение цвета компоненты
            component_color = self._detail_color

            # Получение количества записей компоненты
            number_of_component_records = int(self._file_data[self._scan_index])
            self._scan_index += 1

            # Получение массива записей компоненты
            component_information = list()
            for record_number in range(number_of_component_records):
                component_information.append(self._file_data[self._scan_index])
                self._scan_index += 1

            if component_type == "Куб":
                list_of_components.append(component.Cube(component_type,
                                                         component_position,
                                                         component_color,
                                                         component_information))

        return list_of_components

    # Получение
    def getDetailName(self):
        return self._detail_name

    def getDetailColor(self):
        return self._detail_color

    def getDetailPosition(self):
        return self._detail_position

    def getNumberOfComponents(self):
        return self._number_of_components

    def getListOfComponents(self):
        return self._list_of_components

#
# # Объект загрузки
# class BaseLoader:
#     # Публичные поля загрузки
#     details_number = None
#     list_of_details = None
#
#     # Приватные поля загрузки
#     _file_data = None
#
#     # Статус ошибки загрузки
#     _error_status = config.SUCCESS_STATUS
#
#     # Создание объекта загрузки
#     def __init__(self, filename):
#         self._file_data = open(filename, 'r').read().split("\n")
#
#         # Установка пустого количества моделей
#         self.list_of_details = list()
#         self.details_number = 0
#
#         # Получение количества деталей
#         self._error_status = self._getNumberOfDetails()
#
#         # Получение списка деталей
#         if self._error_status != config.ERROR_STATUS:
#             self._error_status = self._getListOfDetails()
#
#     # Получение количества деталей
#     def _getNumberOfDetails(self):
#         try:
#             self.details_number = int(self._file_data[0])
#             return config.SUCCESS_STATUS
#         except ():
#             return config.ERROR_STATUS
#
#     # Получение всех вершин
#     def _getAllVertexes(self, position, number_of_vertex, color):
#         all_vertexes = list()
#
#         for vertex_number in range(position, position + number_of_vertex):
#             # Чтерени координат текущей вершины
#             print("x, y, z", self._file_data[vertex_number])
#             x, y, z = list(map(int, self._file_data[vertex_number].split()))
#
#             # Получение объекта вершины Vertex
#             all_vertexes.append(vertex.Vertex(x, y, z, color))
#
#         return all_vertexes
#
#     # Получение всех компонентов детали
#     def _getAllComponents(self, position, number_of_components, color):
#         all_components = list()
#
#         for component_number in range(position, position + number_of_components):
#             # Чтение данных текущей компоненты
#             name = self._file_data[position]
#
#             number_of_vertexes = self._file_data[position]
#
#         return all_components
#
#     # Запись текущей модели
#     def _getTempDetail(self, number_of_uploaded_details):
#         # Получение данных о детали
#
#         # Название детали
#         detail_name = self._file_data[number_of_uploaded_details]
#
#         print("detail_name", detail_name)
#
#         # Цвет
#         color = self._file_data[number_of_uploaded_details + 1]
#
#         print("color", color)
#
#         # Количество компонентов детали
#         number_of_components = int(self._file_data[number_of_uploaded_details + 2])
#
#         print("number_of_components", number_of_components)
#
#         # Все компоненты
#         all_components =
#
#         # Название
#         name = self._file_data[number_of_uploaded_details]
#
#         print("name", name)
#
#         # Количество вершин
#         number_of_vertex = int(self._file_data[number_of_uploaded_details + 2])
#
#         print("number_of_vertex", number_of_vertex)
#
#         # Массив вершин
#         all_vertexes = self._getAllVertexes(number_of_uploaded_details + 3, number_of_vertex, color)
#
#         return Model(name, number_of_vertex, all_vertexes, color)
#
#     # Получение массива моделей
#     def _getListOfDetails(self):
#         try:
#             number_of_uploaded_details = 0
#
#             print("_file_data", self._file_data)
#             print("details_number", self.details_number)
#
#             # Загрузка информации текущей детали в массив
#             self.list_of_details.append(self._getTempDetail(number_of_uploaded_details))
#
#             return config.SUCCESS_STATUS
#         except ():
#             # Обнуление всех используемых публичных данных
#             self.details_number = 0
#             self.list_of_details = list()
#
#             return config.ERROR_STATUS

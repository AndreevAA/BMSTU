import config

# Объект Component
import vertex


class Component:
    # Публичные данные компонента
    c_type = None
    position = None
    color = None
    information = None

    # Создание объекта Component
    def __init__(self, c_type, position, color, information):  # position - массив с восьмью вершинами
        self.c_type = c_type
        self.position = position
        self.color = color
        self.information = information

    # Установка позиции компоненты
    def setNewPosition(self, position):
        self.position = position


# Наследуемый объекта компоненты Куб
class Cube(Component):
    # Приватные уникальные поля объета
    _allCubeVertexes = None
    _planes = list()

    def _readPlanes(self):
        all_planes = self.information[8:]

        for plane_number in range(6):
            plane_information = list(map(int, all_planes[plane_number].split()))
            self._planes.append(RectanglePlane(vertex.Vertex(plane_information[0], plane_information[1],
                                                             plane_information[2], self.color),
                                               vertex.Vertex(plane_information[3], plane_information[4],
                                                             plane_information[5], self.color),
                                               vertex.Vertex(plane_information[6], plane_information[7],
                                                             plane_information[8], self.color),
                                               vertex.Vertex(plane_information[9], plane_information[10],
                                                             plane_information[11], self.color)))
        #
        # plane_0 = list(map(int, all_planes[0].split()))
        # plane_1 = list(map(int, all_planes[1].split()))
        # plane_2 = list(map(int, all_planes[2].split()))
        # plane_3 = list(map(int, all_planes[3].split()))
        # plane_4 = list(map(int, all_planes[4].split()))
        # plane_5 = list(map(int, all_planes[5].split()))
        #
        # plane_0_n = RectanglePlane(vertex.Vertex(plane_0[0], plane_0[1], plane_0[2], self.color),
        #                            vertex.Vertex(plane_0[3], plane_0[4], plane_0[5], self.color),
        #                            vertex.Vertex(plane_0[6], plane_0[7], plane_0[8], self.color),
        #                            vertex.Vertex(plane_0[9], plane_0[10], plane_0[11], self.color))
        # plane_1_n = RectanglePlane(vertex.Vertex(plane_1[0], plane_1[1], plane_1[2], self.color),
        #                            vertex.Vertex(plane_1[3], plane_1[4], plane_1[5], self.color),
        #                            vertex.Vertex(plane_1[6], plane_1[7], plane_1[8], self.color),
        #                            vertex.Vertex(plane_1[9], plane_1[10], plane_1[11], self.color))
        # plane_2_n = RectanglePlane(vertex.Vertex(plane_2[0], plane_2[1], plane_2[2], self.color),
        #                            vertex.Vertex(plane_2[3], plane_2[4], plane_2[5], self.color),
        #                            vertex.Vertex(plane_2[6], plane_2[7], plane_2[8], self.color),
        #                            vertex.Vertex(plane_2[9], plane_2[10], plane_2[11], self.color))
        # plane_3_n = RectanglePlane(vertex.Vertex(plane_3[0], plane_3[1], plane_3[2], self.color),
        #                            vertex.Vertex(plane_3[3], plane_3[4], plane_3[5], self.color),
        #                            vertex.Vertex(plane_3[6], plane_3[7], plane_3[8], self.color),
        #                            vertex.Vertex(plane_3[9], plane_3[10], plane_3[11], self.color))
        # plane_4_n = RectanglePlane(vertex.Vertex(plane_4[0], plane_4[1], plane_4[2], self.color),
        #                            vertex.Vertex(plane_4[3], plane_4[4], plane_4[5], self.color),
        #                            vertex.Vertex(plane_4[6], plane_4[7], plane_4[8], self.color),
        #                            vertex.Vertex(plane_4[9], plane_4[10], plane_4[11], self.color))
        # plane_5_n = RectanglePlane(vertex.Vertex(plane_5[0], plane_5[1], plane_5[2], self.color),
        #                            vertex.Vertex(plane_5[3], plane_5[4], plane_5[5], self.color),
        #                            vertex.Vertex(plane_5[6], plane_5[7], plane_5[8], self.color),
        #                            vertex.Vertex(plane_5[9], plane_5[10], plane_5[11], self.color))
        #
        # self._planes = [plane_0_n, plane_1_n, plane_2_n, plane_3_n, plane_4_n, plane_5_n]

    # Отрисовка Куба
    def draw(self, planes, canvas):
        print("self.position[0].x", self.position[0].x, self.position[0].y, "\n",
              self.position[1].x, self.position[1].y, "\n",
              self.position[2].x, self.position[2].y, "\n",
              self.position[3].x, self.position[3].y, "\n",
              self.position[4].x, self.position[4].y, "\n",
              self.position[5].x, self.position[5].y, "\n",
              self.position[6].x, self.position[6].y, "\n",
              self.position[7].x, self.position[7].y, )

        # Получение плоскостей
        self._readPlanes()

        print(self._planes[0])

        for plane_number in range(6):
            canvas.create_polygon(self._planes[plane_number].vertex_1.x, self._planes[plane_number].vertex_1.y,
                                  self._planes[plane_number].vertex_2.x, self._planes[plane_number].vertex_2.y,
                                  self._planes[plane_number].vertex_3.x, self._planes[plane_number].vertex_3.y,
                                  self._planes[plane_number].vertex_4.x, self._planes[plane_number].vertex_4.y,
                                  fill=self.color, outline="black")


# Плоскость прямоугольника
class RectanglePlane:
    vertex_1 = None
    vertex_2 = None
    vertex_3 = None
    vertex_4 = None

    def __init__(self, vertex_1, vertex_2, vertex_3, vertex_4):
        self.vertex_1 = vertex_1
        self.vertex_2 = vertex_2
        self.vertex_3 = vertex_3
        self.vertex_4 = vertex_4

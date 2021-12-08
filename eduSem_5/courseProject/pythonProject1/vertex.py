# Объект Vertex
class Vertex:
    # Публичные поля координат Вершины
    x = None
    y = None
    z = None
    color = None
    canvas = None

    # Создание объекта вершины
    def __init__(self, x, y, z, color):
        self.x = x
        self.y = y
        self.z = z
        self.color = color

    # Отрисовка вершины
    def draw(self):
        self.canvas.create_oval(self.x, self.y, self.x, self.y, fill=self.color)

    # Обновление данных Canvas
    def update(self, canvas):
        self.canvas = canvas

        self.draw()
        return self.canvas

    def update_right(self, new_value):
        self.x += new_value

    def update_left(self, new_value):
        self.x -= new_value

    def update_top(self, new_value):
        self.z += new_value

    def update_bottom(self, new_value):
        self.z -= new_value


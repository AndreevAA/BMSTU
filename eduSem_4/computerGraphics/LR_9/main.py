import sys
from PyQt5 import QtWidgets
from PyQt5.QtWidgets import QApplication, QPushButton, QMessageBox, QGraphicsView, QGraphicsScene
from PyQt5.QtGui import QPainter, QColor, QPen, QImage, QPixmap, QTransform, QPolygonF
from PyQt5.QtCore import Qt, QEventLoop, QPointF
import designn
import copy

def sign(x):
    if not x:
        return 0
    return x / abs(x)


class App(QtWidgets.QMainWindow, designn.Ui_MainWindow):
    def __init__(self):
        # Это здесь нужно для доступа к переменным, методам
        # и т.д. в файле design.py
        super().__init__()
        self.setupUi(self)  # Это нужно для инициализации нашего дизайна

        self.graphicsView.setHorizontalScrollBarPolicy(Qt.ScrollBarAlwaysOff)
        self.graphicsView.setVerticalScrollBarPolicy(Qt.ScrollBarAlwaysOff)
        
        self.scene = MyScene()
        self.scene.setSceneRect(0, 0, 710, 520)
        self.graphicsView.setScene(self.scene)
        self.pen = QPen(Qt.black, 1)

        self.input_bars = False
        self.input_polygon = False
        self.polygon = []
        
        #self.lines = []
        self.last_point = None
        self.clipping_area = []
        
        self.color_in_polygon = Qt.red
        self.color_out_polygon = Qt.blue
        self.color_polygon = Qt.green
        
        self.last_edge_point = None

        self.clear_btn.clicked.connect(self.clear)
        self.adding_lines_btn.clicked.connect(self.set_bars)
        self.adding_cutter_btn.clicked.connect(self.set_polygon_bars)
        self.cut_btn.clicked.connect(self.cut)

    def clear(self):
        self.scene.clear()
        self.points_table.clear()
        self.inputBars = False
        self.inputRect = False
        #self.lines = []
        self.clipping_area.clear()
        self.polygon = []
        self.last_edge_point = None
        self.last_point = None
        self.input_polygon = None
    
    def set_bars(self):
        if self.input_bars:
            self.scene.addLine(self.clipping_area[len(self.clipping_area) - 1].x(),\
                 self.clipping_area[len(self.clipping_area) - 1].y(), self.clipping_area[0].x(),\
                      self.clipping_area[0].y(), self.pen)
            
            text = '(' + str(self.clipping_area[len(self.clipping_area) - 1].x())\
                 + ', ' + str(self.clipping_area[len(self.clipping_area) - 1].y()) + ')\n' + '('\
                 + str(self.clipping_area[0].x()) + ', ' + str(self.clipping_area[0].y())  + ')\n----------------------'
            self.points_table.append(text)
            
            self.input_bars = False
            self.adding_cutter_btn.setDisabled(False)
            self.clear_btn.setDisabled(False)
            self.cut_btn.setDisabled(False)
        else:
            self.input_bars = True
            self.adding_cutter_btn.setDisabled(True)
            self.clear_btn.setDisabled(True)
            self.cut_btn.setDisabled(True)

       

    def set_polygon_bars(self):
        if self.input_polygon:
            self.scene.addLine(self.polygon[len(self.polygon) - 1].x(),\
                 self.polygon[len(self.polygon) - 1].y(), self.polygon[0].x(),\
                      self.polygon[0].y(), self.pen)
            self.input_polygon = False
            self.adding_lines_btn.setDisabled(False)
            self.clear_btn.setDisabled(False)
            self.cut_btn.setDisabled(False)
        else:
            self.pen.setColor(self.color_out_polygon)
            self.input_polygon = True
            self.adding_lines_btn.setDisabled(True)
            self.clear_btn.setDisabled(True)
            self.cut_btn.setDisabled(True)


    def add_clip_area_edge(self, point):  #point - QpointF(x,y)
        if self.last_point == None:
            self.last_point = point
            self.clipping_area.append(QPointF(point.x(), point.y()))
        else:
            self.clipping_area.append(QPointF(point.x(), point.y()))
            x = self.last_point.x()
            y = self.last_point.y()
            text = '(' + str(x) + ', ' + str(y) + ')\n' + '('\
                 + str(point.x()) + ', ' + str(point.y())  + ')\n----------------------'
            self.points_table.append(text)
            self.pen.setColor(self.color_out_polygon)
            self.scene.addLine(x, y, point.x(), point.y(), self.pen)
            self.last_point = point
    


    def add_edge(self, point):
        if self.last_edge_point == None:
            self.last_edge_point = point
            self.polygon.append(QPointF(point.x(), point.y()))
        else:
            self.pen.setColor(Qt.green)
            self.polygon.append(QPointF(point.x(), point.y()))
            x = self.last_edge_point.x()
            y = self.last_edge_point.y()
            self.scene.addLine(x, y, point.x(), point.y(), self.pen)
            self.last_edge_point = point

    def add_point(self, point):
        if self.input_bars:
            self.add_clip_area_edge(point)
        else:
            self.add_edge(point)


    def cut(self):
        if (self.polygon != []):
            norm = self.is_convex(self.polygon)
            if (norm and not (self.clipping_area == [])):
                self.pen.setColor(Qt.red)
                polygon = QPolygonF(self.sutherland_hodgman_algorithm(self.clipping_area, self.polygon))
                self.scene.addPolygon(polygon, self.pen)
            elif not norm:
                QMessageBox.warning(self, "Error", "Cutter is NOT convex")
            elif self.polygon == []:
                QMessageBox.warning(self, "Error", "Polygon are not entered")
        else:
            QMessageBox.warning(self, "Error", "Cutter is NOT entered")

    def draw_line(self, point1, point2):
        self.scene.addLine(point1.x(), point1.y(), point2.x(), point2.y(), self.pen)

    def get_points(self, line):
        return QPointF(line[0][0], line[0][1]), QPointF(line[1][0], line[1][1])


    def is_convex(self, polygon):
        points = self.polygon
        
        flag = True
        
        vo = points[0]
        vi = points[1]
        vn = points[2]

        x1 = vi.x() - vo.x()
        y1 = vi.y() - vo.y()

        x2 = vn.x() - vi.x()
        y2 = vn.y() - vi.y()
        
        ordinate_sign = x1 * y2 - x2 * y1
        previous = sign(ordinate_sign)
        
        for i in range(2, len(points) - 1):
            if not flag:
                break
            vo = points[i - 1]
            vi = points[i]
            vn = points[i + 1]
            
            # векторное произведение двух векторов
            x1 = vi.x() - vo.x()
            y1 = vi.y() - vo.y()

            x2 = vn.x() - vi.x()
            y2 = vn.y() - vi.y()
            
            ordinate_sign = x1 * y2 - x2 * y1
            current = sign(ordinate_sign)
            if current != previous:
                flag = 0
            previous = current
        
        vo = points[len(points) - 1]
        vi = points[0]
        vn = points[1]
        x1 = vi.x() - vo.x()
        y1 = vi.y() - vo.y()

        x2 = vn.x() - vi.x()
        y2 = vn.y() - vi.y()
        
        ordinate_sign = x1 * y2 - x2 * y1
        current = sign(ordinate_sign)
        
        if current != previous:
            flag = 0
        
        return flag * current


    
    
    
    def crossing_fact(self, point1, point2, edge_point1, edge_point2):
        param1 = self.visibility(point1, edge_point1, edge_point2)
        param2 = self.visibility(point2, edge_point1, edge_point2)
        return (param1 < 0 and param2 > 0) or (param1 > 0 and param2 < 0)
    
    
    def scalar_mult(self, p1, p2):
        return p1.x() * p2.x() + p1.y() * p2.y()

    def intersection(self, point1, point2, edge_point1, edge_point2):
        
        p1 = point1
        p2 = point2

        q1 = edge_point1
        q2 = edge_point2

        delta = (p2.x() - p1.x()) * (q1.y() - q2.y()) - (q1.x() - q2.x()) * (p2.y() - p1.y())
        delta_t = (q1.x() - p1.x()) * (q1.y() - q2.y()) - (q1.x() - q2.x()) * (q1.y() - p1.y())

        if abs(delta) <= 1e-6:
            return p2

        t = delta_t / delta

        I = QPointF()
        I.setX(point1.x() + (point2.x() - point1.x()) * t)
        I.setY(point1.y() + (point2.y() - point1.y()) * t)
        return I
       
    def exit(self, peak, result_points_amount, result_polygon):
        result_points_amount += 1
        result_polygon.append(peak)
        return result_points_amount
    

    #def cross_point(p1, p2)
    
    def visibility(self, point, point1, point2):
        rab1 = (point.x() - point1.x()) * (point2.y() - point1.y())
        rab2 = (point.y() - point1.y()) * (point2.x() - point1.x())
        rab3 = rab1 - rab2
        
        return sign(rab3)



    # line - отрезок, polygon - точки мноугольника
    def sutherland_hodgman_algorithm(self, polygon_points, cutter_points):
        # polygon_points массив вершин исходного многоугольника
        # cutter_points массив вершин отсекающего окна
        cutter_points.append(cutter_points[0])
        # result_polygon массив результирующего многоугольника
        
        # число вершин исходного многоугольника
        polygon_points_amount = len(polygon_points)
        # число вершин результирующего многоугольника
        # число вершин отсекающего окна
        cutter_points_amount = len(cutter_points)
        
        intersection_point = QPointF() # точка пересчения
        first_point = QPointF()        # первая точка
        second_point = QPointF()       # вторая
        
        for i in range(cutter_points_amount - 1):
            #установить счётчик вершин результата и обнулить результат
            result_polygon = list()
            result_points_amount = 0
            
            # отсекаем каждное ребро многоугольника
            #  по данной стороне отсекателя
            for j in range(polygon_points_amount):
                # особо обрабатываем первую вершину
                if j == 0:
                    # запоминаем
                    first_point = polygon_points[j]
                else:
                    # проверяем факт пересечения ребром 
                    # многоугольника стороны окна
                    if self.crossing_fact(second_point, polygon_points[j], \
                                        cutter_points[i], cutter_points[i + 1]):
                        # если ребро пересекает сторону окна, вычислим точку пересечения
                        intersection_point = self.intersection(second_point, polygon_points[j], \
                                        cutter_points[i], cutter_points[i + 1])
                        # заносим точку пересечения в результат  
                        result_points_amount = self.exit(intersection_point, result_points_amount, result_polygon)
                
                second_point = polygon_points[j]
                # проверим видимость конечной точки ребра многоугольника
                if self.visibility(second_point, cutter_points[i], cutter_points[i + 1]) > 0:
                    # если точка видима, то занести ее в результат
                    result_points_amount = self.exit(second_point, result_points_amount, result_polygon)
                
                #next j
            
            # обрабатываем последнее ребро многоугольника
            if result_points_amount != 0:
                # проверяем факт пересечения последним
                #  ребром многоугольника стороны отсекателя
                if self.crossing_fact(second_point, first_point, \
                                           cutter_points[i], cutter_points[i + 1]):
                    # вычисляем точку пересечения
                    intersection_point = self.intersection(second_point, first_point, \
                                                        cutter_points[i], cutter_points[i + 1])
                    # выводим точку пересечения в результат
                    result_points_amount = self.exit(intersection_point, result_points_amount, result_polygon)
            
            # сохраняем многоугольник с результатом отсечения
            polygon_points = copy.deepcopy(result_polygon)
            polygon_points_amount = result_points_amount

        # возвращаем полученный многоугольник
        return polygon_points

class MyScene(QtWidgets.QGraphicsScene):
    def mousePressEvent(self, event):
        global window
        if window.input_bars or window.input_polygon:
            window.add_point(event.scenePos())




if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    window = App()  
    window.show()
    app.exec_()
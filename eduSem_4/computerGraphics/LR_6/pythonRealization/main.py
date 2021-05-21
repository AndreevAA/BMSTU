from PyQt5 import QtWidgets, uic
from PyQt5.QtWidgets import QTableWidgetItem
from PyQt5.QtGui import QPen, QColor, QImage, QPixmap, QPainter
from PyQt5.QtCore import Qt, QTime, QCoreApplication, QEventLoop, QPointF
import time

import globals, zatrave, graphics, canvasOperations

class Window(QtWidgets.QMainWindow):
    def __init__(self):
        QtWidgets.QWidget.__init__(self)
        uic.loadUi("window.ui", self)
        self.scene = myScene(0, 0, 561, 581)
        self.scene.win = self
        self.view.setScene(self.scene)
        self.image = QImage(561, 581, QImage.Format_ARGB32_Premultiplied)
        self.image.fill(globals.colorFreePixel)
        self.lock.clicked.connect(lambda: canvasOperations.lock(self))
        self.erase.clicked.connect(lambda: canvasOperations.clean_all(self))
        self.paint.clicked.connect(lambda: zatrave.fill_with_seed(self))
        self.addpoint.clicked.connect(lambda: graphics.add_point_by_btn(self))
        self.pixel.clicked.connect(lambda: canvasOperations.set_flag_zat(self))
        self.addcircle.clicked.connect(lambda: canvasOperations.set_flag_cir(self))
        self.edges = []
        self.point_now = None
        self.point_lock = None

        self.pen = QPen(globals.colorZatravePixel)
        self.delay.setChecked(False)

class myScene(QtWidgets.QGraphicsScene):
    def mousePressEvent(self, event):
        if globals.isPointZatraveInput or globals.isCircleZatraveInput:
            canvasOperations.get_pixel(event.scenePos())
        else:
            graphics.add_point(event.scenePos())

if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    globals.w = Window()
    globals.w.show()
    sys.exit(app.exec_())

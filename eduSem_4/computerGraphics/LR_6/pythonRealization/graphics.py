from PyQt5 import QtWidgets, uic
from PyQt5.QtWidgets import QTableWidgetItem
from PyQt5.QtGui import QPen, QColor, QImage, QPixmap, QPainter
from PyQt5.QtCore import Qt, QTime, QCoreApplication, QEventLoop, QPointF

import globals

def add_row(win):
    win.table.insertRow(win.table.rowCount())
    
def add_point(point):
    if globals.w.point_now is None:
        globals.w.point_now = point
        globals.w.point_lock = point
        add_row(globals.w)
        i = globals.w.table.rowCount() - 1
        item_x = QTableWidgetItem("{0}".format(point.x()))
        item_y = QTableWidgetItem("{0}".format(point.y()))
        globals.w.table.setItem(i, 0, item_x)
        globals.w.table.setItem(i, 1, item_y)
    else:
        globals.w.edges.append([globals.w.point_now.x(), globals.w.point_now.y(),
                        point.x(), point.y()])
        globals.w.point_now = point
        add_row(globals.w)
        i = globals.w.table.rowCount() - 1
        item_x = QTableWidgetItem("{0}".format(point.x()))
        item_y = QTableWidgetItem("{0}".format(point.y()))
        globals.w.table.setItem(i, 0, item_x)
        globals.w.table.setItem(i, 1, item_y)
        item_x = globals.w.table.item(i-1, 0)
        item_y = globals.w.table.item(i-1, 1)
        globals.w.scene.addLine(point.x(), point.y(), float(item_x.text()), float(item_y.text()), globals.w.pen)

def add_point_by_btn(win):
    x = win.x.value()
    y = win.y.value()
    p = QPoint()
    p.setX(x)
    p.setY(y)
    add_point(p)
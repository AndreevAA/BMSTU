from PyQt5 import QtWidgets, uic
from PyQt5.QtWidgets import QTableWidgetItem
from PyQt5.QtGui import QPen, QColor, QImage, QPixmap, QPainter
from PyQt5.QtCore import Qt, QTime, QCoreApplication, QEventLoop, QPointF
import time

import globals

def clean_all(win):
    win.scene.clear()
    win.table.clear()
    win.edges = []
    win.point_now = None
    win.point_lock = None
    point_zat = False
    win.image.fill(globals.colorFreePixel)
    r = win.table.rowCount()
    for i in range(r, -1, -1):
        win.table.removeRow(i)

def set_flag_zat(win):
    globals.isPointZatraveInput = True
    win.lock.setDisabled(True)
    win.erase.setDisabled(True)
    win.paint.setDisabled(True)
    win.addpoint.setDisabled(True)
    win.addpoint.setDisabled(True)
    win.addcircle.setDisabled(True)

def get_pixel(point):
    pix = QPixmap()
    if globals.isCircleZatraveInput:
        r = globals.w.rad.value()
        draw_globals.isCircleZatraveInput(globals.w.image, r, point)
        globals.isCircleZatraveInput = False
    if globals.isPointZatraveInput:
        globals.w.p_x.setValue(point.x())
        globals.w.p_y.setValue(point.y())
        draw_edges(globals.w.image, globals.w.edges)
        globals.isPointZatraveInput = False
    pix.convertFromImage(globals.w.image)
    globals.w.scene.addPixmap(pix)
    globals.w.lock.setDisabled(False)
    globals.w.erase.setDisabled(False)
    globals.w.paint.setDisabled(False)
    globals.w.addpoint.setDisabled(False)
    globals.w.addcircle.setDisabled(False)
    globals.w.pixel.setDisabled(False)

def set_flag_cir(win):
    globals.isCircleZatraveInput = True
    win.lock.setDisabled(True)
    win.erase.setDisabled(True)
    win.paint.setDisabled(True)
    win.addpoint.setDisabled(True)
    win.addpoint.setDisabled(True)
    win.pixel.setDisabled(True)

def lock(win):
    win.edges.append([win.point_now.x(), win.point_now.y(), win.point_lock.x(), win.point_lock.y()])
    win.scene.addLine(win.point_now.x(), win.point_now.y(), win.point_lock.x(), win.point_lock.y(), globals.w.pen)
    win.point_now = None

def draw_edges(image, edges):
    p = QPainter()
    p.begin(image)
    p.setPen(QPen(QColor(0, 0, 255)))
    for ed in edges:
        p.drawLine(ed[0], ed[1], ed[2], ed[3])
    p.end()


def draw_circle(image, rad, point):
    p = QPainter()
    p.begin(image)
    p.setPen(QPen(QColor(0, 0, 255)))
    p.drawEllipse(point.x() - rad, point.y() - rad, rad * 2, rad * 2)
    p.end()

def delay():
    QtWidgets.QApplication.processEvents(QEventLoop.AllEvents, 1)

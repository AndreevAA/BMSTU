from PyQt5 import QtWidgets, uic
from PyQt5.QtWidgets import QTableWidgetItem
from PyQt5.QtGui import QPen, QColor, QImage, QPixmap, QPainter
from PyQt5.QtCore import Qt, QTime, QCoreApplication, QEventLoop, QPointF

# Окно
w = None

# Цвет затравливания
colorZatravePixel = QColor(0, 0, 0)

# Цвет свободного пикселя
colorFreePixel = QColor(255, 255, 255)

# Статус ввода точки затравливания
isPointZatraveInput = False

# Статус ввода окружности
isCircleZatraveInput = False

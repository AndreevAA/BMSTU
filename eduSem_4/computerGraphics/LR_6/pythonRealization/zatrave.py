from PyQt5 import QtWidgets, uic
from PyQt5.QtWidgets import QTableWidgetItem
from PyQt5.QtGui import QPen, QColor, QImage, QPixmap, QPainter
from PyQt5.QtCore import Qt, QTime, QCoreApplication, QEventLoop, QPointF
import canvasOperations

def fill_with_seed(win):

    pix = QPixmap()

    paint = QPainter()
    paint.begin(win.image)

    stack = []

    edge = QColor(0, 0, 255).rgb()
    fill = QColor(0, 0, 0).rgb()

    z = QPointF(win.p_x.value(), win.p_y.value())
    stack.append(z)

    # пока стек не пуст
    while stack:

        # извлечение пикселя (х,у) из стека
        p = stack.pop()
        x = p.x()
        y = p.y()

        # tx = x, запоминаем абсицссу
        xt = p.x()
        Fl = 0
        
        # цвет(х,у) = цвет закраски
        win.image.setPixel(x, y, fill)
        
        # заполняем интервал слева от затравки
        x = x - 1
        while win.image.pixel(x, y) != edge:
            win.image.setPixel(x, y, fill)
            x = x - 1

        # сохраняем крайний слева пиксел
        xl = x + 1
        x = xt

        # заполняем интервал справа от затравки
        x = x + 1

        while win.image.pixel(x, y) != edge:
            win.image.setPixel(x, y, fill)
            x = x + 1

        # сохраняем крайний справа пиксел
        xr = x - 1
        y = y + 1
        x = xl

        # ищем затравку на строке выше
        while x <= xr:
            Fl = 0
            while win.image.pixel(x, y) != edge and  win.image.pixel(x, y) != fill and  x <= xr:
                if Fl == 0:
                    Fl = 1
                x = x + 1

            if Fl == 1:
                if x == xr and win.image.pixel(x, y) != fill and win.image.pixel(x, y) != edge:
                    stack.append(QPointF(x, y))
                else:
                    stack.append(QPointF(x - 1, y))
                Fl = 0


            xt = x
            while (win.image.pixel(x, y) == edge or win.image.pixel(x, y) == fill) and x < xr:
                x = x + 1

            if x == xt:
                x = x + 1

        y = y - 2
        x = xl
        while x <= xr:
            Fl = 0
            while win.image.pixel(x, y) != edge and win.image.pixel(x, y) != fill and x <= xr:
                if Fl == 0:
                    Fl = 1
                x = x + 1


            if Fl == 1:
                if x == xr and win.image.pixel(x, y) != fill and win.image.pixel(x, y) != edge:
                    stack.append(QPointF(x, y))
                else:
                    stack.append(QPointF(x - 1, y))
                Fl = 0


            xt = x
            while (win.image.pixel(x, y) == edge or win.image.pixel(x, y) == fill) and x < xr:
                x = x + 1

            if x == xt:
                x = x + 1

        if win.delay.isChecked():
            canvasOperations.delay()
            pix.convertFromImage(win.image)
            win.scene.addPixmap(pix)

    if not win.delay.isChecked():
        pix.convertFromImage(win.image)
        win.scene.addPixmap(pix)
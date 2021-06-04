# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'mainwindow.ui'
#
# Created by: PyQt5 UI code generator 5.14.1
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(923, 591)
        font = QtGui.QFont()
        font.setPointSize(10)
        MainWindow.setFont(font)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.graphicsView = QtWidgets.QGraphicsView(self.centralwidget)
        self.graphicsView.setGeometry(QtCore.QRect(210, 0, 711, 521))
        self.graphicsView.setObjectName("graphicsView")
        self.label_3 = QtWidgets.QLabel(self.centralwidget)
        self.label_3.setGeometry(QtCore.QRect(70, 10, 51, 20))
        self.label_3.setObjectName("label_3")
        self.points_table = QtWidgets.QTextEdit(self.centralwidget)
        self.points_table.setGeometry(QtCore.QRect(10, 40, 191, 481))
        self.points_table.setObjectName("points_table")
        self.adding_lines_btn = QtWidgets.QPushButton(self.centralwidget)
        self.adding_lines_btn.setGeometry(QtCore.QRect(260, 540, 201, 28))
        self.adding_lines_btn.setObjectName("adding_lines_btn")
        self.adding_cutter_btn = QtWidgets.QPushButton(self.centralwidget)
        self.adding_cutter_btn.setGeometry(QtCore.QRect(490, 540, 201, 28))
        self.adding_cutter_btn.setObjectName("adding_cutter_btn")
        self.cut_btn = QtWidgets.QPushButton(self.centralwidget)
        self.cut_btn.setGeometry(QtCore.QRect(720, 540, 201, 28))
        self.cut_btn.setObjectName("cut_btn")
        self.clear_btn = QtWidgets.QPushButton(self.centralwidget)
        self.clear_btn.setGeometry(QtCore.QRect(10, 540, 191, 28))
        self.clear_btn.setObjectName("clear_btn")
        MainWindow.setCentralWidget(self.centralwidget)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.label_3.setText(_translate("MainWindow", "Точки"))
        self.adding_lines_btn.setText(_translate("MainWindow", "Добавление области"))
        self.adding_cutter_btn.setText(_translate("MainWindow", "Добавление отсекателя"))
        self.cut_btn.setText(_translate("MainWindow", "Отсечь"))
        self.clear_btn.setText(_translate("MainWindow", "Очистить всё"))

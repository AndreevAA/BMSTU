from tkinter import Tk, Frame, LEFT, RIGHT, END, Listbox, EXTENDED, Y, X, N, Canvas, W, messagebox
from tkinter.ttk import *

import config

# Основной объект интерфейса программы
import detail
import operation_data


# Объект интерфейса программы
class Interface:
    # Данные интерфейса
    window = None  # Экран приложения
    canvas = None  # Холст отрисовка изображения

    # Данные работы
    operation_data = operation_data.OperationData()

    # Создание объекта
    #

    # Запуск интерфейса
    def start(self):

        # Установка параметров окна
        self._setPreStartSetting()

        # Установка виджетов на экран
        self._setupWidgets()

        # Создание окна
        self._createApp()

    # Остановка интерфейса
    def stop(self):
        exit(self)

    # Установка параметров окна
    def _setPreStartSetting(self):
        self.window = Tk()
        self.window.title(config.window_title)

    # Установка виджетов окна
    def _setupWidgets(self):
        # Установка холста
        DrawingCanvas()

        print(self.canvas)

        # Установка контроллера
        Controller()

    # Физическое создание приложения
    def _createApp(self):
        # Запуск всех настроек
        self.window.mainloop()


# Объект контроллера
class Controller(Interface):
    # Приватные данные
    _isFileUploaded = False

    # Блок добавления деталей
    _addingDetails = None

    _entry = None  # Выбранная деталь
    _box = None  # Область списка деталей
    _axis = None  # Выбранная ось
    _degree = None  # Угол поворота

    def __init__(self):
        super().__init__()

        # Ярлык Деталь
        i_d_l = Label(text="Деталь", justify=LEFT)
        i_d_l.config(font=("Courier", 16, "bold"))
        i_d_l.grid(row=0, column=0, columnspan=2, pady=(20, 10), sticky=W)

        # Блок выбора детали для добавления
        self._entry = Combobox(self.controller_frame, values=["Куб"])
        self._entry.grid(row=1, column=0, columnspan=2)

        # Блок параллельных кнопок добавления и удаления детали
        Button(text="Добавить", command=self.add_item).grid(row=2, column=0, columnspan=1)
        Button(text="Удалить", command=self.del_list).grid(row=2, column=1, columnspan=1)

        # Ярлык добавленных деталей
        add_d_l = Label(text="Добавленные", justify=LEFT)
        add_d_l.config(font=("Courier", 16, "bold"))
        add_d_l.grid(row=3, column=0, columnspan=2, pady=(20, 10), sticky=W)

        # Список добавленных деталей
        self._box = Listbox(selectmode=EXTENDED, width=17)
        self._box.grid(row=4, column=0, columnspan=2)
        scroll = Scrollbar(command=self._box.yview)
        scroll.grid(row=4, column=0, columnspan=2)
        self._box.config(yscrollcommand=scroll.set)

        # Ярлык перемещения детали
        m_d_l = Label(text="Перемещение", justify=LEFT)
        m_d_l.config(font=("Courier", 16, "bold"))
        m_d_l.grid(row=5, column=0, columnspan=2, pady=(20, 10), sticky=W)

        # Блок перемещения детели
        Button(text="Вверх", command=self.add_item).grid(row=6, column=0, columnspan=2)
        Button(text="Влево", command=self.del_list).grid(row=7, column=0, columnspan=1)
        Button(text="Вправо", command=self.del_list).grid(row=7, column=1, columnspan=1)
        Button(text="Вниз", command=self.del_list).grid(row=8, column=0, columnspan=2)

        # Ярлык поворота детали
        r_d_l = Label(text="Поворот", justify=LEFT)
        r_d_l.config(font=("Courier", 16, "bold"))
        r_d_l.grid(row=9, column=0, columnspan=2, pady=(20, 10), sticky=W)

        # Блок паралельных параметров поворота
        l_dge = Label(text="Ось поворота", justify=LEFT)
        l_dge.config(font=("Courier", 9))
        l_dge.grid(row=10, column=0, columnspan=2, pady=(2, 2), sticky=W)
        self._axis = Combobox(self.controller_frame, values=["Ось X", "Ось Y", "Ось Z"])
        self._axis.grid(row=11, column=0, columnspan=2)
        l_dge = Label(text="Угол поворота", justify=LEFT)
        l_dge.config(font=("Courier", 9))
        l_dge.grid(row=12, column=0, columnspan=2, pady=(2, 2), sticky=W)
        Entry(textvariable=self._degree).grid(row=13, column=0, columnspan=2)

        # Кнопка поворота
        Button(text="Повернуть", command=self.add_item).grid(row=14, column=0, columnspan=2)

    def add_item(self):

        if self._entry.get() is not None and len(self._entry.get()) > 0:
            element = None

            if self._entry.get() == "Куб":
                element = detail.VirtualizeDetail(self.canvas).cube()

            if element is not None:
                # Добавление детали в список деталей
                self.operation_data.add_detail(element)

                print(len(self.operation_data.details))

                print("Добавлен элемент!")

                # Добавление в бокс названия добавленного элемента
                self._box.insert(END, self._entry.get() + " " + str(element.uid))

                # Очистка поля выбора
                self._entry.delete(0, END)

                print(self.canvas)

                # Обновление канваса
                DrawingCanvas().update()
            else:
                messagebox.showerror("Ошибка",
                                     "При добавлении фигуры произошла ошибка: Добавляемой фигуры нет в библиотеке!")

        else:
            messagebox.showerror("Ошибка",
                                 "При добавлении фигуры произошла ошибка: Фигура не выбрана. Выберите фигуру для добавления!")

    def del_list(self):
        select = list(self._box.curselection())

        if len(select) > 0:
            select.reverse()
            for temp_number in select:
                # Информация о выбранной кликом детали
                element_information = self._box.get(temp_number).split()

                # Удаление из массива деталей
                self.operation_data.clear_one_detail_by_uid(int(element_information[1]))

                # Удаление детали из бокса
                self._box.delete(temp_number)

                # Обновление канваса
                DrawingCanvas().update()
        else:
            messagebox.showerror("Ошибка",
                                 "При удалении фигуры произошла ошибка: Фигура не выбрана. Выберите фигуру для удаления!")


# Объект Холста
class DrawingCanvas(Interface):
    def __init__(self):
        super().__init__()

        # Отрисовка фона
        self.canvas = Canvas(self.window, width=400, height=400, bg="lightgrey",
                             cursor="pencil")

        self.update()

        print(self.canvas)

    # Обновление изображения на холсте
    def update(self):
        # Полная очистка холста
        self.canvas.delete("all")

        # Отрисовка фона
        self.canvas = Canvas(self.window, width=400, height=400, bg="lightgrey",
                             cursor="pencil")

        print(len(self.operation_data.details))

        # Отрисовка деталей
        for temp_detail in self.operation_data.details:
            print("Рисуется ->")
            temp_detail.draw(self.canvas)

        # Упаковка
        self.canvas.grid(row=0, column=3, columnspan=10, rowspan=10)

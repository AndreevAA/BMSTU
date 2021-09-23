import config
import matplotlib.pyplot as plt
import numpy as np
import graphic


class Graphics:

    # Графики
    _first_graphic = None
    _second_graphic = None
    _third_graphic = None

    # Данные о рисунке
    _title = None
    _ylabel = None

    # Инициализация данных
    def __init__(self, first_grahic, second_graphic, third_graphic, title, ylabel):

        self._first_graphic = first_grahic
        self._second_graphic = second_graphic
        self._third_graphic = third_graphic

        self._title = title
        self._ylabel = ylabel

    # Визуализация данных графиков
    def visualize(self):

        rng = np.arange(50)
        rnd = np.random.randint(0, 10, size=(3, rng.size))
        print(rnd)
        yrs = 1950 + rng

        fig, ax = plt.subplots(figsize=(5, 3))

        ax.stackplot(yrs, rng + rnd, labels=[self._first_graphic.get_name(),
                                             self._second_graphic.get_name(),
                                             self._third_graphic.get_name()])

        ax.set_title(self._title)
        ax.legend(loc='upper left')
        ax.set_ylabel(self._ylabel)

        ax.set_xlim(xmin=yrs[0], xmax=yrs[-1])
        fig.tight_layout()

        plt.show()
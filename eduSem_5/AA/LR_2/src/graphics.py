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
        list_sizes = config.list_sizes

        speed_results = [self._first_graphic.get_data(), self._second_graphic.get_data(),
                         self._third_graphic.get_data()]
        print("RNG")
        print(list_sizes)
        print("RND")
        print(speed_results)

        plt.plot(list_sizes, speed_results[0],
                 list_sizes, speed_results[1],
                 list_sizes, speed_results[2])

        # fig, ax = plt.subplots(figsize=(5, 3))
        #
        # ax.stackplot(list_sizes, speed_results, labels=[self._first_graphic.get_name(),
        #                                      self._second_graphic.get_name(),
        #                                      self._third_graphic.get_name()])
        #
        # ax.set_title(self._title)
        # ax.legend(loc='upper left')
        # ax.set_ylabel(self._ylabel)
        #
        # ax.set_xlim(xmin=list_sizes[0], xmax=list_sizes[-1])
        # fig.tight_layout()

        plt.show()

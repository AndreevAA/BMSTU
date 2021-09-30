# Сравнительный анализ работ алгоритмов сортировок

# Основной блок выполнения программы
import config
import generate
import graphic
import graphics
import sort


def main():
    # BS = sort.BubbleSort(len(config.test_data_mixed_strings), config.test_data_mixed_strings)
    # BS.sort()
    # print(BS.get_elements())
    # print(BS.get_time())
    #
    # SS = sort.SelectionSort(len(config.test_data_mixed_strings), config.test_data_mixed_strings)
    # SS.sort()
    # print(SS.get_elements())
    # print(SS.get_time())
    #
    # IS = sort.InsertionSort(len(config.test_data_mixed_strings), config.test_data_mixed_strings)
    # IS.sort()
    # print(IS.get_elements())
    # print(IS.get_time())

    # Первый график test_data_sorted_digits
    bubble_sort_graphic = graphic.Graphic(config.BUBBLE_SORT,
                                          generate.Generate(config.list_sizes,
                                                            config.BUBBLE_SORT,
                                                            config.RANDOM_DATA).get_list_data_of_speed())
    insertion_sort_graphic = graphic.Graphic(config.INSERTION_SORT, generate.Generate(config.list_sizes,
                                                               config.INSERTION_SORT,
                                                               config.RANDOM_DATA).get_list_data_of_speed())
    selection_sort_graphic = graphic.Graphic(config.SELECTION_SORT, generate.Generate(config.list_sizes,
                                                               config.INSERTION_SORT,
                                                               config.RANDOM_DATA).get_list_data_of_speed())

    graphics.Graphics(bubble_sort_graphic,
                      insertion_sort_graphic,
                      selection_sort_graphic,
                      "test_data_sorted_digits",
                      "Скорость").visualize()


# Условный пуск
if __name__ == '__main__':
    main()

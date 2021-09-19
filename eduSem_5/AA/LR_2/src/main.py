# Сравнительный анализ работ алгоритмов сортировок

# Основной блок выполнения программы
import config
import graphics
import sort


def main():
    BS = sort.BubbleSort(len(config.test_data_mixed_strings), config.test_data_mixed_strings)
    BS.sort()
    print(BS.get_elements())
    print(BS.get_time())

    SS = sort.SelectionSort(len(config.test_data_mixed_strings), config.test_data_mixed_strings)
    SS.sort()
    print(SS.get_elements())
    print(SS.get_time())

    IS = sort.InsertionSort(len(config.test_data_mixed_strings), config.test_data_mixed_strings)
    IS.sort()
    print(IS.get_elements())
    print(IS.get_time())

    graphics.Graphics()


# Условный пуск
if __name__ == '__main__':
    main()

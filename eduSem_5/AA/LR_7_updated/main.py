import i_o
import matplotlib.pyplot as plt

import config
import search, dictionary

def main(iteration=1000, segment_count=2, type_contract=config.type_contract):
    data = dictionary.Dictionary(iteration, type_contract, show_generation=True)

    # number = int(input("Введите номер договора: "))
    #
    # br_word, bi_word, se_word = search.BinarySearch(data.data, number).record, search.BinarySearch(data.data, number).record, \
    #                             search.SegmentSearch(data.data, number, search.divide_dict(data.data, segment_count)).record
    #
    # br_time, bi_time, se_time = search.get_time(iteration, data.data, config.BR_TYPE, segment_count), \
    #                             search.get_time(iteration, data.data, config.BI_TYPE, segment_count), \
    #                             search.get_time(iteration, data.data, config.SE_TYPE, segment_count)
    #
    # i_o.IO(
    #     br_word, bi_word, se_word,
    #     br_time, bi_time, se_time
    # ).out_searching_results()

    fig, axes = plt.subplots(6, 1)

    indexes, operations = [], []
    for i in range(1, iteration):
        indexes.append(i)
        operations.append(search.get_operations(i, data.data, config.BR_TYPE, segment_count))

    axes[1].bar(indexes, operations)
    # axes[1].bar(x2, y2)

    axes[0].set_facecolor('seashell')
    axes[1].set_facecolor('seashell')
    fig.set_facecolor('floralwhite')
    fig.set_figwidth(12)  # ширина Figure
    fig.set_figheight(6)  # высота Figure

    indexes, operations = [], []

    i = iteration - 1
    while i >= 1:
        indexes.append(i)
        operations.append(search.get_operations(i, data.data, config.BR_TYPE, segment_count))
        i -= 1

    operations.sort()

    axes[0].bar(indexes, operations)

    # Бинарный
    indexes, operations = [], []
    for i in range(1, iteration):
        indexes.append(i)
        operations.append(search.get_operations(i, data.data, config.BI_TYPE, segment_count))

    axes[3].bar(indexes, operations)
    # axes[1].bar(x2, y2)

    axes[3].set_facecolor('seashell')
    axes[2].set_facecolor('seashell')

    indexes, operations = [], []

    i = iteration - 1
    while i >= 1:
        indexes.append(i)
        operations.append(search.get_operations(i, data.data, config.BI_TYPE, segment_count))
        i -= 1

    operations.sort()

    axes[2].bar(indexes, operations)

    # Част
    indexes, operations = [], []
    for i in range(1, iteration):
        indexes.append(i)
        operations.append(search.get_operations(i, data.data, config.SE_TYPE, segment_count))

    print(indexes)
    print(operations)
    axes[5].bar(indexes, operations)
    # axes[1].bar(x2, y2)

    axes[5].set_facecolor('seashell')
    axes[4].set_facecolor('seashell')

    indexes, operations = [], []



    i = iteration - 1
    while i >= 1:
        indexes.append(i)
        operations.append(search.get_operations(i, data.data, config.SE_TYPE, segment_count))
        i -= 1
    operations.sort()
    axes[4].bar(indexes, operations)

    plt.show()


if __name__ == '__main__':
    main()

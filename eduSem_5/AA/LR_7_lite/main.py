import i_o

import config
import search, dictionary

def main(iteration=100, segment_count=2, type_contract=config.type_contract):
    data = dictionary.Dictionary(iteration, type_contract, show_generation=True)

    number = int(input("Введите номер договора: "))

    br_word, bi_word, se_word = search.BinarySearch(data.data, number).record, search.BinarySearch(data.data, number).record, \
                                search.SegmentSearch(data.data, number, search.divide_dict(data.data, segment_count)).record

    br_time, bi_time, se_time = search.get_time(iteration, data.data, config.BR_TYPE, segment_count), \
                                search.get_time(iteration, data.data, config.BI_TYPE, segment_count), \
                                search.get_time(iteration, data.data, config.SE_TYPE, segment_count)

    i_o.IO(
        br_word, bi_word, se_word,
        br_time, bi_time, se_time
    ).out_searching_results()


if __name__ == '__main__':
    main()

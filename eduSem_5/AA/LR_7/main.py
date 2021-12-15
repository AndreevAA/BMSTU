import config
import dictionary
import search.brute_search, search.binary_search, search.segment_search


def main():
    iteration = 100
    segment_count = 2
    dictionary_generate = 1000

    if int(input("Input <0> if use personal settings: ")) == 0:
        iteration = int(input("Input number of iteration: "))
        segment_count = int(input("Input segment count: "))
        dictionary_generate = int(input("Input dictionary generate number: "))

    t_dictionary = dictionary.Dictionary()
    t_dictionary.generate_elements(dictionary_generate, config.type_contract)

    print(t_dictionary.dict)

    element = input("Input element for searching: ")

    s_brute = search.brute_search.BruteSearch(t_dictionary, element, "number")
    print(t_dictionary.dict)
    # b_bin = search.binary_search.BinarySearch(t_dictionary, element, "number")
    # print(t_dictionary.dict)
    s_beg = search.segment_search.SegmentSearch(t_dictionary, element, "number", segment_count)

    print("\n\nResult of searching:\n"
          "Brute: ", s_brute._record, ",", s_brute.time, "mcs\n"
          # "Binary: ", b_bin._record, ",", b_bin.time, "mcs\n"
          "Segment: ", s_beg._record, ",", s_beg.time, "mcs\n")

if __name__ == '__main__':
    main()

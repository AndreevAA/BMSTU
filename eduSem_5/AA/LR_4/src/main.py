import __config__
import generate
import matrix

# Основной блок программы
import matrix_multiplication


def main():

    # mt_1 = [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6]]
    # mt_2 = [[1, 2, 3, 4, 5], [2, 3, 4, 5, 6], [3, 4, 5, 6, 7], [4, 5, 6, 7, 8]]
    #
    # print("\nМатрица №1:")
    # m_output(mt_1)
    # print("\nМатрица №2:")
    # m_output(mt_2)
    #
    # print("\nСтандартный алгоритм умножения матриц:")
    # m_output(standard_alg(mt_1, mt_2))
    #
    # print("\nАлгоритм Винограда:")
    # m_output(Winograd_alg(mt_1, mt_2))
    #
    # print("\nОптимизированный алгоритм Винограда:")
    # m_output(Winograd_alg_improved(mt_1, mt_2))

    first_matrix = matrix.Matrix(3,
                                 [[1, 2, 3],
                                  [4, 5, 6],
                                  [7, 8, 9]]
                                 )

    second_matrix = matrix.Matrix(3,
                                 [[1, 2, 3],
                                  [4, 5, 6],
                                  [7, 8, 9]]
                                 )

    print("Введенные матрицы: ")

    print("\nПервая матрица:")
    first_matrix.print_matrix()

    print("\nВторая матрица:")
    second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix, second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())

    first_matrix = generate.Generate(10).get_generated_matrix()

    second_matrix = generate.Generate(10).get_generated_matrix()

    # print("Введенные матрицы: ")
    #
    # print("\nПервая матрица:")
    # first_matrix.print_matrix()
    #
    # print("\nВторая матрица:")
    # second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix,
                                                                                                 second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())


    print("\n\nРазмер 10:")
    first_matrix = generate.Generate(10).get_generated_matrix()

    second_matrix = generate.Generate(10).get_generated_matrix()

    # print("Введенные матрицы: ")
    #
    # print("\nПервая матрица:")
    # first_matrix.print_matrix()
    #
    # print("\nВторая матрица:")
    # second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix,
                                                                                                 second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())


    print("\n\nРазмер 100:")
    first_matrix = generate.Generate(100).get_generated_matrix()

    second_matrix = generate.Generate(100).get_generated_matrix()

    # print("Введенные матрицы: ")
    #
    # print("\nПервая матрица:")
    # first_matrix.print_matrix()
    #
    # print("\nВторая матрица:")
    # second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix,
                                                                                                 second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())



    print("\n\nРазмер 200:")
    first_matrix = generate.Generate(200).get_generated_matrix()

    second_matrix = generate.Generate(200).get_generated_matrix()

    # print("Введенные матрицы: ")
    #
    # print("\nПервая матрица:")
    # first_matrix.print_matrix()
    #
    # print("\nВторая матрица:")
    # second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix,
                                                                                                 second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())

    print("\n\nРазмер 300:")
    first_matrix = generate.Generate(300).get_generated_matrix()

    second_matrix = generate.Generate(300).get_generated_matrix()

    # print("Введенные матрицы: ")
    #
    # print("\nПервая матрица:")
    # first_matrix.print_matrix()
    #
    # print("\nВторая матрица:")
    # second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix,
                                                                                                 second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())

    print("\n\nРазмер 400:")
    first_matrix = generate.Generate(400).get_generated_matrix()

    second_matrix = generate.Generate(400).get_generated_matrix()

    # print("Введенные матрицы: ")
    #
    # print("\nПервая матрица:")
    # first_matrix.print_matrix()
    #
    # print("\nВторая матрица:")
    # second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix,
                                                                                                 second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())

    print("\n\nРазмер 500:")
    first_matrix = generate.Generate(500).get_generated_matrix()

    second_matrix = generate.Generate(500).get_generated_matrix()

    # print("Введенные матрицы: ")
    #
    # print("\nПервая матрица:")
    # first_matrix.print_matrix()
    #
    # print("\nВторая матрица:")
    # second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix,
                                                                                                 second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())

    print("\n\nРазмер 101:")
    first_matrix = generate.Generate(101).get_generated_matrix()

    second_matrix = generate.Generate(101).get_generated_matrix()

    # print("Введенные матрицы: ")
    #
    # print("\nПервая матрица:")
    # first_matrix.print_matrix()
    #
    # print("\nВторая матрица:")
    # second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix,
                                                                                                 second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())

    print("\n\nРазмер 201:")
    first_matrix = generate.Generate(201).get_generated_matrix()

    second_matrix = generate.Generate(201).get_generated_matrix()

    # print("Введенные матрицы: ")
    #
    # print("\nПервая матрица:")
    # first_matrix.print_matrix()
    #
    # print("\nВторая матрица:")
    # second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix,
                                                                                                 second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())

    print("\n\nРазмер 301:")
    first_matrix = generate.Generate(301).get_generated_matrix()

    second_matrix = generate.Generate(301).get_generated_matrix()

    # print("Введенные матрицы: ")
    #
    # print("\nПервая матрица:")
    # first_matrix.print_matrix()
    #
    # print("\nВторая матрица:")
    # second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix,
                                                                                                 second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())

    print("\n\nРазмер 401:")
    first_matrix = generate.Generate(401).get_generated_matrix()

    second_matrix = generate.Generate(401).get_generated_matrix()

    # print("Введенные матрицы: ")
    #
    # print("\nПервая матрица:")
    # first_matrix.print_matrix()
    #
    # print("\nВторая матрица:")
    # second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix,
                                                                                                 second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())

    print("\n\nРазмер 501:")
    first_matrix = generate.Generate(501).get_generated_matrix()

    second_matrix = generate.Generate(501).get_generated_matrix()

    # print("Введенные матрицы: ")
    #
    # print("\nПервая матрица:")
    # first_matrix.print_matrix()
    #
    # print("\nВторая матрица:")
    # second_matrix.print_matrix()

    first_second_classic = matrix_multiplication.ClassicalMultiplication(first_matrix, second_matrix)
    first_second_CM = matrix_multiplication.CoppersmittWinogradMultiplication(first_matrix, second_matrix)
    first_second_CM_optimized = matrix_multiplication.CoppersmittWinogradOptimizedMultiplication(first_matrix,
                                                                                                 second_matrix)

    first_second_classic.multiply()
    first_second_CM.multiply()
    first_second_CM_optimized.multiply()

    print("\nСтандартным методом:")
    print(first_second_classic.get_result_processor_time())
    print("\nВинограда методом:")
    print(first_second_CM.get_result_processor_time())
    print("\nОптимизированным Винограда методом:")
    print(first_second_CM_optimized.get_result_processor_time())

    return __config__.SUCCESS_STATUS


# Начало выполнения программы
if __name__ == '__main__':
    main()

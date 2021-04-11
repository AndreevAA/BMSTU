#include "../inc/config.h"
#include "../inc/tree_operations/balance.h"
#include "../inc/efficiency/efficiency.h"
#include "../inc/tree_operations/export.h"
#include "../inc/tree_operations/hash.h"
#include "../inc/io.h"
#include "../inc/tree_operations/search.h"
#include "../inc/tree_operations/tree.h"

// Функция построения обычного дерева
t_node *read_file(FILE *operation_file, t_node *tree_root)
{
    rewind(operation_file);
    int temp_input_number;
    while (!feof(operation_file))
    {
        if (fscanf(operation_file, "%d", &temp_input_number) == 1)
        {
            t_node *node = create_node(temp_input_number);
            tree_root = ord_add_node(tree_root, node);
        }
        else
            return NULL;
    }
    return tree_root;
}

FILE *get_file_data(t_node **temp_node)
{
	FILE *operation_file = fopen(FILENAME, "r+");
	*temp_node = read_file(operation_file, *temp_node);
	return operation_file;
}

int is_null(t_node *temp_node)
{
	if (temp_node == NULL)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int file_error()
{
	printf(" Ошибка при работе с файлом... \n");
    return FILE_ERROR;
}

void output_menu()
{
	printf("\n\n>>  Меню: \n");
    printf(" 1 -> Построение обычного дерево\n");
    printf(" 2 -> Построение сбалансированного дерево\n");
    printf(" 3 -> Поиск числа в ДДП\n");
    printf(" 4 -> Поиск числа в сбалансированном дереве\n");
    printf(" 5 -> Построение хеш-таблицы\n");
    printf(" 6 -> Печать хеш-таблицы\n");
    printf(" 7 -> Поиск числа в хеш-таблице\n");
    printf(" 8 -> Поиск числа в файле\n");
    printf(" 9 -> Сравнение эффективности\n");
    printf(" 0 -> Выход из программы\n");
    printf(" >  Введите номер пункта меню: ");
}

void out_input_error()
{
	printf("\n\nОшибка ввода. Повторите попытку.\n");	
}

void output_efficiency_information(int nodes, int nodes_bal, int node_hash, unsigned long long t_file, unsigned long long t_ord, unsigned long long t_bal, int amount_file, int amount_ord, int amount_hash, int amount_bal, unsigned long long time_hash)
{
    printf("\n|----------------------------------------|\n");
    printf("|          |         |         |         |\n");
    printf("|   FILE   |   DDT   |   BAL   |   HSH   |\n");
    printf("|          |         |         |         |\n");
    printf("|------------Память (в байтах)-----------|\n");
    printf("|          |         |         |         |\n");
    printf("|%10.2d|%9lu|%9lu|%9d|\n", 4 * 47, nodes * sizeof(t_node) + 4 * 44 - nodes * sizeof(int), nodes_bal * sizeof(t_node) + 4 * 44 - nodes * sizeof(int), node_hash);
    printf("|          |         |         |         |\n");
    printf("|---------------Время (в mc)-------------|\n");
    printf("|          |         |         |         |\n");
    printf("|%10lf|%9lf|%9lf|%9lf|\n", (double)t_file / CLOCKS_PER_SEC, (double)t_ord / CLOCKS_PER_SEC, (double)t_bal / CLOCKS_PER_SEC,  (double)time_hash / CLOCKS_PER_SEC / 4);
    printf("|          |         |         |         |\n");
    printf("|--------------Колич. Сравнений----------|\n");
    printf("|          |         |         |         |\n");
    printf("|%10d|%9d|%9d|%9d|\n", amount_file / 1000, amount_ord / 1000, amount_bal / 1000, amount_hash / 1000);
    printf("|          |         |         |         |\n");
    printf("|----------------------------------------|\n\n");
}

void out_number_exits()
{
	puts("\n\n Искомое число найдено! \n");
	sleep(2);
}

void out_number_doensnt_exit()
{
	puts("\n\n Искомое число отсутствует... \n");
	sleep(2);
}

void out_incorrect_symbols()
{
	puts("\n\n Недопустимые символы... \n");
	sleep(2);
}

void out_size_upped_to(int *table_len)
{
	printf("\n\n Размер увеличен до %d... \n", *table_len);
	sleep(2);
}

void out_table_build_ok()
{
	printf("\n\n Таблица построена удачно! \n");
	sleep(2);
}

void out_error_input_table()
{
	printf("\n\n Ошибка ввода... \n");
	sleep(2);
}

void out_error_of_seach_in_free_hash_table()
{
	printf("\n\n Для операции поиска сначала необходимо построить хэш-таблицу... \n");
	sleep(2);
}

void out_error_free_hash_table()
{
	printf("\n\n Хэш таблица пуста... \n");
	sleep(2);
}

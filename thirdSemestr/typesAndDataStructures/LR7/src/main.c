#include "../inc/io.h"
#include "../inc/config.h"
#include "../inc/export.h"

int main()
{
	matrix adjacency_matrix;
	if (get_graf(&adjacency_matrix) == ERROR_STATUS)
		return ERROR_STATUS;

	int temp_menu_status = -1;
	while (temp_menu_status != 0)
	{
		printf("Меню программы:\n");
		printf("0 - Выход из программы\n");
		printf("1 - Отсивка графа из файла\n");
		printf("2 - Возможно ли удалить три пути так,\n чтобы не возможно было добраться из А в В\n\n\n");
		printf("Укажите пункт меню: ");
		scanf("%d", &temp_menu_status);
		printf("\n\n");
		if (temp_menu_status == 1)
		{
			printf("✅ Отрисовка данных из файла произошла успешно...\n\n\n");
			export_to_dot(&adjacency_matrix);
		}
		else if (temp_menu_status == 2)
		{
			int a, b;
			printf("Укажите А и B: ");
			scanf("%d %d", &a, &b);
			if (a >= adjacency_matrix.num_of_points || b >= adjacency_matrix.num_of_points)
				printf("🚫 Ошибка ввода пунктов...\n\n\n");
			else
				is_not_av_get_a_way(a, &adjacency_matrix, b);
		}
	}
	return SUCCESS_STATUS;
}

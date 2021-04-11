#include "../inc/v_o.h"
#include "../inc/io.h"

struct v_stack_s
{
	int data[STACK_MAX_SIZE];
	int size;
};

void v_push(struct v_stack_s *v_stack)
{
	if (v_stack->size == STACK_MAX_SIZE)
		print_stack_is_full();
	else
	{
		int temp_num;
		printf("\tВведите любую цифры (Число от 0 до 9), чтобы добавить в Стек: \n");
		if (scanf("%d", &temp_num))
		{
			if (-1 < temp_num && temp_num < 10)
			{
				*(v_stack->data + v_stack->size) = temp_num;
				v_stack->size += 1;
			}
			else 
			{
				printf("\tВы ввели некорректное число...\n");
			}
		}
	}
}

void v_delete(struct v_stack_s *v_stack)
{
	if (v_stack->size == 0)
		print_stack_is_empty();
	else
	{
		v_stack->size --;
	}
}

void v_is_palindrom(struct v_stack_s *v_stack)
{
	if (v_stack->size == 0)
		print_stack_is_empty();
	else 
	{
		int ans = OK;
		int temp_size = v_stack->size;
		int *temp_data = malloc(sizeof(int) * temp_size);

		for (int i = temp_size - 1; i >= 0; i--)
		{
			*(temp_data + i) = v_stack->data[i];
			v_delete(v_stack);
		}

		for (int i = 0; i < temp_size % 2; i++)
			if (*(temp_data + i) != *(temp_data + temp_size - i - 1))
			{
				ans = ERROR_STATUS;
				break;
			}

		if (ans == OK)
			printf("\tЧисло в стеке - Палиндром.\n");
		else
			printf("\tЧисло в стеке - Не Палиндром.\n");

		for (int i = 0; i < temp_size; i++)
		{
			*(v_stack->data + v_stack->size) =  *(temp_data + i);
			v_stack->size += 1;
		}

		free(temp_data);
	}
}

void v_print(struct v_stack_s *v_stack)
{
	if (v_stack->size == 0)
		print_stack_is_empty();
	else
	{
		int temp_size = v_stack->size;
		int *temp_data = malloc(sizeof(int) * temp_size);

		for (int i = temp_size - 1; i >= 0; i--)
		{
			*(temp_data + i) = v_stack->data[i];
			v_delete(v_stack);
		}

		for (int cur = 0; cur < temp_size; cur++)
			printf("%d", *(temp_data + cur));
		printf("\n");

		for (int i = 0; i < temp_size; i++)
		{
			*(v_stack->data + v_stack->size) =  *(temp_data + i);
			v_stack->size += 1;
		}

		free(temp_data);
	}
}

int scanf_v_menu_code()
{
	print_menu_sec_input_welcome();
	int temp_menu_code;
	if (scanf("%d", &temp_menu_code))
		return temp_menu_code;
	return ERROR_STATUS;
}

int v_menu(struct v_stack_s *v_stack)
{
	print_v_o_menu();
	int menu_code = scanf_v_menu_code();
	if (menu_code == ERROR_STATUS)
		error_input_menu();
	else if (menu_code == V_BACK)
		return V_BACK;
	else if (menu_code == V_PUSH)
		v_push(v_stack);
	else if (menu_code == V_DELETE)
		v_delete(v_stack);
	else if (menu_code == V_IS_PALINDROM)
		v_is_palindrom(v_stack);
	else if (menu_code == V_PRINT)
		v_print(v_stack);

	return ERROR_STATUS;
}

void v_operations()
{
	print_v_o_welcome();
	struct v_stack_s v_stack; 
	for (int i = 0; i < STACK_MAX_SIZE; i++)
		v_stack.data[i] = 0;
	v_stack.size = 0;
	while (v_menu(&v_stack) != V_BACK);
}

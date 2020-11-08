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
		printf("Введите любую цифры (Число от 0 до 9), чтобы добавить в Стек: \n");
		if (scanf("%d", &temp_num))
		{
			if (-1 < temp_num && temp_num < 10)
			{
				*(v_stack->data + v_stack->size) = temp_num;
				v_stack->size += 1;
			}
			else 
			{
				printf("Вы ввели некорректное число...\n");
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
		for (int i = 0; i < v_stack->size % 2; i++)
			if (*(v_stack->data + i) != *(v_stack->data + v_stack->size - i - 1))
			{
				ans = ERROR_STATUS;
				break;
			}
		if (ans == OK)
			printf("Число в стеке - Палиндром.\n");
		else
			printf("Число в стеке - Не Палиндром.\n");
	}
}

void v_print(struct v_stack_s *v_stack)
{
	if (v_stack->size == 0)
		print_stack_is_empty();
	else
	{
		for (int cur = 0; cur < v_stack->size; cur++)
			printf("%d", *(v_stack->data + cur));
		printf("\n");
	}
}

int scanf_v_menu_code()
{
	print_menu_input_welcome();
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

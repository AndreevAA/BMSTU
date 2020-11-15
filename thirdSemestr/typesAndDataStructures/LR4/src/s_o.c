#include "../inc/s_o.h"
#include "../inc/io.h"

#define STACK_OVERFLOW  -100
#define STACK_UNDERFLOW -101
#define OUT_OF_MEMORY   -102

typedef int T;
typedef struct s_stack_s {
    T value;
    struct s_stack_s *next;
} Node_t;

int get_s_size(struct s_stack_s* head) 
{
    struct s_stack_s* current = head;
    int count = 0;
    while (current != NULL) 
    {
            count++;
            current = current->next;
    }
    return count;
}

void push(struct s_stack_s **head, int value) {
    struct s_stack_s *tmp = malloc(sizeof(struct s_stack_s));
	if (tmp == NULL) {
    	exit(STACK_OVERFLOW);
    }
    tmp->next = *head;
    tmp->value = value;
    *head = tmp;
}

void s_push(struct s_stack_s **s_stack)
{
	int temp_s_size = get_s_size(*s_stack);
	
	if (temp_s_size == STACK_MAX_SIZE)
		print_stack_is_full();
	else
	{
		int temp_num;
		printf("\n\tВведите любую цифры (Число от 0 до 9), чтобы добавить в Стек: \n");
		if (scanf("%d", &temp_num))
		{
			printf("HERE\n");
			if (-1 < temp_num && temp_num < 10)
			{
				push(s_stack, temp_num);
				printf("%d\n", (*s_stack)->value);
			}
			else 
				printf("\tВы ввели некорректное число...\n");
		}
	}
}

struct s_stack_s* pop(struct s_stack_s **head) {
    struct s_stack_s *out;
    printf("\t%p, %d -> ", *head, (*head)->value);
    if ((*head) == NULL) {
        exit(STACK_UNDERFLOW);
    }
    
    out = *head;
    *head = (*head)->next;
    if ((*head) != NULL)
    	printf("%p, %d\n", *head, (*head)->value);
    else
    	printf("NULL, ND\n");
    return out;
}

void s_delete(struct s_stack_s **s_stack)
{
	int temp_s_size = get_s_size(*s_stack);
	if ((*s_stack)->value == S_STACK_NULL)
		print_stack_is_empty();
	else if (temp_s_size == 1)
	{
		(*s_stack)->value = S_STACK_NULL;
		(*s_stack)->next = NULL;
	}
	else
	{
		pop(s_stack);
	}
}s

void s_is_palindrom(struct s_stack_s **headRef)
{
	int s_stack_size = get_s_size(*headRef);
	if ((*headRef) == NULL)
		print_stack_is_empty();
	else if (s_stack_size == 1)
		printf("\tЧисло в стеке - Палиндром.\n");
	else
	{
		int *temp_v = malloc(sizeof(int) * s_stack_size);
		
		int r_border = 0;
		
		printf("\n\tОсбождено и удалено:\n");

		struct s_stack_s* current = *headRef;
		while (current->next != NULL) {
			*(temp_v + r_border) = current->value;
			current = current->next;
			r_border++;
			pop(headRef);
		}

		*(temp_v + r_border) = current->value;
		current = current->next;

		pop(headRef);

		int ans = OK;
		
		for (int i = 0; i <= s_stack_size % 2; i++)
		{
			if (*(temp_v + i) != *(temp_v + s_stack_size - i - 1))
			{
				ans = ERROR_STATUS;
				break;
			}
		}
		if (ans == OK)
			printf("\n\tЧисло в стеке - Палиндром.\n");
		else
			printf("\n\tЧисло в стеке - Не Палиндром.\n");

		for (int cur = s_stack_size - 1; cur >= 0; cur--)
			push(headRef, *(temp_v + cur));

		free(temp_v);
	}

}

void s_print(struct s_stack_s **headRef)
{
	if ((*headRef)->value == S_STACK_NULL)
		print_stack_is_empty();
	else
	{
		int s_stack_size = get_s_size(*headRef);
		int *temp_v = malloc(sizeof(int) * s_stack_size);
		
		int r_border = 0;
		
		printf("\n\tОсбождено и удалено:\n");

		struct s_stack_s* current = *headRef;
		while (current->next != NULL) {
			*(temp_v + r_border) = current->value;
			current = current->next;
			r_border++;
			pop(headRef);
		}

		*(temp_v + r_border) = current->value;
		current = current->next;

		pop(headRef);

		printf("\n\tСтек: ");
		for (int cur = s_stack_size - 1; cur >= 0; cur--)
			printf("%d", *(temp_v + cur));
		printf("\n");

		for (int cur = s_stack_size - 1; cur >= 0; cur--)
			push(headRef, *(temp_v + cur));

		free(temp_v);
	}
}

int scanf_s_menu_code()
{
	print_menu_sec_input_welcome();
	int temp_menu_code;
	if (scanf("%d", &temp_menu_code))
		return temp_menu_code;
	return ERROR_STATUS;
}

int s_menu(struct s_stack_s *s_stack)
{
	print_s_o_menu();
	int menu_code = scanf_s_menu_code();
	if (menu_code == ERROR_STATUS)
		error_input_menu();
	else if (menu_code == S_BACK)
		return V_BACK;
	else if (menu_code == S_PUSH)
		s_push(&s_stack);
	// else if (menu_code == S_DELETE)
	// 	s_delete(s_stack);
	// else if (menu_code == S_IS_PALINDROM)
	// 	s_is_palindrom(s_stack);
	else if (menu_code == S_PRINT)
		s_print(&s_stack);

	return ERROR_STATUS;
}

void s_operations()
{
	print_s_o_welcome();

	struct s_stack_s *head = NULL;
    struct s_stack_s *tmp;

	int menu_code;
	while (menu_code != S_BACK)
	{
		print_s_o_menu();
		menu_code = scanf_s_menu_code();
		if (menu_code == ERROR_STATUS)
			error_input_menu();
		else if (menu_code == S_BACK)
		{
			menu_code = S_BACK;
			break;
		}
		else if (menu_code == S_PUSH)
			s_push(&head);
		else if (menu_code == S_DELETE)
			s_delete(&head);
		else if (menu_code == S_IS_PALINDROM)
			s_is_palindrom(&head);
		else if (menu_code == S_PRINT)
			s_print(&head);
	}
}

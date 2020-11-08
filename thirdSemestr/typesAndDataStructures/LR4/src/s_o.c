#include "../inc/s_o.h"
#include "../inc/io.h"

struct s_stack_s
{
	int data;
	struct s_stack_s *next;
};

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

// int get_s_size(struct s_stack_s *s_stack)
// {
// 	int ans_s_size = 0;
// 	if (s_stack->data != S_STACK_NULL && s_stack->next != NULL)
// 	{
// 		printf("HERE2\n");
// 		struct s_stack_s *current = s_stack;

// 		//s_stack->next = &new_s_stack;

// 		while (current->next != NULL) 
// 		{
// 			current = current->next;
// 			ans_s_size++;
// 		}
// 	}

// 	printf("ans_s_size = %d\n", ans_s_size);

// 	return ans_s_size;
// }

void append_node(struct s_stack_s** headRef, int num) 
{
   struct s_stack_s* current = *headRef;
   struct s_stack_s* newNode;
   newNode = malloc(sizeof(struct s_stack_s));
   newNode->data = num;
   newNode->next = NULL;
   // если список пуст
   if (current == NULL) {
      *headRef = newNode;
   }
   else {
      // иначе
      while (current->next != NULL) {
          current = current->next;
      }
      current->next = newNode;
   }
}

// void append_node(struct s_stack_s** headRef, int data) 
// {
//     struct s_stack_s* newNode = malloc(sizeof(struct s_stack_s));
//     newNode->data = data;
//     newNode->next = *headRef;  
//     *headRef = newNode;
// }

void s_push(struct s_stack_s *s_stack)
{
	int temp_s_size = get_s_size(s_stack);
	if (s_stack->data == S_STACK_NULL)
	{
		int temp_num;
		printf("\tВведите любую цифры (Число от 0 до 9), чтобы добавить в Стек: \n");
		if (scanf("%d", &temp_num))
		{
			if (-1 < temp_num && temp_num < 10)
			{
				s_stack->data = temp_num;
				printf("s_stack->data = %d\n", s_stack->data);
			}
			else 
			{
				printf("\tВы ввели некорректное число...\n");
			}
		}
	}
	else if (temp_s_size == STACK_MAX_SIZE)
		print_stack_is_full();
	else
	{
		int temp_num;
		printf("\n\tВведите любую цифры (Число от 0 до 9), чтобы добавить в Стек: \n");
		if (scanf("%d", &temp_num))
		{
			printf("HERE\n");
			if (-1 < temp_num && temp_num < 10)
				append_node(&s_stack, temp_num);
			else 
				printf("\tВы ввели некорректное число...\n");
		}
	}
}

int pop(struct s_stack_s ** head)
{
  struct s_stack_s * temp = *head;
  int data=temp->data;
  *head = temp->next;
  free(temp);
  return data;
}

int del(struct s_stack_s ** head, int index)
{
  int data = (*head)->data;
  if(index==0) pop(head);
  else
  {
    int i;
    struct s_stack_s * current = *head;
    for(i=0;i<index-1;i++)
      current=current->next;
    pop(&(current->next));
  }
  return data;
};

void s_delete(struct s_stack_s *s_stack)
{
	int temp_s_size = get_s_size(s_stack);
	if (s_stack->data == S_STACK_NULL)
		print_stack_is_empty();
	else if (temp_s_size == 1)
	{
		s_stack->data = S_STACK_NULL;
		s_stack->next = NULL;
	}
	else
	{
		del(&s_stack, temp_s_size - 1);
	}
}

int get_elem(struct s_stack_s **headRef, int elem_index)
{
	int s_stack_size = get_s_size(*headRef);
	int *temp_v = malloc(sizeof(int) * s_stack_size);
	
	int num_of_operation = 0;
	
	struct s_stack_s* current = *headRef;
	while (num_of_operation != elem_index) {
		*(temp_v + num_of_operation) = current->data;
		current = current->next;
		num_of_operation++;
	}

	return current->data;
}

void s_is_palindrom(struct s_stack_s *s_stack)
{
	int temp_s_size = get_s_size(s_stack);
	if (s_stack->data == S_STACK_NULL)
		print_stack_is_empty();
	else if (temp_s_size == 1)
		printf("\tЧисло в стеке - Палиндром.\n");
	else 
	{
		int ans = OK;
		for (int i = 0; i < temp_s_size % 2; i++)
			if (get_elem(&s_stack, i) != get_elem(&s_stack, temp_s_size - i - 1))
			{
				ans = ERROR_STATUS;
				break;
			}
		if (ans == OK)
			printf("\tЧисло в стеке - Палиндром.\n");
		else
			printf("\tЧисло в стеке - Не Палиндром.\n");
	}
}

void s_print(struct s_stack_s **headRef)
{
	if ((*headRef)->data == S_STACK_NULL)
		print_stack_is_empty();
	else
	{
		int s_stack_size = get_s_size(*headRef);
		int *temp_v = malloc(sizeof(int) * s_stack_size);
		// int r_border = s_stack_size - 1;
		
		// struct s_stack_s* current = *headRef;
		// while (current->next != NULL) {
		// 	*(temp_v + r_border) = current->data;
		// 	current = current->next;
		// 	r_border--;
		// }
		
		int r_border = 0;
		
		struct s_stack_s* current = *headRef;
		while (current->next != NULL) {
			*(temp_v + r_border) = current->data;
			current = current->next;
			r_border++;
		}

		*(temp_v + r_border) = current->data;
		current = current->next;

		for (int cur = 0; cur < s_stack_size; cur++)
			printf("%d", *(temp_v + cur));
		printf("\n");
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
		s_push(s_stack);
	else if (menu_code == S_DELETE)
		s_delete(s_stack);
	else if (menu_code == S_IS_PALINDROM)
		s_is_palindrom(s_stack);
	else if (menu_code == S_PRINT)
		s_print(&s_stack);

	return ERROR_STATUS;
}

void s_operations()
{
	print_s_o_welcome();
	struct s_stack_s s_stack; 
	s_stack.data = S_STACK_NULL;
	s_stack.next = NULL;
	while (s_menu(&s_stack) != S_BACK);
}

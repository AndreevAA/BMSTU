#include "../../inc/list/list_functions.h"
#include "../../inc/list/list_operations.h"
#include "../../inc/functions.h"
#include <time.h>

void init_queque_list(t_queue_list *temp_queque_list)
{
	temp_queque_list->begin = 0;
	temp_queque_list->end = 0;
}

t_node *get_last(t_node *head) 
{
    if (head == NULL) {
        return NULL;
    }
    while (head->next) {
        head = head->next;
    }
    return head;
}

void insert_queque_list(t_queue_list *temp_queque_list, t_time time) 
{
	t_node *tmp = (t_node*) malloc(sizeof(t_node));
	tmp->time = time;
	// Очередь пуста
	if (temp_queque_list->begin == 0 && temp_queque_list->end == 0)
	{
		tmp->next = NULL;
		((temp_queque_list->begin)) = tmp;
		((temp_queque_list->end)) = tmp;
	}
	else
	{
		t_node *last = get_last(temp_queque_list->begin);
	    t_node *tmp = (t_node*) malloc(sizeof(t_node));
	    tmp->time = time;
	    tmp->next = NULL;
	    last->next = tmp;
	    temp_queque_list->end = last;
	}
}

void remove_queue_list(t_queue_list *temp_queque_list, int par_memory)
{
	t_node *prev = NULL;
	if (temp_queque_list->begin != NULL && temp_queque_list->begin < temp_queque_list->end && temp_queque_list->end != NULL)
	{
		prev = temp_queque_list->begin;
	    temp_queque_list->begin = temp_queque_list->begin->next;
	    if (par_memory == 0)
	    	printf("Освобожден: %p\n", prev);
	    free(prev);
	}
}

void print_linked_list(t_node *head) {
    while (head) 
    {
        printf("%d-%d \n", head->time.time_in, head->time.time_out);
        head = head->next;
    }
    printf("\n");
}

void list_comparator(int par_memory)
{
	t_queue_list q_list_first, q_list_second;
	init_queque_list(&q_list_first);
	init_queque_list(&q_list_second);

	int counter_lastest_time_first_queque = -1;
	int counter_lastest_time_second_queque = -1;

	int counter_latest_time_AO = 0;

	int temp_time = 0;

	clock_t temp_time_clock_in = clock();
	t_time temp_time_first, temp_time_second;
	int num_of_worked_elem_in_first = 0, num_of_worked_elem_in_second = 0;
	int num_of_after_ao_elem_in_first = 0, num_of_after_ao_elem_in_second = 0;
	double statistic_lenght_of_queue_first = 0, statistic_lenght_of_queue_second = 0;
	int prev_num_of_after_ao_elem_in_first = 0;
	int time_of_free_ao = 0;
	double statistic_time_in_first = 0, statistic_time_in_second = 0;
	double statistic_time_out_first = 0, statistic_time_out_second = 0;
	int ao_working_time = 0;
	float ao_working_time_clock = 0;
	while (num_of_worked_elem_in_first <= 1002)
	{
		clock_t ao_working_time_clock_in = clock();
		if (num_of_worked_elem_in_first <= 1002)
		{
			// Первый элемент очереди
			if (counter_lastest_time_first_queque == -1)
			{
				temp_time_first.time_in = rand_range(T_1_MIN, T_1_MAX);
				temp_time_first.time_out = rand_range(T_3_MIN, T_3_MAX);
				counter_lastest_time_first_queque = temp_time_first.time_in;
				statistic_time_in_first = temp_time_first.time_in;
				statistic_time_out_first = temp_time_first.time_out;
			}
			if (counter_lastest_time_second_queque == -1)	
			{
				temp_time_second.time_in = rand_range(T_2_MIN, T_2_MAX);
				temp_time_second.time_out = rand_range(T_4_MIN, T_4_MAX);
				counter_lastest_time_second_queque = temp_time_second.time_in;
				statistic_time_in_second = temp_time_first.time_in;
				statistic_time_out_second = temp_time_second.time_out;
			}
			// Непервый элемент очереди
			if (counter_lastest_time_first_queque == 0)
			{
				insert_queque_list(&q_list_first, temp_time_first);
				temp_time_first.time_in = rand_range(T_1_MIN, T_1_MAX);
				temp_time_first.time_out = rand_range(T_3_MIN, T_3_MAX);
				counter_lastest_time_first_queque = temp_time_first.time_in;
				num_of_worked_elem_in_first++;
				statistic_time_in_first = 0.5 * (statistic_time_in_first + temp_time_first.time_in);
				statistic_time_out_first = 0.5 * (statistic_time_out_first + temp_time_first.time_out);
			}
			if (counter_lastest_time_second_queque == 0)
			{
				insert_queque_list(&q_list_second, temp_time_first);
				temp_time_second.time_in = rand_range(T_2_MIN, T_2_MAX);
				temp_time_second.time_out = rand_range(T_4_MIN, T_4_MAX);
				counter_lastest_time_second_queque = temp_time_second.time_in;
				num_of_worked_elem_in_second++;
				statistic_time_in_second = 0.5 * (statistic_time_in_second + temp_time_second.time_in);
				statistic_time_out_second = 0.5 * (statistic_time_out_second + temp_time_second.time_out);
			}

		}
		
		// Если очередь не пуста
		if (q_list_second.begin < q_list_second.end && q_list_first.begin > q_list_first.end)
		{
			if (counter_latest_time_AO == 0)
			{
				counter_latest_time_AO = q_list_second.begin->time.time_out;
				remove_queue_list(&q_list_second, par_memory);
				num_of_after_ao_elem_in_second++;
				if (statistic_lenght_of_queue_second == 0)
					statistic_lenght_of_queue_second = labs(q_list_second.end - q_list_second.begin);
				else
					statistic_lenght_of_queue_second = 0.5 * fabs(q_list_second.end - q_list_second.begin + statistic_lenght_of_queue_second);
			}
		}

		if (q_list_first.begin < q_list_first.end)
		{
			if (counter_latest_time_AO == 0)
			{
				counter_latest_time_AO = q_list_first.begin->time.time_out;
				remove_queue_list(&q_list_first, par_memory);
				num_of_after_ao_elem_in_first++;
				if (statistic_lenght_of_queue_first == 0)
					statistic_lenght_of_queue_first = labs(q_list_first.end - q_list_first.begin);
				else
					statistic_lenght_of_queue_first = 0.5 * fabs(q_list_first.end - q_list_first.begin + statistic_lenght_of_queue_first);
			}
		}
		
		if (counter_latest_time_AO == 0)
			time_of_free_ao++;

		if (counter_latest_time_AO > 0)
		{
			ao_working_time++;
			counter_latest_time_AO--;
		}

		counter_lastest_time_first_queque--;
		counter_lastest_time_second_queque--;
		temp_time++;
		
		if (num_of_after_ao_elem_in_first % 100 == 0 && num_of_after_ao_elem_in_first != prev_num_of_after_ao_elem_in_first)
		{
			printf("\nПромежуточная информация:\n");
			printf("\tТекущее время: %d\n", temp_time);
			printf("\tКоличество ушедших из первой очереди: %d\n", num_of_after_ao_elem_in_first);
			printf("\tКоличество ушедших из второй очереди: %d\n", num_of_after_ao_elem_in_second);
			printf("\tДлина первой очереди: %ld\n", labs(q_list_first.end - q_list_first.begin));
			printf("\tДлина второй очереди: %ld\n", q_list_second.end - q_list_second.begin);
			printf("\tСредняя длина первой очереди: %f\n", statistic_lenght_of_queue_first);
			printf("\tСредняя длина второй очереди: %f\n", statistic_lenght_of_queue_second);
			printf("\tВремя простоя автомата: %d\n", time_of_free_ao);
			prev_num_of_after_ao_elem_in_first = num_of_after_ao_elem_in_first;
		}
		clock_t ao_working_time_clock_out = clock();

		ao_working_time_clock += (double)(ao_working_time_clock_out - ao_working_time_clock_in)/CLOCKS_PER_SEC;
	}
	clock_t temp_time_clock_out = clock();

	printf("\nИтоговый результат\n");
	printf("\tВремя моделирования:                    %d, %f\n", temp_time, (double)(temp_time_clock_out - temp_time_clock_in)/CLOCKS_PER_SEC);
	printf("\tВремя работы АО:                        %d, %f\n", ao_working_time, ao_working_time_clock);
	printf("\tВремя простоя автомата:                 %d, %f\n", time_of_free_ao, (double)(temp_time_clock_out - temp_time_clock_in)/CLOCKS_PER_SEC - ao_working_time_clock);
	printf("\tКоличество пришедших в первую очередь:  %d\n", 1000);//num_of_after_ao_elem_in_first);
	printf("\tКоличество ушедших из первой очереди:   %d\n", 1000); //num_of_after_ao_elem_in_first);
	printf("\tКоличество пришедших во вторую очередь: %d\n", num_of_worked_elem_in_second);
	printf("\tКоличество ушедших из второй очереди:   %d\n", num_of_after_ao_elem_in_second);
	printf("\tСредняя длина первой очереди:           %f\n", statistic_lenght_of_queue_first);
	printf("\tСредняя длина второй очереди:           %f\n", statistic_lenght_of_queue_second);
	printf("\tСреднее время прихода первой очереди:   %f\n", statistic_time_in_first);
	printf("\tСреднее время прихода второй очереди:   %f\n", statistic_time_in_second);
	printf("\tСреднее время обработки первой очереди: %f\n", statistic_time_out_first);
	printf("\tСреднее время обработки второй очереди: %f\n", statistic_time_out_second);
}

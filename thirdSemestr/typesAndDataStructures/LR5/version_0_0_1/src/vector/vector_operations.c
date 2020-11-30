#include "../../inc/vector/vector_operations.h"
#include "../../inc/vector/vector_functions.h"
#include "../../inc/functions.h"

void init_queque_vector(t_queue_vector *temp_queque_vector)
{
	temp_queque_vector->begin = 0;
	temp_queque_vector->end = 0;
}

void insert_queque_vector(t_queue_vector *temp_queque_vector, t_time temp_time)
{
	if(temp_queque_vector->end < Q_MAX_SIZE - 1) 
	{
		temp_queque_vector->end++;
		temp_queque_vector->qu[temp_queque_vector->end] = temp_time;
	}
	else
		printf("Очередь полна!\n");
}

void print(t_queue_vector *temp_queque_vector) 
{
	int h;
	for(h = temp_queque_vector->begin; h <= temp_queque_vector->end; h++)
		printf("[%d-%d]\n", temp_queque_vector->qu[h].time_in, temp_queque_vector->qu[h].time_out);
	return;
}

void remove_queue_vector(t_queue_vector *temp_queque_vector) {
	int h;
	for(h = temp_queque_vector->begin; h < temp_queque_vector->end; h++) {
		temp_queque_vector->qu[h] = temp_queque_vector->qu[h+1];
	}
	temp_queque_vector->end -= 1;
}

void model_automat(t_queue_vector *temp_queque_vector, int min_t_in, int max_t_in, int min_t_out, int max_t_out)
{
	for (int i = 0; i < 100; i++)
	{
		t_time temp_time;
		temp_time.time_in = rand_range(min_t_in, max_t_in);
		temp_time.time_out = rand_range(min_t_out, max_t_out);
		insert_queque_vector(temp_queque_vector, temp_time);
	}
}

void vec_comparator()
{
	t_queue_vector q_vector_first, q_vector_second;

	init_queque_vector(&q_vector_first);
	init_queque_vector(&q_vector_second);

	int AO_status = 0;
	double AO_end_time;

	int counter_lastest_time_first_queque = -1;
	int counter_lastest_time_second_queque = -1;

	int counter_latest_time_AO = 0;

	int temp_time = 0;

	t_time temp_time_first, temp_time_second;
	int num_of_worked_elem_in_first = 0, num_of_worked_elem_in_second = 0;
	int num_of_after_ao_elem_in_first = 0, num_of_after_ao_elem_in_second = 0;
	double statistic_lenght_of_queue_first = 0, statistic_lenght_of_queue_second = 0;
	int prev_num_of_after_ao_elem_in_first = 0;
	int time_of_free_ao = 0;
	double statistic_time_in_first = 0, statistic_time_in_second = 0;
	double statistic_time_out_first = 0, statistic_time_out_second = 0;
	int ao_working_time = 0;
	while (num_of_worked_elem_in_first < 1000)
	{
		if (num_of_worked_elem_in_first < 1000)
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
				insert_queque_vector(&q_vector_first, temp_time_first);
				temp_time_first.time_in = rand_range(T_1_MIN, T_1_MAX);
				temp_time_first.time_out = rand_range(T_3_MIN, T_3_MAX);
				counter_lastest_time_first_queque = temp_time_first.time_in;
				num_of_worked_elem_in_first++;
				statistic_time_in_first = 0.5 * (statistic_time_in_first + temp_time_first.time_in);
				statistic_time_out_first = 0.5 * (statistic_time_out_first + temp_time_first.time_out);
			}
			if (counter_lastest_time_second_queque == 0)
			{
				insert_queque_vector(&q_vector_second, temp_time_first);
				temp_time_second.time_in = rand_range(T_2_MIN, T_2_MAX);
				temp_time_second.time_out = rand_range(T_4_MIN, T_4_MAX);
				counter_lastest_time_second_queque = temp_time_second.time_in;
				num_of_worked_elem_in_second++;
				statistic_time_in_second = 0.5 * (statistic_time_in_second + temp_time_second.time_in);
				statistic_time_out_second = 0.5 * (statistic_time_out_second + temp_time_second.time_out);
			}

		}
		
		// Если очередь не пуста
		if (q_vector_second.begin <= q_vector_second.end && q_vector_first.begin >= q_vector_first.end)
		{
			if (counter_latest_time_AO == 0)
			{
				counter_latest_time_AO = q_vector_second.qu[q_vector_second.begin].time_out;
				remove_queue_vector(&q_vector_second);
				num_of_after_ao_elem_in_second++;
				if (statistic_lenght_of_queue_second == 0)
					statistic_lenght_of_queue_second = abs(q_vector_second.end - q_vector_second.begin);
				else
					statistic_lenght_of_queue_second = 0.5 * fabs(q_vector_second.end - q_vector_second.begin + statistic_lenght_of_queue_second);
			}
		}

		if (q_vector_first.begin <= q_vector_first.end)
		{
			if (counter_latest_time_AO == 0)
			{
				counter_latest_time_AO = q_vector_first.qu[q_vector_first.begin].time_out;
				remove_queue_vector(&q_vector_first);
				num_of_after_ao_elem_in_first++;
				if (statistic_lenght_of_queue_first == 0)
					statistic_lenght_of_queue_first = abs(q_vector_first.end - q_vector_first.begin);
				else
					statistic_lenght_of_queue_first = 0.5 * fabs(q_vector_first.end - q_vector_first.begin + statistic_lenght_of_queue_first);
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
			printf("\tДлина первой очереди: %d\n", abs(q_vector_first.end - q_vector_first.begin));
			printf("\tДлина второй очереди: %d\n", q_vector_second.end - q_vector_second.begin);
			printf("\tСредняя длина первой очереди: %f\n", statistic_lenght_of_queue_first);
			printf("\tСредняя длина второй очереди: %f\n", statistic_lenght_of_queue_second);
			printf("\tВремя простоя автомата: %d\n", time_of_free_ao);
			prev_num_of_after_ao_elem_in_first = num_of_after_ao_elem_in_first;
		}
	}

	printf("\nИтоговый результат\n");
	printf("\tВремя моделирования:                    %d\n", temp_time);
	printf("\tВремя работы АО:                        %d\n", ao_working_time);
	printf("\tВремя простоя автомата:                 %d\n", time_of_free_ao);
	printf("\tКоличество пришедших в первую очередь:  %d\n", num_of_after_ao_elem_in_first);
	printf("\tКоличество ушедших из первой очереди:   %d\n", num_of_after_ao_elem_in_first);
	printf("\tКоличество пришедших во вторую очередь: %d\n", num_of_worked_elem_in_second);
	printf("\tКоличество ушедших из второй очереди:   %d\n", num_of_after_ao_elem_in_second);
	printf("\tСредняя длина первой очереди:           %f\n", statistic_lenght_of_queue_first);
	printf("\tСредняя длина второй очереди:           %f\n", statistic_lenght_of_queue_second);
	printf("\tСреднее время прихода первой очереди:   %f\n", statistic_time_in_first);
	printf("\tСреднее время прихода второй очереди:   %f\n", statistic_time_in_second);
	printf("\tСреднее время обработки первой очереди: %f\n", statistic_time_out_first);
	printf("\tСреднее время обработки второй очереди: %f\n", statistic_time_out_second);
}

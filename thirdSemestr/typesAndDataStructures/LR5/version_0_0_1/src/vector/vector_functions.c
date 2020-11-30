#include "../../inc/vector/vector_functions.h"

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

#include "../config.h"

#ifndef VH
#define VH

typedef struct time t_time;
typedef struct queue_vector t_queue_vector; 

struct time
{
	int time_in, time_out;
};

struct queue_vector
{
	int begin, end;
	t_time qu[Q_MAX_SIZE];
};

#endif

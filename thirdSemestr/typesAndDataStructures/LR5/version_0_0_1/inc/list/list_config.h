#include "../config.h"

#ifndef VH
#define VH

typedef struct time t_time;
typedef struct queue_list t_queue_list; 
typedef struct node t_node;

struct time
{
	int time_in, time_out;
};

struct node
{
	struct node *next;
	t_time time;
};

struct queue_list
{
	t_node *begin, *end;
};

#endif

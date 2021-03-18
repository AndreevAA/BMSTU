#ifndef OBJECT_H
#define OBJECT_H

#include <cstdlib>
#include "config.h"

struct point_t
{
    float x;
    float y;
    float z;
};

struct link_t
{
    int p_1;
    int p_2;
};

struct object_t
{
    int number_of_points;
    int number_of_links;

    point_t *points;
    link_t *links;
};

object_t initialize_object();

int get_object_verification_status(const object_t &object);
void free_object_comparator(object_t& object);


#endif // OBJECT_H

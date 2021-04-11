#ifndef CDIO_H
#define CDIO_H

#include "object.h"
#include "defines.h"
#include <cstdlib>
#include <cstdio>

struct load_file
{
    const char* file_name;
};

int load_file_figure(object_t &object, const struct load_file &lf);

#endif // CDIO_H

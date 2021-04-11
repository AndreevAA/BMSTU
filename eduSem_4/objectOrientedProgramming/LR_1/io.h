#ifndef IO_H
#define IO_H

#include "controller.h"

#include "object.h"

#include "controller.h"
#include "config.h"
#include "operations.h"

#include <cstdlib>
#include <cstdio>

struct uploaded_file_st
{
    const char* file_name;
};

int load_file_figure(object_t &object, request &lf);

#endif // IO_H

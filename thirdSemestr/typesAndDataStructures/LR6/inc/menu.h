#ifndef MENU_H
#define MENU_H

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include "../inc/config.h"

#define ERROR_STATUS -1
#define SUCCESS_STATUS 0
#define FILENAME "numbers.txt"

void menu(t_node *balanced_root, FILE *f, t_node *root);

#endif //MENU_H

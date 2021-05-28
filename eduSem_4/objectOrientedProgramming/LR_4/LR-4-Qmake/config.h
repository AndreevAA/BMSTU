#ifndef CONFIG_H
#pragma once

#include <QTextEdit>
#include <QTimer>

enum direction {
    DOWN = -1,
    STAY,
    UP
};

#define CROSSING_FLOOR 1500
#define OPENING_DOORS_TIME 2000
#define WAITING_CABIN_TIME 2000
#define NUM_FLOORS 10

#endif


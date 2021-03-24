#ifndef CANVAS_H
#define CANVAS_H

#include <QGraphicsScene>
#include <QGraphicsView>
#include "config.h"
#include "object.h"
#include "controller.h"

//struct draw
//{
//    QGraphicsView *QGV;
//    int h;
//    int w;
//};

struct line_t
{
    int x_1;
    int y_1;
    int x_2;
    int y_2;
};

int draw_object(const object_t &object, const struct request temp_request);

#endif // CANVAS_H

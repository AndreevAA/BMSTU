#include "canvas_operations.h"
#include "controller.h"
#include <QGraphicsScene>
#include <QGraphicsView>

// Создание поля
static void create_scene(const int width, const int height, request temp_request)
{
    QGraphicsScene *scene = new QGraphicsScene();
    scene->setSceneRect(-width / 2, -height / 2, width - 2, height - 2);
    temp_request.QGV->setScene(scene);
}

// Создать структуру и поместить туда qpen
static QPen create_pen()
{
    QPen penBlack(COLOR);
    return penBlack;
}

// Добавление линии
static void add_line(request temp_request, const line_t line, const QPen pen)
{
    temp_request.QGV->scene()->addLine(line.x_1, line.y_1, line.x_2, line.y_2, pen);
}

// Отрисовка всех линий
void draw_lines(const object_t &object, const struct request temp_request)
{
    QPen pen = create_pen();

    point_t *points = object.points;
    link_t *links = object.links;

    for (int temp_cur = 0; temp_cur < object.number_of_links; temp_cur++)
    {
        line_t line;

        int ind_p1 = links[temp_cur].p_1;
        int ind_p2 = links[temp_cur].p_2;

        line.x_1 = points[ind_p1].x;
        line.y_1 = -points[ind_p1].y;

        line.x_2 = points[ind_p2].x;
        line.y_2 = -points[ind_p2].y;

        add_line(temp_request, line, pen);
    }
}

// Отрисовка объекта
int draw_object(const object_t &object, const struct request temp_request)
{
    int temp_error_status = check_object(object);

    if (temp_error_status != SUCCES_STATUS)
        return temp_error_status;

    create_scene(temp_request.draw_w, temp_request.draw_h, temp_request);
    draw_lines(object, temp_request);

    return SUCCES_STATUS;
}


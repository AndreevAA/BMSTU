#include "canvas.h"
#include "controller.h"
#include <QGraphicsScene>
#include <QGraphicsView>

static void create_scene(const int w, const int h, request temp_request)
{
    QGraphicsScene *scene = new QGraphicsScene();
    scene->setSceneRect(-w / 2, -h / 2, w - 2, h - 2);
    temp_request.QGV->setScene(scene);
    return;
}

// Создать структуру и поместить туда qpen
static QPen create_pen()
{
    QPen penBlack(COLOR);
    return penBlack;
}

static void add_line(request temp_request, const line_t line, const QPen pen)
{
    temp_request.QGV->scene()->addLine(line.x_1, line.y_1, line.x_2, line.y_2, pen);
    return;
}

int draw_object(const object_t &object, const struct request temp_request)
{
    int err = get_object_verification_status(object);
    if (err != SUCCES_STATUS)
        return err;
    create_scene(temp_request.draw_w, temp_request.draw_h, temp_request);
    QPen pen = create_pen();
    point_t *points = object.points;
    link_t *links = object.links;
    for (int i = 0; i < object.number_of_links; i++)
    {
        line_t line;
        int ind_p1 = links[i].p_1;
        int ind_p2 = links[i].p_2;
        line.x_1 = points[ind_p1].x;
        line.y_1 = -points[ind_p1].y;
        line.x_2 = points[ind_p2].x;
        line.y_2 = -points[ind_p2].y;
        add_line(temp_request, line, pen);
    }
    return SUCCES_STATUS;
}

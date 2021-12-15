from py_linq import *

import hull, config


def request_1(hulls):
    return hulls.where(lambda x: x["hull_width"] > config.B_FUEL_TANK). \
        order_by(lambda x: x['hull_fuel_tank']). \
        select(lambda x: {x['hull_id'],
                          x['hull_width'],
                          x['hull_fuel_tank']})


def request_2(hulls):
    return hulls.count(lambda x: x['hull_width'] > config.B_FUEL_TANK)


def request_3(hulls):
    # Минимальная и максимальная ширина
    hull_width = Enumerable(
        [
            {
                hulls.min(lambda element: element['hull_width']),
                hulls.max(lambda element: element['hull_width'])
            }
        ]
    )

    # Минимальная и максимальная объем топливного бака
    hull_fuel_tank = Enumerable(
        [
            {
                hulls.min(lambda element: element['hull_fuel_tank']),
                hulls.max(lambda element: element['hull_fuel_tank'])
            }
        ]
    )

    return Enumerable(hull_width).union(Enumerable(hull_fuel_tank), lambda element: element)


def task_1():
    print("-- Task 1 -- \n")

    print("\nИз чего выбираем: ")
    hulls = Enumerable(hull.create_hulls('data/hull.csv'))

    print("\nПушки отсортированы по размеру топливного бака hull_width >", config.B_FUEL_TANK)
    for elem in request_1(hulls):
        print(elem)

    print("\nКоличество танков с hull_width >", config.B_FUEL_TANK)
    print(request_2(hulls))

    print("\nПушки с максимальными и минимальными шириной и размером топливного бака")
    for elem in request_3(hulls):
        print(elem)

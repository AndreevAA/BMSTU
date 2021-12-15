from py_linq import Enumerable

import config
import hull, json

from peewee import *


class Tasks:
    def __init__(self, operation_db):
        Task_1()
        Task_2(operation_db)
        Task_3(operation_db)


class Task_1:
    hulls = None

    def request_1(self):
        return self.hulls.where(lambda x: x["hull_width"] > config.B_FUEL_TANK). \
            order_by(lambda x: x['hull_fuel_tank']). \
            select(lambda x: {x['hull_id'],
                              x['hull_width'],
                              x['hull_fuel_tank']})

    def request_2(self):
        return self.hulls.count(lambda x: x['hull_width'] > config.B_FUEL_TANK)

    def request_3(self):
        # Минимальная и максимальная ширина
        hull_width = Enumerable(
            [
                {
                    self.hulls.min(lambda element: element['hull_width']),
                    self.hulls.max(lambda element: element['hull_width'])
                }
            ]
        )

        # Минимальная и максимальная объем топливного бака
        hull_fuel_tank = Enumerable(
            [
                {
                    self.hulls.min(lambda element: element['hull_fuel_tank']),
                    self.hulls.max(lambda element: element['hull_fuel_tank'])
                }
            ]
        )

        return Enumerable(hull_width).union(Enumerable(hull_fuel_tank), lambda element: element)

    def request_4(self):
        return self.hulls.group_by(
            key_names=['hull_manufacturer'],
            key=lambda element: element['hull_manufacturer']
        ).select(
            lambda g: {'key': g.key.hull_manufacturer, 'count': g.count()}
        )

    def request_5(self):
        barrel = Enumerable(
            [
                {'barrel_id': 8, 'barrel_name': 'CLOP1'},
                {'barrel_id': 9, 'barrel_name': 'CLOP2'},
                {'barrel_id': 7, 'barrel_name': 'CLOP3'}
            ]
        )

        u_b = self.hulls.join(barrel, lambda o_k: o_k['hull_id'], lambda i_k: i_k['barrel_id'])

        print("Вывод из соединения {")
        for elem in u_b:
            print(elem)
        print("}\n")

        return u_b

    def __init__(self):
        print("-- Task 1 -- \n")

        print("\nИз чего выбираем: ")
        self.hulls = Enumerable(hull.create_hulls('data/hull.csv'))

        print("\nПушки отсортированы по размеру топливного бака hull_width >", config.B_FUEL_TANK)
        for elem in self.request_1():
            print(elem)

        print("\nКоличество танков с hull_width >", config.B_FUEL_TANK)
        print(self.request_2())

        print("\nПушки с максимальными и минимальными шириной и размером топливного бака")
        for elem in self.request_3():
            print(elem)

        print("\nГруппировка по производителю")
        for elem in self.request_4():
            print(elem)

        print("\nСоединение танки и башни")
        for elem in self.request_5():
            print(elem)


class Task_2:
    operation_db = None

    def query_db(self, query, args=(), one=False):
        cur = self.operation_db.connection.cursor()
        cur.execute(query, args)
        r = [dict((cur.description[i][0], value) \
                  for i, value in enumerate(row)) for row in cur.fetchall()]
        cur.connection.close()
        return (r[0] if r else None) if one else r

    def read_table_json(self, count=15, json_str=False):
        cur = self.operation_db.connection.cursor()
        cur.execute("select * from military_vehicles.public.hull")
        rows = cur.fetchmany(count)

        if json_str:
            return json.dumps([dict(ix) for ix in rows])  # CREATE JSON

        array = list()

        for elem in rows:
            tmp = elem

            array.append(hull.Hull(
                int(tmp[0]), tmp[1], tmp[2],
                float(tmp[3]), float(tmp[4]), float(tmp[5]),
                float(tmp[6]), None, None
                # int(tmp['hull_id']), tmp['hull_name'], tmp['hull_manufacturer'],
                # float(tmp['hull_length']), float(tmp['hull_width']), float(tmp['hull_height']),
                # float(tmp['hull_fuel_tank']), int(tmp['barrel_id']), tmp['barrel_name']
            ))

        print(array)

        return array

    def output_json(self, hulls_array):
        for elem in hulls_array:
            print(json.dumps(elem.get()))

    def update_hull(self, hulls_array, hull_id):
        for elem in hulls_array:
            if elem.hull_id == hull_id:
                elem.hull_fuel_tank += 1

        self.output_json(hulls_array)

    def add_hull(self, hulls_array, hull):
        hulls_array.append(hull)
        self.output_json(hulls_array)

    def __init__(self, operation_db):
        self.operation_db = operation_db

        print("\nЧтение из XML/JSON")
        hulls_array = self.read_table_json()

        print("\nДобавление XML/JSON документа (Увеличение топливного бака на 1)")
        self.update_hull(hulls_array, 2)

        print("\nЗапись в XML/JSON документ")
        self.add_hull(hulls_array, hull.Hull(
            12000, "hull_name", "hull_manufacturer",
            "hull_length", "hull_width", "hull_height",
            "hull_fuel_tank", "barrel_id", "barrel_name"
        ))


# Подключаемся к нашей БД.
con = PostgresqlDatabase(
    database='military_vehicles',
    user='postgres',
    password='qwerty',
    host='localhost',
    port=5432
)


class BaseModel(Model):
    class Meta:
        database = con


class Hulls(BaseModel):
    id = IntegerField(column_name='hull_id', primary_key=True)
    # hull_id = IntegerField(column_name='hull_id')
    hull_name = CharField(column_name='hull_name')
    hull_manufacturer = CharField(column_name='hull_manufacturer')
    hull_length = IntegerField(column_name='hull_length')
    hull_width = IntegerField(column_name='hull_width')
    hull_height = IntegerField(column_name='hull_height')
    hull_fuel_tank = IntegerField(column_name='hull_fuel_tank')

    class Meta:
        table_name = 'hull'


class Hull_to_barrel(BaseModel):
    id = IntegerField(column_name='hull_id')
    barrel_id = CharField(column_name='barrel_id')

    class Meta:
        table_name = 'hull_to_barrel'


class Barrel(BaseModel):
    id = IntegerField(column_name='barrel_id')
    barrel_name = CharField(column_name='barrel_name')
    barrel_manufacturer = CharField(column_name='barrel_manufacturer')
    barrel_run = FloatField(column_name='barrel_run')
    barrel_radius = FloatField(column_name='barrel_radius')

    class Meta:
        table_name = 'barrel'


class Task_3:
    operation_db = None

    def query_1(self):
        # 1. Однотабличный запрос на выборку.
        hull_in = Hulls.get(Hulls.id == 2)
        print("Выборка: hull_in.id =", hull_in.id, "hull_in.hull_name =", hull_in.hull_name)

        # Получаем набор записей.
        print("\nНабор записей:")
        query = Hulls.select().where(Hulls.hull_fuel_tank > 18).limit(5).order_by(Hulls.hull_name)

        users_selected = query.dicts().execute()

        for elem in users_selected:
            print(elem)

    def query_2(self):
        # 2. Многотабличный запрос на выборку.
        global con

        # query = Hulls.select(Hulls.id, Hulls.hull_name).where(
        #     Hull_to_barrel.select(Hull_to_barrel.id).where(Hull_to_barrel.barrel_id > 10)
        # )
        #
        # u_b = query.dicts().execute()
        # for elem in u_b:
        #     print(elem)

        query = Hulls.select(Hulls.id, Barrel.barrel_manufacturer).join(Barrel, on=(Hulls.id == Barrel.id)).limit(5)

        u_d = query.dicts().execute()

        for elem in u_d:
            print(elem)

    def print_last_five_hulls(self):
        print("\nПоследние 5 hulls")
        query = Hulls.select().limit(6).order_by(Hulls.id.desc())
        for elem in query.dicts().execute():
            print(elem)
        print()

    def add_hull(self, new_hull_id, new_hull_name, new_hull_manufacturer,
                 new_hull_length, new_hull_width, new_hull_height, new_hull_fuel_tank, new_barrel_id, new_barrel_name):
        global con

        try:
            with con.atomic() as txn:
                Hulls.create(id=new_hull_id, hull_name=new_hull_name, hull_manufacturer=new_hull_manufacturer,
                             hull_length=new_hull_length, hull_width=new_hull_width, hull_height=new_hull_height,
                             hull_fuel_tank=new_hull_fuel_tank, barrel_id=new_barrel_id, barrel_name=new_barrel_name)
                print("Пользователь успешно добавлен!")
        except:
            print("Пользователь уже существует!")
            txn.rollback()

    def update_name(self, id, new_name):
        hull_u = Hulls(id=id)
        hull_u.hull_name = new_name
        hull_u.save()
        print("\nNickname успешно обновлен!\n")

    def del_hull(self, id):
        hull_d = Hulls.get(Hulls.id == id)
        hull_d.delete_instance()
        print("Пользователь успешно удален удален!")

    def query_3(self):

        self.print_last_five_hulls()

        self.add_hull(1020, 'HULL_NAME_ADDED', "hull_manufacturer",
                 12, 234, 234, 23523, None, None)
        self.print_last_five_hulls()

        self.update_name(1020, 'HAHAHAHA')
        self.print_last_five_hulls()

        self.del_hull(1020)
        self.print_last_five_hulls()

    def __init__(self, operation_db):
        self.operation_db = operation_db

        print("\nОднотабличный запрос на выборку")
        self.query_1()

        print("\nМноготабличный запрос на выборку")
        self.query_2()

        print("Три запроса на добавление, изменение и удаление данных в базе данных")
        self.query_3()
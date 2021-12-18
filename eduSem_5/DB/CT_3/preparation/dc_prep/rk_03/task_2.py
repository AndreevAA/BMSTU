import psycopg2 as ps2
from psycopg2 import sql
from py_linq import Enumerable


# -- Найти все отделы, в которых работает более 10 сотрудников
def q_1_1(conn):
    query = sql.SQL("select department "
                    "from ( "
                    "select count(*) as cnt, department "
                    "from employee "
                    "group by department "
                    ") as num_workers "
                    "where cnt > 10;")
    with conn.cursor() as cursor:
        cursor.execute(query)
        result = cursor.fetchall()
    cursor.close()
    return result


def q_1_2(conn):
    with conn.cursor() as cursor:
        cursor.execute("select department from employee;")
        employee = Enumerable(cursor.fetchall())\
            .group_by(key_names=['department'], key=lambda x: x)\
            .select(lambda g: {'department': g.key.department, 'count': g.count()})
        employee = employee.where(lambda x: x['count'] > 10)\
            .select(lambda x: x['department']).to_list()
    return employee


# -- Найти сотрудников, которые не выходят с рабочего места в течение всего рабочего дня
def q_2_1(conn):
    query = sql.SQL("select in_and_out_cnt.id_employee, E.full_name "
                    "from ( "
                    "select id_employee, count(*) as cnt "
                    "from reg "
                    "where date = '2018-12-14' "
                    "group by id_employee "
                    ") as in_and_out_cnt join employee E on in_and_out_cnt.id_employee = E.id_employee "
                    "where cnt <= 2;")
    with conn.cursor() as cursor:
        cursor.execute(query)
        result = cursor.fetchall()
    cursor.close()
    return result


def q_2_2(conn):
    with conn.cursor() as cursor:
        cursor.execute("select department from employee;")
        employee = cursor.fetchall()
        cursor.execute("select id_employee from reg;")
        reg = Enumerable(cursor.fetchall())\
            .group_by(key_names=['id_employee'], key=lambda x: x)\
            .select(lambda g: {'id_employee': g.key.id_employee, 'count': g.count()})
        reg = reg.where(lambda x: x['count'] <= 2)\
            .select(lambda k: k['id_employee'])
        reg = reg.join(Enumerable(employee),
                       lambda r: r,
                       lambda e: e,
                       lambda k: k)\
            .select(lambda k: {'id_employee': k.id_employee, 'full_name': k.full_name}).to_list()
    return reg


# -- Найти все отделы, в которых есть сотрудники, опоздавшие в определенную дату. Дату передавать с клавиатуры
def q_3_1(conn):
    date = input("Введите дату:")
    query = sql.SQL("select distinct E.department "
                    " from ( "
                    "select distinct id_employee, min(time) over(partition by id_employee) as entry_time "
                    "from reg "
                    "where date = %s "
                    ") as entry join employee E on entry.id_employee = E.id_employee "
                    "where entry_time > '9:00';")
    with conn.cursor() as cursor:
        cursor.execute(query, [date])
        result = cursor.fetchall()
    cursor.close()
    return result


def main():
    conn = ps2.connect(dbname='rk3', user='postgres', host='localhost', port=5433)
    print(q_1_1(conn))
    print(q_1_2(conn))

    print(q_2_1(conn))
    print(q_2_2(conn))

    print(q_3_1(conn))
    conn.close()


if __name__ == '__main__':
    main()

import psycopg2
from psycopg2 import sql
from py_linq import Enumerable

# connection to db
db_connection = psycopg2.connect(dbname='rk3', user='postgres',
                   password='qwerty', host='localhost',
                   port=5432)


def task_1_not_lambda():
    global db_connection

    query = sql.SQL("select dep from ( "
                    "select count(*) as cnt_working_hours, dep "
                    "from rk3.public.worker group by dep ) as num_workers where cnt_working_hours > 10;")
    
    with db_connection.cursor() as cursor:
        cursor.execute(query)
        result = cursor.fetchall()
        
    cursor.close()
    return result


def task_1_lambda():
    global db_connection

    with db_connection.cursor() as cursor:
        cursor.execute("select dep from worker;")

        workers = Enumerable(cursor.fetchall()).\
            group_by(key_names=['dep'], key=lambda x: x).select(lambda g: {'dep': g.key.dep, 'count': g.count()}).\
            where(lambda x: x['count'] > 10).select(lambda x: x['department']).to_list()

    return workers


def task_2_not_lambda():
    global db_connection

    # Работник совершил две операции Вход и Выход - значит, он не выходил с рабочего места.
    query = sql.SQL("select schedule_io_cnt.worker_id, W.snt "
                    "from (select worker_id, count(*) as schedule_io_cnt_all_day from schedule_io "
                    "where date = '2021-12-18' group by worker_id ) "
                    "as schedule_io_cnt join worker W on schedule_io_cnt.worker_id = W.worker_id "
                    "where schedule_io_cnt_all_day = 2;")

    with db_connection.cursor() as cursor:
        cursor.execute(query)
        result = cursor.fetchall()
    cursor.close()

    return result


def task_2_lambda():
    global db_connection

    # Работник совершил две операции Вход и Выход - значит, он не выходил с рабочего места.
    with db_connection.cursor() as cursor:
        cursor.execute("select dep from worker;")

        workers = cursor.fetchall()
        cursor.execute("select worker_id from schedule_io;")

        schedule = Enumerable(cursor.fetchall())\
            .group_by(key_names=['id_worker'], key=lambda x: x)\
            .select(lambda w_c: {'id_worker': w_c.key.id_worker, 'count': w_c.count()})\
            .where(lambda c_search: c_search['count'] <= 2)\
            .select(lambda w_id: w_id['id_worker'])\
            .join(Enumerable(workers), lambda r: r, lambda e: e, lambda k: k)\
            .select(lambda worker: {'id_worker': worker.id_worker, 'snt': worker.snt}).to_list()

    return schedule


def task_3_not_lambda():
    global db_connection

    check_late_w_date = input()

    query = sql.SQL("select distinct E.dep  from ( "
                    "select distinct worker_id, min(time) "
                    "over(partition by worker_id) as in_time "
                    "from schedule_io "
                    "where date = %s "
                    ") as entry join worker E on entry.worker_id = E.worker_id "
                    "where in_time > '8:30';")

    with db_connection.cursor() as cursor:
        cursor.execute(query, [check_late_w_date])
        result = cursor.fetchall()

    cursor.close()
    return result


if __name__ == '__main__':

    print("Отделы с более 10 людьми (прямой):", task_1_not_lambda())
    print("Отделы с более 10 людьми (лямбда):", task_1_lambda())

    print("Найти сотрудников, которые не выходят с рабочего места в течение "
          "всего рабочего дня (прямой):", task_2_not_lambda())
    print("Найти сотрудников, которые не выходят с рабочего места в течение "
          "всего рабочего дня (лямбда):", task_2_lambda())

    print("Найти все отделы, в которых есть сотрудники, опоздавшие в определенную дату. Дату передавать с "
          "клавиатуры (прямой):", task_3_not_lambda())

    db_connection.close()

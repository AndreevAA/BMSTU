import os
import matplotlib.pyplot as plt
import time

cached_x = []
x = []

def query():
    start = time.time()
    os.system(
        """curl -w "@curl-format.txt" -X POST -H "Content-Type: application/json" -d '{"period":"century", "step":"week", "low":4.0, "high":7.0}' 'localhost:5000/query/reviews/stats/'""")
    end = time.time()
    x.append(end - start)


def cached_query():
    start = time.time()
    os.system(
        """curl -w "@curl-format.txt"  -o /dev/null -X POST -H "Content-Type: application/json" -d '{"period": "century", "step": "week", "low": 4.0, "high": 7.0}' 'localhost:5000/query/reviews/stats?cahced=1'""")
    end = time.time()
    cached_x.append(end - start)


def ins_query():
    start = time.time()
    os.system(
        """curl -w "@curl-format.txt" -X POST -H "Content-Type: application/json" -d '[{"shop_id":"a3d8b2c4-f6e0-45cb-a594-35ed34499cc6", "good_id":"b1779419-3e43-4c8e-aa6c-dd1a3a651570", "employee_id":"eb33b89b-cc28-4c1f-b1f7-adeb5cf03f15", "reviewer_id" :"0cd363b2-3477-4140-a524-aa6334f2d2d4", "good_rating":5.0, "shop_rating":6.0, "employee_rating":7.3}]' 'localhost:5000/query/reviews/insert/'""")
    end = time.time()
    cached_x.append(end - start)


def del_query():
    start = time.time()
    os.system(
        """curl -w "@curl-format.txt" -X POST -H "Content-Type: application/json" -d '[{"reviewer_id" :"4702af8c-d9a8-428c-b7ab-6f0aff9cd400"}]' 'localhost:5000/query/reviews/delete/'""")
    end = time.time()
    cached_x.append(end - start)


def process():
    global cached_x, x
    cached_x = []
    x = []
    for i in range(60):
        cached_query()
        query()
        time.sleep(2)

    plt.plot(range(len(x)), x, label='Requests')
    plt.plot(range(len(cached_x)), cached_x, label='Cached requests')
    plt.legend()
    plt.savefig('graph_reg.png')

    plt.clf()


def process_ins():
    global cached_x, x
    cached_x = []
    x = []
    for i in range(60):
        cached_query()
        query()
        time.sleep(2)

        if i % 10 == 0:
            ins_query()

    plt.plot(range(len(x)), x, label='Requests')
    plt.plot(range(len(cached_x)), cached_x, label='Cached requests')
    plt.legend()
    plt.savefig('graph_ins.png')

    plt.clf()

def process_delete():
    global cached_x, x
    cached_x = []
    x = []
    for i in range(60):
        cached_query()
        query()
        time.sleep(2)

        if i % 10 == 0:
            del_query()

    plt.plot(range(len(x)), x, label='Requests')
    plt.plot(range(len(cached_x)), cached_x, label='Cached requests')
    plt.legend()
    plt.savefig('graph_del.png')

    plt.clf()

# Точка входа
if __name__ == '__main__':
    process()
    process_ins()
    process_delete()

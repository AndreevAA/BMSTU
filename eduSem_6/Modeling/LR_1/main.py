from math import ceil, sqrt


# Вывод результата разной природы в формате строки
def output(s):
    if type(s) == float:
        if s > 1000000:
            return '{:.8e}'.format(s)
        return '{:.8f}'.format(s)
    elif type(s) == int:
        return str(s)
    else:
        return s


def func(x, u):
    return x ** 2 + u ** 2


# Явный Эйлера
def euler(n, h, x, y):
    y_out = []
    for i in range(n):
        try:
            y += h * func(x, y)
            y_out.append(y)
            x += h
        except OverflowError:
            y_out.append('overflow')
            for _ in range(i, n - 1):
                y_out.append('-----')
            break
    return y_out


def runge_kutt2(n, h, x, y):
    y_out = []
    for _ in range(n):
        y += h * func(x + h / 2, y + h / 2 * func(x, y))
        y_out.append(y)
        x += h
    return y_out


def picar(n, h, x, y0):
    def f1(a):
        return a ** 3 / 3

    def f2(a):
        return f1(a) + a ** 7 / 63

    def f3(a):
        return f2(a) + (a ** 11) * (2 / 2079) + (a ** 15) / 59535

    def f4(a, f3):
        return f3 + (a ** 15) * (2 / 93555) + (a ** 19) * (2 / 3393495) + (a ** 19) * (2 / 2488563) + \
               (a ** 23) * (2 / 86266215) + (a ** 23) * (1 / 99411543) + (a ** 27) * (2 / 3341878155) + (a ** 31) * (
                           1 / 109876902975)

    y_out = [[y0, y0, y0, y0]]
    for i in range(n - 1):
        x += h
        y_f1 = f1(x)
        y_f2 = f2(x)
        y_f3 = f3(x)
        y_out.append([y_f1, y_f2, y_f3, f4(x, y_f3)])
    return y_out


def main():
    h = 10 ** -7  # 10**-5 это хороший шаг для численных методов

    x = 0
    y0 = 0
    end = 2

    n = ceil(abs(end - x) / h) + 1  # количество повторений

    x_arr = [x + h * i for i in range(n)]
    y1 = euler(n, h, x, y0)
    y2 = runge_kutt2(n, h, x, y0)
    y3 = picar(n, h, x, y0)

    print("|    x    |   Пикар 1     |    Пикар 2    |   Пикар 3     |    Пикар 4    |     Явный     |    Рунге2    |")
    print("-" * 107)
    output_step = int(n / 100)  # выводим только 100 значений в таблице
    for i in range(0, n, output_step):
        print("|{:^9.5f}|{:^15.8f}|{:^15.8f}|{:^15.8f}|{:^15.8f}|{:^15s}|{:^15s}|".format(x_arr[i], y3[i][0], y3[i][1],
                                                                                          y3[i][2], y3[i][3],
                                                                                          output(y1[i]), output(y2[i])))

if __name__ == '__main__':
    main()


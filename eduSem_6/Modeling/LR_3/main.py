import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import math
from scipy import integrate
from scipy.interpolate import interp1d

plt.rcParams['figure.figsize'] = 12, 8
SAVE_DIR = './'


def plot_helper(x, y, xlabel, ylabel, title=False, pic='pic.png', save=True):
    plt.scatter(x, y, s=8, c='g')
    plt.plot(x, y, '-', c='r')
    plt.grid()
    plt.ylabel(ylabel)
    plt.xlabel(xlabel)
    if title: plt.title(title)
    if save: plt.savefig(SAVE_DIR + pic, bbox_inches='tight')
    fig = plt.figure()


n_p = 1.4
l = 0.2
T_0 = 300
sigma = 5.668e-12
F_0 = 100
alpha = 0.05

data1 = pd.read_csv('k_T.csv')
data2 = pd.read_csv('lambda_T.csv')
k_T = interp1d(data1['T'], data1['k'], fill_value="extrapolate")
lambda_T = interp1d(data2['T'], data2['lambda'], fill_value="extrapolate")

f_helper = 4 * n_p ** 2 * sigma
T_04 = T_0 ** 4


def T(n):
    if (n * 2) % 2 == 1:
        n = int(n - 1 / 2)
        return (T_list[n] + T_list[n + 1]) / 2
    return T_list[int(n)]


def chi_plus_half(n):
    return (k(n) + k(n + 1)) / 2


def chi_minus_half(n):
    return (k(n) + k(n - 1)) / 2


def k(n):
    return lambda_T(T(n))


def f_inner(n):
    return k(n) * (T(n) ** 4 - T_04)


def f(n):
    return -f_helper * f_inner(n)


def A(n): return chi_minus_half(n) / h


def C(n): return chi_plus_half(n) / h


def B(n): return A(n) + C(n)


def D(n): return f(n) * h


def trapezoidal_intergrate(func, a, b, step):
    S = (func(a) + func(b)) / 2
    for x in range(a + step, b, step):
        S += func(x)
    return S * step


def boundary_condition():
    K0 = chi_plus_half(0)
    M0 = -K0
    P0 = h * F_0 + h ** 2 / 4 * (f(1 / 2) + f(0))
    KN = -chi_minus_half(N)
    MN = alpha * h - KN
    PN = alpha * h * T_0 + h ** 2 / 4 * (f(N - 1 / 2) + f(N))
    return K0, M0, P0, KN, MN, PN


def err_temperature(t_old, t_new):
    return max([abs(1 - t_old[i] / t_new[i]) for i in range(len(t_old))])


def err_energy_balance(t_new):
    f1 = F_0 - alpha * (t_new[N] - T_0)
    f2 = f_helper * trapezoidal_intergrate(f_inner, 0, N, 1) * h
    return abs(1 - f2 / f1)


def thomas_algorithm():
    K0, M0, P0, KN, MN, PN = boundary_condition()

    # forward
    xi = [None, - M0 / K0]
    eta = [None, P0 / K0]

    for i in range(1, N):
        denominator = (B(i) - A(i) * xi[i])
        x = C(i) / denominator
        e = (D(i) + A(i) * eta[i]) / denominator
        xi.append(x)
        eta.append(e)

    # backward
    y = [(PN - KN * eta[-1]) / (MN + KN * xi[-1])]

    for i in range(N - 1, -1, -1):
        yi = xi[i + 1] * y[0] + eta[i + 1]
        y.insert(0, yi)

    return y


def fixed_point_iteration(esp1, esp2, max_loop=20):
    global T_list
    err1 = err2 = 1

    for i in range(max_loop):
        if err1 <= esp1 and err2 <= esp2:
            break
        t = thomas_algorithm()
        err1 = err_temperature(T_list, t)
        T_list = t
        err2 = err_energy_balance(T_list)
        print(i, err1, err2)


h = 0.01
N = int(l // h)
esp1 = 0.01
esp2 = 0.01

x = [i for i in np.arange(0, l + h, h)]

# F = 100, alpha = 0.05
T_list = [T_0] * (N + 1)
F_0 = 100
alpha = 0.05

fixed_point_iteration(esp1, esp2)
plot_helper(x, T_list, 'x, cm', 'T, K', pic='F0=100,a=0.05.png')

# F = -10
T_list = [T_0] * (N + 1)
F_0 = -10

fixed_point_iteration(esp1, esp2)
plot_helper(x, T_list, 'x, cm', 'T, K', 'F0 = -10', pic='F0=-10,a=0.05.png')

# alpha x3
T_list = [T_0] * (N + 1)
F_0 = 100
alpha = 0.15

fixed_point_iteration(esp1, esp2)
plot_helper(x, T_list, 'x, cm', 'T, K', 'alpha = 0.15 (x3)', pic='F0=100,a=0.15.png')

# F = 0
T_list = [T_0] * (N + 1)
F_0 = 0
alpha = 0.05

fixed_point_iteration(esp1, esp2)
plot_helper(x, T_list, 'x, cm', 'T, K', 'F0 = 0', pic='F0=0.png')
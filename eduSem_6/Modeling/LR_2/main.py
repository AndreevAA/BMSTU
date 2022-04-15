import numpy
import matplotlib.pyplot as plt
from decimal import Decimal
from scipy import integrate
from scipy.interpolate import InterpolatedUnivariateSpline

import matplotlib.style
import matplotlib as mpl

mpl.style.use('grayscale')

masI = [0.5, 1, 5, 10, 50, 200, 400, 800, 1200]
masT0 = [6400, 6790, 7150, 7270, 8010, 9185, 10010, 11140, 12010]
masm = [0.4, 0.55, 1.7, 3, 11, 32, 40, 41, 39]

masT = [4000, 5000, 6000, 7000, 8000, 9000, 10000, 11000, 12000, 13000, 14000]
masSigm = [0.031, 0.27, 2.05, 6.06, 12.0, 19.9, 29.6, 41.1, 54.1, 67.7, 81.5]


def interpolate(x, masX, masY):
    order = 1
    s = InterpolatedUnivariateSpline(masX, masY, k=order)
    return float(s(x))


def T(z):
    return (Tw - T0) * z ** m + T0


def sigma(T):
    return interpolate(T, masT, masSigm)


def Rp(I):
    global m
    global T0
    m = interpolate(I, masI, masm)
    T0 = interpolate(I, masI, masT0)

    func = lambda z: sigma(T(z)) * z
    integral = integrate.quad(func, 0, 1)
    Rp = le / (2 * numpy.pi * R ** 2 * integral[0])

    return Rp


def f(xn, yn, zn):
    return -((Rk + m_Rp_global) * yn - zn) / Lk


##    return zn/Lk

def phi(xn, yn, zn):
    return -yn / Ck


def Runge2(xn, yn, zn, hn, m_Rp):
    global m_Rp_global
    m_Rp_global = m_Rp

    alpha = 0.5
    yn_1 = yn + hn * ((1 - alpha) * f(xn, yn, zn) + alpha \
                      * f(xn + hn / (2 * alpha),
                          yn + hn / (2 * alpha) * f(xn, yn, zn),
                          zn + hn / (2 * alpha) * phi(xn, yn, zn)))

    zn_1 = zn + hn * ((1 - alpha) * phi(xn, yn, zn) + alpha \
                      * phi(xn + hn / (2 * alpha),
                            yn + hn / (2 * alpha) * f(xn, yn, zn),
                            zn + hn / (2 * alpha) * phi(xn, yn, zn)))

    return yn_1, zn_1


def Runge4(xn, yn, zn, hn, m_Rp):
    global m_Rp_global
    m_Rp_global = m_Rp

    k1 = hn * f(xn, yn, zn)
    q1 = hn * phi(xn, yn, zn)

    k2 = hn * f(xn + hn / 2, yn + k1 / 2, zn + q1 / 2)
    q2 = hn * phi(xn + hn / 2, yn + k1 / 2, zn + q1 / 2)

    k3 = hn * f(xn + hn / 2, yn + k2 / 2, zn + q2 / 2)
    q3 = hn * phi(xn + hn / 2, yn + k2 / 2, zn + q2 / 2)

    k4 = hn * f(xn + hn, yn + k3, zn + q3)
    q4 = hn * phi(xn + hn, yn + k3, zn + q3)

    yn_1 = yn + (k1 + 2 * k2 + 2 * k3 + k4) / 6
    zn_1 = zn + (q1 + 2 * q2 + 2 * q3 + q4) / 6

    return yn_1, zn_1


def plot_data(pltMasT, mas1, mas2, xlabel, ylabel, name1, name2):
    plt.plot(pltMasT, mas1, 'r')
    plt.plot(pltMasT, mas2, 'b')
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.legend((name1, name2))
    plt.grid(True)
    plt.show()


print("1.Автоматичекий ввод констант\n2.Ручной ввод")
R = 0
Tw = 0
Ck = 0
Lk = 0
Rk = 0
Uc0 = 0
I0 = 0
le = 0

while True:
    x = input('>>')
    if x == '1':
        R = 0.35
        Tw = 2000.0
        Ck = 150e-6
        Lk = 60e-6
        Rk = 1  # от 0.5 до 200
        Uc0 = 1500.0
        I0 = 0.5  # от 0.5 до 3
        le = 12.0
        break
    elif x == '2':
        R = float(input('Радиус (см): '))
        Tw = float(input('Температура (К): '))
        Ck = float(input('Ёмкость конденсатора (Ф): '))
        Lk = float(input('Индуктивность катушки (Гн): '))
        Rk = float(input('Сопротивление резистора(Ом): '))
        Uc0 = float(input('Напряжение при t=0 cек (В): '))
        I0 = float(input('Сила тока при t=0 сек (А): '))
        le = float(input('Расстояние между пластинами (см): '))
        break
    else:
        print('Неправильный ввод')

I4 = I0
Uc4 = Uc0
I2 = I0
Uc2 = Uc0

T0 = 0.0
m = 0.0

pltMasT = []
pltMasI4 = []
pltMasU4 = []
pltMasRp4 = []
pltMasI2 = []
pltMasU2 = []
pltMasRp2 = []

print("1.Автоматичекий ввод шага\n2.Ручной ввод")
x = int(input('>>'))
h = 0
print(x)
while True:
    if x == 1:
        h = 1e-6
        break
    elif x == 2:
        h = float(input("Шаг: "))
        break
    else:
        print('Неправильный ввод')

print("here")

for t in numpy.arange(0, 0.0003, h):
    try:
        m_Rp4 = Rp(I4)
        m_Rp2 = Rp(I2)
        if t > h:
            pltMasT.append(t)
            pltMasI4.append(I4)
            pltMasU4.append(Uc4)
            pltMasRp4.append(m_Rp4)
            pltMasI2.append(I2)
            pltMasU2.append(Uc2)
            pltMasRp2.append(m_Rp2)

        I4, Uc4 = Runge4(t, I4, Uc4, h, m_Rp4)
        I2, Uc2 = Runge2(t, I2, Uc2, h, m_Rp2)

    except:
        break

plot_data(pltMasT, pltMasI4, pltMasI2, 't, сек', 'I, А', '4-й порядок', '2-й порядок')
plot_data(pltMasT, pltMasU4, pltMasU2, 't, сек', 'Uc, В', '4-й порядок', '2-й порядок')
plot_data(pltMasT, pltMasRp4, pltMasRp2, 't, сек', 'Rp, Ом', '4-й порядок', '2-й порядок')

for i in range(len(pltMasI4)):
    pltMasI4[i] *= pltMasRp4[i]
    pltMasI2[i] *= pltMasRp2[i]

plot_data(pltMasT, pltMasI4, pltMasI2, 't, сек', 'Up, В', '4-й порядок', '2-й порядок')

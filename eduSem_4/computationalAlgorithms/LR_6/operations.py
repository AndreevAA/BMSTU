def get_table(x_beg, step, amount):
    x_tbl = [x_beg + step*i for i in range(amount)]
    y_tbl = [0.571, 0.889, 1.091, 1.231, 1.333, 1.412]
    return x_tbl, y_tbl

def left_side_diff_1(y, h):
    return [None if not i
            else ((y[i] - y[i - 1]) / h)
            for i in range(len(y))]

def left_side_diff(y, h):
    lsd = [0]*len(y)
    for i in range(len(y)):
        if not i:
            lsd[i] = None
        else:
            lsd[i] = round(((y[i] - y[i - 1]) / h), 5)
    return lsd

def right_side_diff(y, h):
    rsd = [0]*len(y)
    for i in range(len(y)):
        if i == len(y) - 1:
            rsd[i] = None
        else:
            rsd[i] = round(((y[i + 1] - y[i]) / h), 5)
    return rsd

def second_diff(y, h):
    sd = [0]*len(y)
    for i in range(len(y)):
        if not i or i == len(y) - 1:
            sd[i] = None
        else:
            sd[i] = round(((y[i - 1] - 2*y[i]+y[i+1]) / h**2),5)
    return sd 

def center_diff(y, h):
    cd = [0]*len(y)
    for i in range(len(y)):
        if not i or i == len(y) - 1:
            cd[i] = None
        else:
            cd[i] = round(((y[i + 1] - y[i - 1]) / (2*h)), 5)
    return cd 

def Runge_center(y,x,h):
    rc = [0]*len(y)

    for i in range(len(y)):
        if i > len(y) - 2:
            rc[i] = None
        else:
            eta_ksi_diff = (1 / y[i + 1] - 1 / y[i]) / (1 / x[i + 1] - 1 / x[i])
            rc[i] = round((eta_ksi_diff * y[i] * y[i] / x[i] / x[i]), 5)
    return rc

def Runge_left_side(y, h):
    rls = [0]*len(y)
    n = len(y)
    p = 1

    yh = left_side_diff_1(y, h)
    y2h = [0 if i < 2 else (y[i] - y[i-2]) / (2*h) for i in range(0, n)]

    for i in range(0,n):
        if  i < 2:
            rls[i] = None
        else:
            rls[i] = round((yh[i] + (yh[i] - y2h[i]) / (2**p - 1)),5)
    return rls
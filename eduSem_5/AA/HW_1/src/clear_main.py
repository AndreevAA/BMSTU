x, y, p, n = list(map(float, input("X: ").split())), \
                 list(map(float, input("X: ").split())), \
                 list(map(float, input("X: ").split())), \
                 int(input("Введите степень аппроксимации: "))
    N = len(x)
    A = zeros((n + 1, n + 1))
    B = zeros((n + 1, 1))
    for j in range(n + 1):
        for k in range(n + 1):
            for i in range(N):
                A[j, k] += f(x[i], k + j) * p[i]
        for l in range(N):
            B[j] += y[l] * f(x[l], j) * p[l]
    det = linalg.det(A)
    nparray_to_list(A)
    nparray_to_list(B)
    print("Определитель:", det)
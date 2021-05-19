def result(func, n, m, tao):
    return simpson(lambda x: gauss(converts(func, x), \
		LIMITS[1][0], LIMITS[1][1], m), LIMITS[0][0], LIMITS[0][1], n)

def getInputData():
	N = int(input("N: "));
	M = int(input("M: "));
	T = float(input("τ: "));

	return N, M, T;

def outResult(N, M, T):
	print("Результат: ", result(func(T), N, M, T));
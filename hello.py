def func(a, b):
    a = a + 1
    b = int(a * 15)
    result = []
    for i in range(b):
        result.append(i**2)
    return result

print(func(3, 10))

print('Hello, Hanna!')
def f(n):
    if n >= 3:
        return f(n-1) + f(n-2) + f(n-3)
    else: return n

print(f(2)) # 2
print(f(6)) # 20
print(f(9)) # 125

def f_iter(n):
    a, b, c = 0, 1, 2
    for count in range(n):
        a, b, c = b, c, b + a + c
    return a

print(f_iter(2)) # 2
print(f_iter(6)) # 20
print(f_iter(9)) # 125

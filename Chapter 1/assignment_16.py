def power_iter(x, n):
    if n % 2:
        return x * power_iter(x, n - 1)
    
    while n > 1:
        n = n / 2
        x *= x
    return x


print(power_iter(2, 32)) # 4294967296
print(power_iter(6, 9))  # 10077696
print(power_iter(8, 5))  # 32768
# function witch return sum of squares
def sum_of_biggest_squares(a, b, c):
    def square(x): return x * x

    a, b, c = abs(a), abs(b), abs(c)

    if a > b and b > c:
        if b > c: return square(a) + square(b)
        else:     return square(a) + square(c)
    else:
        if a > c: return square(a) + square(b)
        else:     return square(b) + square(c)

print(sum_of_biggest_squares(2, 4, 6)) # 52
print(sum_of_biggest_squares(4, -7, 3)) # 65
print(sum_of_biggest_squares(7, 3, 0)) # 58

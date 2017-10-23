def pascal_square(x, y):
    if x == 1 or x == y: 
        return 1
    else:
        return (pascal_square(x-1, y-1) + pascal_square(x, y-1))

print(pascal_square(2, 4)) # 3
print(pascal_square(3, 5)) # 6
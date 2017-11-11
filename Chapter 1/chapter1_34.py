def f(g): 
    return g(2)

print(f(lambda x: x * x)) # 4

# It can't work in python, but in LISP it will return 2 because is interpreted as f(f(2))
print(f(f)) # error
# Search the square root of Newton's method
def sqrt_iter(n, guess):
    improve_guess = improve(n, guess)

    if not enough(improve_guess, guess): 
        return sqrt_iter(n, improve_guess)
    else: 
        return round(guess, 2)

def improve(n, guess):
    average = lambda x, y: (x + y) / 2
    return average(guess, (n / guess))

def enough(new, old):
    return abs(new - old) < 0.001

print('sqrt 9 ±= %f', sqrt_iter(9, 1)) # 3
print('sqrt 3 ±= %f', sqrt_iter(3, 1)) # 1.73
print('sqrt 2 ±= %f', sqrt_iter(2, 1)) # 1.41
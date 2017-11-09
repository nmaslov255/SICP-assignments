def gcd(a, b): 
    remainder = a % b
    
    if remainder is 0:
        return b
    return gcd(b, remainder)

print(gcd(49, 343)) # 49
print(gcd(206, 40)) # 2
print(gcd(27, 6))   # 3

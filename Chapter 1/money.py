def get_changes(amount, coins):
    def count_change(amount, n):
        if amount == 0:
            return 1
        elif amount < 0 or n == -1: 
            return 0
        else:
            return count_change(amount, n - 1) + count_change(amount - coins[n], n)

    return count_change(amount, len(coins) - 1)

print(get_changes(25, [5, 10, 25])) # 4
print(get_changes(100, [1, 5, 10, 25, 50])) # 292
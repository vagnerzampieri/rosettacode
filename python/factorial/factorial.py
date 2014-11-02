def factorial(value):
    fact = 1
    array = range(1, value + 1)
    array.reverse()
    for number in array:
        fact *= number
    return fact

# print factorial(3)
# print factorial(2)
# print factorial(10)

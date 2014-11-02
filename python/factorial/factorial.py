from operator import mul
from functools import reduce


def factorial(value):
    return reduce(mul, range(1, value+1), 1)

# print factorial(3)
# print factorial(2)
# print factorial(10)

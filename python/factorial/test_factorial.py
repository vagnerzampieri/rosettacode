import unittest
from factorial import factorial


class FactorialTestCase(unittest.TestCase):

    def test_factorial_2_equal_2(self):
        self.assertEqual(factorial(2), 2)

    def test_factorial_3_equal_6(self):
        self.assertEqual(factorial(3), 6)

    def test_factorial_10_equal_3628800(self):
        self.assertEqual(factorial(10), 3628800)

if __name__ == '__main__':
    unittest.main()

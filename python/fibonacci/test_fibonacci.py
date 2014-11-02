import unittest
from fibonacci import fibonacci


class FibonacciTestCase(unittest.TestCase):

    def test_fibonacci_for_5(self):
        self.assertEqual(fibonacci(5), [0, 1, 1, 2, 3])

    def test_fibonacci_for_10(self):
        self.assertEqual(fibonacci(10), [0, 1, 1, 2, 3, 5, 8, 13, 21, 34])

if __name__ == '__main__':
    unittest.main()

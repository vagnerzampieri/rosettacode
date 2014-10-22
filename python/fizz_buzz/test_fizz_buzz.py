import unittest
from fizz_buzz import *

class FizzBuzzTestCase(unittest.TestCase):
    
    def test_if_it_is_divisible_by_3(self):
        self.assertEqual(fizz_buzz(9), 'fizz')
    
    def test_if_it_is_divisible_by_5(self):
        self.assertEqual(fizz_buzz(5), 'buzz')
    
    def test_if_it_is_divisible_by_3_and_5(self):
        self.assertEqual(fizz_buzz(15), 'fizzbuzz')
    
    def test_if_it_is_not_divisible_by_3_or_5_he_returns(self):
        self.assertEqual(fizz_buzz(7), 7)

if __name__ == '__main__':
    unittest.main()

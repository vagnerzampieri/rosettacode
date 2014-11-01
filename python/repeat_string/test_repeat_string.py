import unittest
from repeat_string import *


class RepeatStringTestCase(unittest.TestCase):

    def test_repeat_string_ha_5_times_per_default(self):
        self.assertEqual(repeat_string("ha"), "hahahahaha")

    def test_repeat_string_he_6_times_with_parameter(self):
        self.assertEqual(repeat_string("he", 6), "hehehehehehe")

if __name__ == '__main__':
    unittest.main()

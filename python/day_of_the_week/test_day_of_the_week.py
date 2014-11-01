import unittest
from day_of_the_week import day_of_the_week


class DayOfTheWeekTestCase(unittest.TestCase):

    def test_years_on_sunday_december_25th(self):
        years = [2011, 2016, 2022, 2033, 2039, 2044,
                 2050, 2061, 2067, 2072, 2078, 2089,
                 2095, 2101, 2107, 2112, 2118]
        self.assertEqual(day_of_the_week(), years)

if __name__ == '__main__':
    unittest.main()

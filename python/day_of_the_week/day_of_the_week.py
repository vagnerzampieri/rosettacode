from datetime import date


def day_of_the_week():
    years = []
    for year in range(2008, 2122):
        if is_sunday(year):
            years.append(year)
    return years


def is_sunday(year):
    return date(year, 12, 25).strftime("%A") == "Sunday"

# print day_of_the_week()

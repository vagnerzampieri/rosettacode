from datetime import date


def day_of_the_week():
    years = []
    for year in range(2008, 2121):
        if date(year, 12, 25).strftime("%A") == "Sunday":
            years.append(year)
    return years

# print day_of_the_week()

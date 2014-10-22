def fizz_buzz(value):
    word = ''
    if value % 3 == 0:
        word += 'fizz'
    if value % 5 == 0:
        word += 'buzz'
    return word or value

#for i in range(0, 100):
#    print fizz_buzz(i)

def fibonacci(value):
    array = []

    for i in range(value):
        length = len(array)

        if i == 0:
            array.append(0)
        elif i == 1:
            array.append(1)
        else:
            last = array[length - 1]
            penultimate = array[length - 2]
            array.append(last + penultimate)

    return array

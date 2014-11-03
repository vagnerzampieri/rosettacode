def fibonacci(value):
    array = []

    for i in range(value):
        length = len(array)

        if i <= 1:
            array = [0, 1]
        else:
            last = array[length - 1]
            penultimate = array[length - 2]
            array.append(last + penultimate)

    return array

var fizzBuzz = {
    getValue: function(number) {
        var str = '';
        if (number % 3 == 0)
            str += 'fizz';
        if (number % 5 == 0)
            str += 'buzz';
        return str == '' ? String(number) : str;
    },
};

module.exports = fizzBuzz;

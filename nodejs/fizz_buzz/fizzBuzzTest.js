var assert   = require('assert');
var fizzBuzz = require('./fizzBuzz.js');

describe('FizzBuzz', function() {
    it('if it is divisible by 3', function() {
        assert.equal(fizzBuzz.getValue(9), 'fizz');
    });

    it('if it is divisible by 5', function() {
        assert.equal(fizzBuzz.getValue(25), 'buzz');
    });

    it('if it is divisible by 3 and 5', function() {
        assert.equal(fizzBuzz.getValue(15), 'fizzbuzz');
    });

    it('if it is divisible by 3 or 5, he returns', function() {
        assert.equal(fizzBuzz.getValue(7), '7');
    });
});

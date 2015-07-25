var assert           = require('assert');
var countOccurrences = require('./countOccurrences.js');

describe('Count Occurences of a substring', function() {
    context('must return the amount of appearances', function() {
        it('return 3 times', function() {
            assert.equal(countOccurrences.arraySize('the three truths', 'th'), 3);
        });
        
        it('return 2 times', function() {
            assert.equal(countOccurrences.arraySize('ababababab', 'abab'), 2);
        });
    });

    it('returns even though camel case', function() {
        assert.equal(countOccurrences.arraySize('ababababAB', 'abaB'), 2);
    	
    });
});

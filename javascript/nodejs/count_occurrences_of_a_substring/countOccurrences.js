var countOccurrences = {
    arraySize: function(str, search) {
	var regexp = RegExp(search, 'gi')
    	return str.match(regexp).length
    } 
};

module.exports = countOccurrences;

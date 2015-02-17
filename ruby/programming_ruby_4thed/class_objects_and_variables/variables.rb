person1 = 'Tim'
person2 = person1.dup # duplicate variable
person1[0] = 'J'
puts "person1 is #{person1}"
puts "person2 is #{person2}"

person1 = 'Tim'
person2 = person1
person1.freeze # prevent modifications to the object
person2[0] = 'J'

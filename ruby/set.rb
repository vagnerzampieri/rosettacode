# frozen_string_literal: true

# Working with Set (conjunto)

Customer = Struct.new('Customer', :name, :age)

customer1 = Customer.new('Maggie Simpson', 1)
customer2 = Customer.new('Lisa Simpson', 8)
customer3 = Customer.new('Bart Simpson', 10)
customer4 = Customer.new('Marge Simpson', 36)
customer5 = Customer.new('Homer Simpson', 40)

Set1 = Set.new([customer1, customer2, customer3])
Set2 = Set.new([customer3, customer4, customer5])

# Union
puts 'Union'
puts Set1 | Set2

puts '-' * 80

# Intersection
puts 'Intersection'
puts Set1 & Set2

puts '-' * 80

# Difference
puts 'Difference'
puts Set1 - Set2

puts '-' * 80

# Subset
puts 'Subset'
puts Set1.subset?(Set2)

puts '-' * 80

# Superset
puts 'Superset'
puts Set1.superset?(Set2)

puts '-' * 80

# Disjoint
puts 'Disjoint'
puts Set1.disjoint?(Set2)

puts '-' * 80

# Add
puts 'Add'
Set1.add?(customer4)
puts Set1

puts '-' * 80

# Delete
puts 'Delete'
Set1.delete?(customer4)
puts Set1

puts '-' * 80

# Clear
puts 'Clear'
Set1.clear
puts Set1

puts '-' * 80

# Empty?
puts 'Empty?'
puts Set1.empty?

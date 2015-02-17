p a = [1, 3, 5, 7, 9]
p a[-1]
p a[-2]
p a[-99]

p '[start, count]'
p a[1, 3]
p a[3, 1]
p a[-3, 2]

p 'the two-period form include the end position'
p a[1..3]
p a[3..3]
p a[-3..-1]

p 'the three-period dorm does not'
p a[1...3]

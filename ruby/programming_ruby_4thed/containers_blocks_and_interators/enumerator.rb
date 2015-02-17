a = [1, 3, 'cat']
enum_a = a.each
enum_a.next
enum_a.next

short_enum = [1, 2, 3].to_enum
long_enum = ('a'..'z').to_enum

loop do
  p short_enum.next
end

loop do
  p long_enum.next
end
